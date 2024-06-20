# Contributor: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Hawath <hawath at 163 dot com>
# Maintainer: SanskritFritz (gmail)

pkgname=treesheets
pkgver=9559986596
pkgrel=1
pkgdesc='A "hierarchical spreadsheet" as a replacement for spreadsheets, mind mappers, outliners, PIMs, text editors and small databases.'
url="https://strlen.com/treesheets/"
license=('ZLIB')
depends=('wxwidgets-qt5')
makedepends=('cmake')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')

source=(
  "https://github.com/aardappel/treesheets/archive/refs/tags/$pkgver.tar.gz"
  'myframe.patch'
)

sha512sums=('1eb8df4bdf1530814768d1a32ea035f781f5517eecc57a1e728aed699759a2e0e09ccdca72854765ae93330bc9e99fd19b710b305979ede977d9017791ab9c9f'
            '8fc4872d8e430899d21e95d6009dea8dde50ba5854a245b4b78901cebf82e3275b23b92f5afe9c5e2f11c34e1d73cd1657d48a3f8aa937eedfc576f2e62bcd77')

prepare() {
  cd $pkgname-$pkgver

  patch --binary -p1 < ../myframe.patch
  find TS/images -type f ! -iname '*.png' -a ! -iname '*.svg' -delete
}

build() {
  cd $pkgname-$pkgver

  cmake -S . -B _build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_PROGRAM_PATH=wx-config-qt

  make -C _build
}

package() {
  cd $pkgname-$pkgver

  # install using default configuration
  make -C _build DESTDIR="${pkgdir}/" install

  # install license
  install -Dm644 ZLIB_LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
