# Maintainer: Faruk Dikcizgi <boogiepop@gmx.de>
# Contributor: Jan Keith Darunday <aur@jkcdarunday.mozmail.com>
# Contributor: Jack Chen <redchenjs@live.com>

_kernel=linux-radxa-rkbsp5
pkgver=5.10.110
pkgbase=$_kernel-bin
pkgname=($pkgbase $pkgbase-headers)
pkgrel=2
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
    )
sha512sums=('03cdaa19ff754c1b16cbfe8b08d38fed2f21c688a6e00d331ca53c4ef937c1cd3fdcfca2241d136238f220a87f3da04c1e6e192d262b4505f8bff3ddcbc8b9ad'
            'ba6edcd5f56a4c3e865578eabf1e1311b8e5e7babffdb0f84b99971238505ca27eba506f2723638129ef6558eba95f7e4fd2e07b40e5a4de716e5de90d1cbe79'
            'b09481badcc35acc5455b97545e87c706c5cb326e1b80237b2435d821c3c45002b44538095f3c5f3cfc720acf55bc27d97b0290e5cffa5acbdbaf0c2314f2d1b')

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
  conflicts=('linux' )

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
