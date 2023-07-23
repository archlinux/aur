# Maintainer: Faruk Dikcizgi <boogiepop@gmx.de>
# Contributor: Jan Keith Darunday <aur@jkcdarunday.mozmail.com>
# Contributor: Jack Chen <redchenjs@live.com>

_kernel=linux-radxa-rkbsp5
pkgver=5.10.110
pkgbase=$_kernel-bin
pkgname=($pkgbase $pkgbase-headers)
blobcommit="9869c5a8aa0c103efac5a5d5eefe03468a6b8396"
fwcommit="488f49467f5b4adb8ae944221698e9a4f9acb0ed"
pkgrel=4
arch=('aarch64')
url="https://github.com/radxa/kernel"
_repourl="https://github.com/radxa/apt/raw/gh-pages/bullseye-stable/"
license=('GPL2')
options=('!strip')
makedepends=('binutils' 'tar' 'grep' 'mkinitcpio' 'sed')
pkgdesc="Precompiled Linux kernel package based on 5.10.x BSP kernel published by RADXA targetting rk3399 based rock4 and rk3588 based rock5 boards"

source=(
    "linux.preset"
    "extract-vmlinux"
    "extlinux.arch.template"
	"libmali_g610_wayland.so::https://github.com/JeffyCN/mirrors/raw/${blobcommit}/lib/aarch64-linux-gnu/libmali-valhall-g610-g6p0-wayland-gbm.so"
    "libmali_g610_x.so::https://github.com/JeffyCN/mirrors/raw/${blobcommit}/lib/aarch64-linux-gnu/libmali-valhall-g610-g6p0-x11-gbm.so"
    "https://github.com/JeffyCN/mirrors/raw/${fwcommit}/firmware/g610/mali_csffw.bin"
    "libmali"
    "libmaliw"
    )

sha512sums=('03cdaa19ff754c1b16cbfe8b08d38fed2f21c688a6e00d331ca53c4ef937c1cd3fdcfca2241d136238f220a87f3da04c1e6e192d262b4505f8bff3ddcbc8b9ad'
            'ba6edcd5f56a4c3e865578eabf1e1311b8e5e7babffdb0f84b99971238505ca27eba506f2723638129ef6558eba95f7e4fd2e07b40e5a4de716e5de90d1cbe79'
            'b09481badcc35acc5455b97545e87c706c5cb326e1b80237b2435d821c3c45002b44538095f3c5f3cfc720acf55bc27d97b0290e5cffa5acbdbaf0c2314f2d1b'
            'b42aa015773c3fc713e2e70fa39673049709d77a8492506605f54f84842a3fe5269986318dc74a99e674ebe0b11efd597f1f6087b0f348ac21b97a83824c6865'
            'd819e88ce1ffc5b5c8ec6759e504f14d16dae02bdca1eb7abdb560033981d4e342d360a7ce3f8b8240f0caaa88b9dc666ed8fd218bebbdbb439d1eb52f18488a'
            'fbcc7d4954a35d0c15a942f0fcb55d6423c3d2263b29a575f26a17d5e4acc75897bed46d89b2504934427078b8628691fbb4a872a2b6eb658192aa856eab9460'
            '49299ae1f06c78746e6ef5768c1850a433ed0dcaac833ef8d060783d63d37022b4b6ada6630f7a2089a4c3a176408fce5237f79e1171a63593ce58c0c8a2228f'
            '459d7b1f02983a3fd82b4aadaf753e2b23f634f1d1d8299f5067cd8edcda152d374f3b07be859e70bb293d62e74d7e6b65df1cf389be46318cfc4d4fd8e4d3af')

noextract=("${source[@]##*/}")

