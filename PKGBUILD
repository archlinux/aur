# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Maintainer: SanskritFritz (gmail)
# Contributor: Hawath <hawath at 163 dot com>

_pkgname=treesheets
pkgname=$_pkgname-git
pkgver=r369.a962f73
pkgrel=1
pkgdesc='A "hierarchical spreadsheet" as a replacement for spreadsheets, mind mappers, outliners, PIMs, text editors and small databases.'
url="https://strlen.com/treesheets/"
license=('ZLIB')
depends=('wxwidgets-qt5')
makedepends=('cmake' 'git')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
provides=('treesheets')
conflicts=('treesheets')

source=(
  "git+https://github.com/aardappel/$_pkgname.git"
  'myframe.patch'
)

sha512sums=(
  'SKIP'
  '7ea8b6947c334adebba774bcdd4db27670206a216de0c023c2b69aa3ad3b621165733a36f03f2e23bab1e7721982a24c29c4446754ba79c11c5735961ad04816'
)

pkgver() {
  cd $_pkgname

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  patch -p1 < ../myframe.patch
  find TS/images -type f ! -iname '*.png' -a ! -iname '*.svg' -delete
}

build() {
  cd $_pkgname

  cmake -S . -B _build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make -C _build
}

package() {
  cd $_pkgname

  # install using default configuration
  make -C _build DESTDIR="${pkgdir}/" install

  # install license
  install -Dm644 ZLIB_LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
