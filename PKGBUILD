# Maintainer: Milkii Brewster <milkii on Freenode IRC>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name="BSchaffl"
_pkgname="${_name,,}.lv2"
_plugin_uri="https://www.jahnichen.de/plugins/lv2/${_name}"
pkgname="${_pkgname}-git"
pkgdesc="Pattern-controlled MIDI amp & time stretch plugin to produce shuffle / swing effects (git version)"
pkgver=1.2.0.r1.g3c6aee3
pkgrel=1
arch=(x86_64)
url="https://github.com/sjaehn/BSchaffl"
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
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  lv2lint -Mpack -I "${_name}.lv2/" "${_plugin_uri}"
}

package() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  # remove useless license file
  find "${pkgdir}/usr/lib/" -type f -iname "*LICENSE*" -delete
}