prepare() {
  cd "$srcdir"
  rm -rf $(find -mindepth 1 -maxdepth 1 -type d)
  
  mkdir -p debs
  cd debs

  # get the latest image version from debian repo
  local _latest=$(curl -Lk ${_repourl}db/packages.db | grep -oa "pool/main/l/linux-5.10-rock-5-latest.*" | sort -r | head -1)
  curl -L "${_repourl}${_latest}" -o latest.deb
  ar x "latest.deb"
  tar -m -xf control.tar.gz
  _imagever=$(cat control | grep -o linux-image-[A-Za-z0-9\.\-]*)
  _version=${_imagever#linux-image-}
  echo $_version > ../version
  rm -rf *
}

pkgver(){
  local _version="$(<version)"
  _version="${_version//-/.}"
  printf "${_version//rockchip./}"
}

_package-bin() {
  pkgdesc="Precompiled Linux kernel image based on 5.10.x BSP published by RADXA targetting rk3399 based rock4 and rk3588 based rock5 boards"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7' 'grep' 'gzip')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/$_kernel.preset")
  provides=("linux=${pkgver}" "linux-rkbsp")
  conflicts=('linux' 'libmali')

  cd "$srcdir/debs"
  local _version="$(<../version)"
  # download & extract image deb
  local _imagedeb=$(curl -Lk ${_repourl}db/packages.db | grep -oa "pool.*linux-image-$_version.*\.deb" | sort -r | head -1)
  curl -L "${_repourl}${_imagedeb}" -o image.deb
  ar x "image.deb"
  mkdir -p ../image
  tar -m -xf data.tar.xz -C ../image
  rm -rf *
  
  cd "$srcdir/image"

  install -dm755 "$pkgdir/boot"
  install -dm755 "$pkgdir/usr"
  
  # copy dtbs
  mkdir -p "$pkgdir/boot/dtbs/$_kernel"
  cp -raf "usr/lib/linux-image-${_version}/." "$pkgdir/boot/dtbs/$_kernel"
  
  # move rockchip/overlay directory to rockchip/overlays which is the common place for git and bin package
  mv "${pkgdir}/boot/dtbs/$_kernel/rockchip/overlay" "${pkgdir}/boot/dtbs/$_kernel/rockchip/overlays" | true


  # install extlinux template
  install -Dm755 ../extlinux.arch.template "$pkgdir/boot/extlinux/extlinux.arch.template"

  # copy modules
  cp -r lib "$pkgdir/usr/lib"

  # copy kernel, bootlaoder can not load compressed kernels
  ../extract-vmlinux "boot/vmlinuz-${_version}" > "$pkgdir/usr/lib/modules/$_version/vmlinuz"

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|$_kernel|g
    s|%KERNVER%|$_version|g
  "

  # install mkinitcpio preset file
  sed "$_subst" ../linux.preset |
    install -Dm644 /dev/stdin "$pkgdir/etc/mkinitcpio.d/$_kernel.preset"

  # used by mkinitcpio to name the kernel
  echo "$_kernel" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules/$_version/pkgbase"
  
  cd $srcdir
  # install the firmware
  install -Dm755 mali_csffw.bin $pkgdir/usr/lib/firmware/mali_csffw.bin

  # install blob drivers
  for d in x wayland; do
    install -Dm755 libmali_g610_$d.so $pkgdir/usr/lib/libmali/libmali_g610_$d.so
    install -dm755 $pkgdir/usr/lib/libmali/$d
    for l in libEGL.so libEGL.so.1 libgbm.so.1 libGLESv2.so libGLESv2.so.2 libGLESv2_CM.so libOpenCL.so.1; do
      ln -s ../libmali_g610_$d.so $pkgdir/usr/lib/libmali/$d/$l;
    done
  done

  # install the helper scripts
  install -Dm755 libmali $pkgdir/usr/bin/libmali
  install -Dm755 libmaliw $pkgdir/usr/bin/libmaliw
}

_package-bin-headers() {
  pkgdesc="Precompiled Linux kernel headers based on 5.10.x BSP kernel published by RADXA targetting rk3399 based rock4 and rk3588 based rock5 boards"
  provides=("linux-headers=${pkgver}" "linux-rkbsp-headers")
  conflicts=('linux-headers')

  cd "$srcdir/debs"
  local _version="$(<../version)"
  
  # download & extract header deb
  local _headersdeb=$(curl -Lk ${_repourl}db/packages.db | grep -oa "pool.*linux-headers-$_version.*\.deb" | sort -r | head -1)
  curl -L "${_repourl}${_headersdeb}" -o headers.deb
  ar x "headers.deb"
  mkdir -p ../headers
  tar -m -xf data.tar.xz -C ../headers
  rm -rf *

  cd "$srcdir/headers"
 
  install -dm755 "$pkgdir/usr/lib/modules/$_version"
  # copy headers
  cp -r "usr/src/linux-headers-$_version" "$pkgdir/usr/lib/modules/$_version/build"

  # add real version for building modules and running depmod from hook
  echo "$_version" |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules/$_version/build/version"
}

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$_kernel}")
    _package${_p#$_kernel}
  }"
done
