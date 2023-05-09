# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Maintainer: SanskritFritz (gmail)
# Contributor: Hawath <hawath at 163 dot com>

_pkgname=treesheets
pkgname=$_pkgname-git
pkgver=r451.3694b16
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

sha512sums=('SKIP'
            '8fc4872d8e430899d21e95d6009dea8dde50ba5854a245b4b78901cebf82e3275b23b92f5afe9c5e2f11c34e1d73cd1657d48a3f8aa937eedfc576f2e62bcd77')

pkgver() {
  cd $_pkgname

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  patch --binary -p1 < ../myframe.patch
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
