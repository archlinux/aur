# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=heidisql-qt6-git
pkgver=r258.fbe32db8
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases (Qt6)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
makedepends=(lazarus make fpc gettext binutils qt6pas git)
depends=(qt6pas heidisql-common mariadb-libs postgresql-libs libperconaserverclient sqlite freetds)
provides=(heidisql-client heidisql heidisql-qt6)
conflicts=(heidisql-qt6)

source=("${pkgname}::git+https://github.com/HeidiSQL/HeidiSQL.git#branch=lazarus")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  
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
  cd "${srcdir}/${pkgname}"
  
  mkdir -p ./out/qt6
  lazbuild --lazarusdir=/usr/lib/lazarus -B --bm=Release --ws=qt6 heidisql.lpi
  mv -v ./out/heidisql ./out/qt6/heidisql
}

package() {
  cd "${srcdir}/${pkgname}"
  
  # Install the actual binary to /usr/share/heidisql/ (where locale files are located)
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm755 "out/qt6/heidisql" "${pkgdir}/usr/share/heidisql/heidisql-qt6"
  
  # Create a wrapper script in /usr/bin that calls the actual binary
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/heidisql-qt6" << 'EOF'
#!/bin/bash
exec /usr/share/heidisql/heidisql-qt6 "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/heidisql-qt6"
  
  install -Dm644 "package-skeleton/usr/share/applications/heidisql.desktop" \
    "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  sed -i 's/^Exec=heidisql/Exec=heidisql-qt6/' "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  sed -i 's/^Name=HeidiSQL/Name=HeidiSQL (Qt6)/' "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  
  install -Dm644 "res/deb-package-icon.png" "${pkgdir}/usr/share/pixmaps/heidisql-qt6.png"
  ln -s heidisql-qt6.png "${pkgdir}/usr/share/pixmaps/heidisql.png"
}



