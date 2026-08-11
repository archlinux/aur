# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=heidisql-qt6-git
pkgver=r732.9da8a802
pkgrel=2
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases (Qt6)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0-or-later')
makedepends=(lazarus make fpc gettext binutils qt6pas git python)
depends=(qt6pas heidisql mariadb-clients postgresql-libs sqlite freetds)
provides=("${pkgname%-git}" heidisql-client)
conflicts=("${pkgname%-git}")

source=(
  "${pkgname}::git+https://github.com/HeidiSQL/HeidiSQL.git#branch=lazarus"
  "lazarus-packages.py"
)
sha256sums=('SKIP'
            'ab24851adc733798ac05c22b9385e141bd5b654316426b92b3883384b2864a47')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  #LAZARUS_PKG_REPO="https://packages.lazarus-ide.org" \
  #LAZARUS_PKG_TMP="${srcdir}/lazarus-packages" \
  #LAZARUSDIR="/usr/lib/lazarus" \
  #python "${srcdir}/lazarus-packages.py"

  lazbuild --lazarusdir=/usr/lib/lazarus -B --bm=Release --ws=qt6 heidisql.lpi
}

package() {
  cd "${srcdir}/${pkgname}"
  
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm755 "out/heidisql" "${pkgdir}/usr/share/heidisql/heidisql-qt6"
  
  install -Dm644 "package-skeleton/usr/share/applications/heidisql.desktop" \
    "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  sed -i 's/^Exec=heidisql/Exec=heidisql --qt6/' "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  sed -i 's/^Name=HeidiSQL/Name=HeidiSQL (Qt6)/' "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
}



