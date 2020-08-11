# Maintainer: Milkii Brewster <milkii on freenode IRC>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name="Alo"
_pkgname="${_name,,}.lv2"
_plugin_uri="https://github.com/devcurmudgeon/${_name}"
pkgname="${_pkgname}-git"
pkgdesc="Looper plugin originally made for the MOD Duo hardware."
pkgver=0.7.r14.ge8cd661
pkgrel=1
arch=(x86_64)
url="https://github.com/devcurmudgeon/alo"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('cairo' 'gcc-libs' 'glibc' 'libx11')
makedepends=('git' 'lv2')
checkdepends=('lv2lint')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/devcurmudgeon/${_name}")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"/source
  make
}

check() {
  cd "${srcdir}/${_pkgname}"/source
  # echo lv2lint -Mpack -I "${_name}.lv2/" "${_plugin_uri}"
  # lv2lint -Mpack -I "${_name}.lv2/" "${_plugin_uri}"
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p $pkgdir/usr/lib/lv2
  cp -r source/alo.lv2 $pkgdir/usr/lib/lv2
}
