# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name="BAngr"
_pkgname="${_name,,}.lv2"
_plugin_uri="https://www.jahnichen.de/plugins/lv2/${_name}"
pkgname="${_pkgname}-git"
pkgdesc="A multi-dimensional dynamically distorted staggered multi-bandpass LV2 plugin (git version)"
pkgver=1.2.0.r0.g71f3bc6
pkgrel=1
arch=('x86_64')
url="https://github.com/sjaehn/${_name}"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('cairo' 'gcc-libs' 'glibc' 'libx11')
makedepends=('git' 'lv2')
checkdepends=('lv2lint')
provides=("${_name,,}" "${_name,,}=${pkgver//.r*/}" "${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_name,,}" "${_pkgname}")
source=("${_pkgname}::git+https://github.com/sjaehn/${_name}")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/$_pkgname"
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  lv2lint -Mpack -I "${_name}.lv2/" "${_plugin_uri}"
}

package() {
  cd "$_pkgname"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  # Remove misplaced license file
  find "${pkgdir}/usr/lib/lv2/${_name}.lv2" -type f -iname "*LICENSE*" -delete
}
