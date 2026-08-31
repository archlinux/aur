# Maintainer: melonion <aur at melonion dot me>

_pkgname='cpub'
pkgname="${_pkgname}-git"
pkgver=r6.e6582ad
pkgrel=1
pkgdesc='ncurses based epub reader for the command line'
arch=('any')
url="https://github.com/udiboy1209/${_pkgname}"
license=(unknown)
depends=(python-beautifulsoup4 python-html5lib)
provides=("${_pkgname}")
conflicts=()
optdepends=()
source=("git+${url}" 'ncx-relative-paths.patch')
sha512sums=('SKIP'
            '98c72975faea7fcdd541e1e067f2b702bfdade7913e2626880631159ce18125f6bcd718c8cf0bc40758caac0728141e73c6be72788513ecd61db56fdc7ce0207')

# Upstream is unmaintained (last commit 2020-08-26), so fixes are carried here.
prepare() {
  cd "${srcdir}/${_pkgname}/"
  patch -Np1 -i "${srcdir}/ncx-relative-paths.patch"
}

package() {
  set -x
  cd "${srcdir}/${_pkgname}/"
  install -D --target-directory "${pkgdir}/usr/bin" cpub
}

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
