# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=heidisql-gtk2-git
pkgver=r262.93bf989a
pkgrel=7
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases (GTK2)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
makedepends=(lazarus make fpc gettext binutils gtk2 git)
depends=(gtk2 heidisql mariadb-libs postgresql-libs libperconaserverclient sqlite freetds)
provides=("${pkgname%-git}" heidisql-client)
conflicts=("${pkgname%-git}" heidisql-common)

source=("${pkgname}::git+https://github.com/HeidiSQL/HeidiSQL.git#branch=lazarus")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  
  mkdir -p ./out/gtk2
  lazbuild --lazarusdir=/usr/lib/lazarus -B --bm=Release --ws=gtk2 heidisql.lpi
  mv -v ./out/heidisql ./out/gtk2/heidisql
}

package() {
  cd "${srcdir}/${pkgname}"
  
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm755 "out/gtk2/heidisql" "${pkgdir}/usr/share/heidisql/heidisql-gtk2"
  
  install -Dm644 "package-skeleton/usr/share/applications/heidisql.desktop" \
    "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  sed -i 's/^Exec=heidisql/Exec=heidisql --gtk2/' "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  sed -i 's/^Name=HeidiSQL/Name=HeidiSQL (GTK2)/' "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
}

