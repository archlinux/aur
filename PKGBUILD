# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=heidisql-qt5
pkgver=12.14.1.1
pkgrel=5
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases (Qt5)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
makedepends=(lazarus make fpc gettext binutils qt5pas)
depends=(qt5pas heidisql mariadb-libs postgresql-libs libperconaserverclient sqlite freetds)
provides=(heidisql-client)
conflicts=(heidisql-common)

source=("https://github.com/HeidiSQL/HeidiSQL/archive/v${pkgver}.tar.gz")
sha256sums=('0e240b55be181bf4b8321a45b47242fe62b211ba9ca77d433d5bb700a201fb01')

build() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  mkdir -p ./out/qt5
  lazbuild --lazarusdir=/usr/lib/lazarus -B --bm=Release --ws=qt5 heidisql.lpi
  mv -v ./out/heidisql ./out/qt5/heidisql
}

package() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm755 "out/qt5/heidisql" "${pkgdir}/usr/share/heidisql/heidisql-qt5"
  
  install -Dm644 "package-skeleton/usr/share/applications/heidisql.desktop" \
    "${pkgdir}/usr/share/applications/heidisql-qt5.desktop"
  sed -i 's/^Exec=heidisql/Exec=heidisql --qt5/' "${pkgdir}/usr/share/applications/heidisql-qt5.desktop"
  sed -i 's/^Name=HeidiSQL/Name=HeidiSQL (Qt5)/' "${pkgdir}/usr/share/applications/heidisql-qt5.desktop"
}
