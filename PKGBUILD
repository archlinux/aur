# Maintainer: Faruk Dikcizgi <boogiepop@gmx.de>
# Contributor: Jan Keith Darunday <aur@jkcdarunday.mozmail.com>
# Contributor: Jack Chen <redchenjs@live.com>

_kernel=linux-radxa-rkbsp5
pkgver=5.10.110
pkgbase=$_kernel-bin
pkgname=($pkgbase $pkgbase-headers)
pkgrel=4
arch=('aarch64')
url="https://github.com/radxa/kernel"
license=('GPL2')
options=('!strip')
makedepends=('binutils' 'tar' 'grep' 'mkinitcpio' 'sed')
pkgdesc="Precompiled Linux kernel package based on 5.10.x BSP kernel published by RADXA targetting rk3399 based rock4 and rk3588 based rock5 boards"

source=(
	git+https://github.com/radxa-pkg/linux-rockchip.git#branch=main
    "linux.preset"
    "extract-vmlinux"
    "extlinux.arch.template"
    )

sha512sums=('SKIP'
            '03cdaa19ff754c1b16cbfe8b08d38fed2f21c688a6e00d331ca53c4ef937c1cd3fdcfca2241d136238f220a87f3da04c1e6e192d262b4505f8bff3ddcbc8b9ad'
            'ba6edcd5f56a4c3e865578eabf1e1311b8e5e7babffdb0f84b99971238505ca27eba506f2723638129ef6558eba95f7e4fd2e07b40e5a4de716e5de90d1cbe79'
            'b09481badcc35acc5455b97545e87c706c5cb326e1b80237b2435d821c3c45002b44538095f3c5f3cfc720acf55bc27d97b0290e5cffa5acbdbaf0c2314f2d1b')

noextract=("${source[@]##*/}")

prepare() {
  cd "$srcdir"
  rm -rf debs
  rm -rf image
  mkdir -p debs  

  cd "linux-rockchip"
  local _tag=$(git describe --tags)
   
  # get the latest image version from debian repo
  local _image=$(curl -Lk https://github.com/radxa-pkg/linux-rockchip/releases/expanded_assets/$_tag | grep -oa linux-image-5\.10\.110[0-9a-zA-Z._-]* | sort -r | head -1)
  echo $_image | grep -oa 5.10.110-[0-9]*-[a-zA-Z0-9]* | sort | head -1 > ../version
  echo $_image | grep -oa 5.10.110-[0-9]*-[a-zA-Z0-9]* | sort -r | head -1 > ../preversion
  echo $_tag > ../tag
}

pkgver(){
  local _version="$(<version)"
  _version="${_version//-/.}"
  printf "${_version//rockchip./}"
}

_package-bin() {
  pkgdesc="Precompiled Linux kernel image based on 5.10.x BSP published by RADXA targetting rk3399 based rock4 and rk3588 based rock5 boards"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7' 'grep' 'gzip' 'mali-valhall-g610-firmware')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/$_kernel.preset")
  provides=("linux=${pkgver}" "linux-rkbsp")
  conflicts=('linux')
  
  cd "$srcdir/debs"
  local _version="$(<../version)"
  local _preversion="$(<../preversion)"
  local _tag="$(<../tag)"
  # download & extract image deb
  local _image_url="https://github.com/radxa-pkg/linux-rockchip/releases/download/$_tag/linux-image-${_preversion}_${_version}_arm64.deb"

  curl -L "${_image_url}" -o image.deb
  ar x "image.deb"
  mkdir -p ../image
  tar -m -xf data.tar.xz -C ../image
  rm -rf *
  
  cd "$srcdir/image"

  install -dm755 "$pkgdir/boot"
  install -dm755 "$pkgdir/usr"
  
  # copy dtbs
  mkdir -p "$pkgdir/boot/dtbs/$_kernel"
  cp -raf "usr/lib/linux-image-${_preversion}/." "$pkgdir/boot/dtbs/$_kernel"
  
  # install extlinux template
  install -Dm755 ../extlinux.arch.template "$pkgdir/boot/extlinux/extlinux.arch.template"

  # copy modules
  cp -r lib "$pkgdir/usr/lib"

  # copy kernel, bootlaoder can not load compressed kernels
  ../extract-vmlinux "boot/vmlinuz-${_preversion}" > "$pkgdir/usr/lib/modules/$_preversion/vmlinuz"

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|$_kernel|g
    s|%KERNVER%|$_preversion|g
  "

  # install mkinitcpio preset file
  sed "$_subst" ../linux.preset |
    install -Dm644 /dev/stdin "$pkgdir/etc/mkinitcpio.d/$_kernel.preset"

  # used by mkinitcpio to name the kernel
  echo "$_kernel" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules/$_preversion/pkgbase"

}

_package-bin-headers() {
  pkgdesc="Precompiled Linux kernel headers based on 5.10.x BSP kernel published by RADXA targetting rk3399 based rock4 and rk3588 based rock5 boards"
  provides=("linux-headers=${pkgver}" "linux-rkbsp-headers")
  depends=("python")
  conflicts=('linux-headers')

  cd "$srcdir/debs"

  local _version="$(<../version)"
  local _preversion="$(<../preversion)"
  local _tag="$(<../tag)"
  # download & extract image deb
  local _header_url="https://github.com/radxa-pkg/linux-rockchip/releases/download/$_tag/linux-headers-${_preversion}_${_version}_arm64.deb"
    
  # download & extract header deb
  curl -L "${_header_url}" -o headers.deb
  ar x "headers.deb"
  mkdir -p ../headers
  tar -m -xf data.tar.xz -C ../headers
  rm -rf *

  cd "$srcdir/headers"
 
  install -dm755 "$pkgdir/usr/lib/modules/$_preversion"
  # copy headers
  cp -r "usr/src/linux-headers-$_preversion" "$pkgdir/usr/lib/modules/$_preversion/build"

  # add real version for building modules and running depmod from hook
  echo "$_preversion" |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules/$_preversion/build/version"
}

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$_kernel}")
    _package${_p#$_kernel}
  }"
done
