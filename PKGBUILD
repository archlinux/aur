# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=heidisql-qt6
pkgver=12.14.1.1
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases (Qt6)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
makedepends=(lazarus make fpc gettext binutils qt6pas)
depends=(qt6pas heidisql heidisql-common mariadb-libs postgresql-libs libperconaserverclient sqlite freetds)

source=("https://github.com/HeidiSQL/HeidiSQL/archive/v${pkgver}.tar.gz")
sha256sums=('0e240b55be181bf4b8321a45b47242fe62b211ba9ca77d433d5bb700a201fb01')

prepare() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  # Patch: Force both Qt6 and GTK2 versions to use the same config directory (.config/heidisql)
  # This ensures settings are shared between both variants
  echo "Patching config directory to use shared 'heidisql' folder"
  sed -i 's|FDirnameUserAppData := GetAppConfigDir(False);|// Force shared config directory: always use "heidisql" regardless of executable name\
    if GetEnvironmentVariable('"'"'XDG_CONFIG_HOME'"'"').IsEmpty then\
      FDirnameUserAppData := GetEnvironmentVariable('"'"'HOME'"'"') + '"'"'/.config/heidisql'"'"'\
    else\
      FDirnameUserAppData := GetEnvironmentVariable('"'"'XDG_CONFIG_HOME'"'"') + '"'"'/heidisql'"'"';|' source/apphelpers.pas
}

build() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  mkdir -p ./out/qt6
  lazbuild --lazarusdir=/usr/lib/lazarus -B --bm=Release --ws=qt6 heidisql.lpi
  mv -v ./out/heidisql ./out/qt6/heidisql
}

package() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm755 "out/qt6/heidisql" "${pkgdir}/usr/share/heidisql/heidisql-qt6"
  
  install -Dm644 "package-skeleton/usr/share/applications/heidisql.desktop" \
    "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  sed -i 's/^Exec=heidisql/Exec=heidisql --qt6/' "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  sed -i 's/^Name=HeidiSQL/Name=HeidiSQL (Qt6)/' "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
}

