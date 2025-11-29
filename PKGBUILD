# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=heidisql-qt5
pkgver=12.13.1.1
pkgrel=5
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and SQLite databases (Qt5)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
makedepends=(lazarus make fpc gettext binutils qt5pas)
depends=(qt5pas heidisql-common mariadb-libs postgresql-libs libperconaserverclient sqlite)
provides=(heidisql-client)

source=("https://github.com/HeidiSQL/HeidiSQL/archive/v${pkgver}.tar.gz")
sha256sums=('e9db116b0f3d8aa2300fde3266056452425304791393d84786ac9c0350ddc2b5')

prepare() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  # Patch: Force both Qt5 and GTK2 versions to use the same config directory (.config/heidisql)
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
