# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=heidisql-gtk2-git
pkgver=r451.3f9e867d
pkgrel=3
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases (GTK2)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0-or-later')
makedepends=(lazarus make fpc gettext binutils gtk2 git python)
depends=(gtk2 heidisql mariadb-libs postgresql-libs libperconaserverclient sqlite freetds)
provides=("${pkgname%-git}" heidisql-client)
conflicts=("${pkgname%-git}")

source=(
  "${pkgname}::git+https://github.com/HeidiSQL/HeidiSQL.git#branch=lazarus"
  "lazarus-packages.py"
)
sha256sums=('SKIP'
            '05aa04046bfb5fefd1824e6efd89b1ae9dbf27e09d29c10960c43e2671963fd3')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  
  LAZARUS_PKG_REPO="https://packages.lazarus-ide.org" \
  LAZARUS_PKG_TMP="${srcdir}/lazarus-packages" \
  LAZARUSDIR="/usr/lib/lazarus" \
  python "${srcdir}/lazarus-packages.py"

  lazbuild --lazarusdir=/usr/lib/lazarus -B --bm=Release --ws=gtk2 heidisql.lpi
}

package() {
  cd "${srcdir}/${pkgname}"
  
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm755 "out/heidisql" "${pkgdir}/usr/share/heidisql/heidisql-gtk2"
  
  install -Dm644 "package-skeleton/usr/share/applications/heidisql.desktop" \
    "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  sed -i 's/^Exec=heidisql/Exec=heidisql --gtk2/' "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  sed -i 's/^Name=HeidiSQL/Name=HeidiSQL (GTK2)/' "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
}

