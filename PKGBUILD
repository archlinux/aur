# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=heidisql-gtk2-git
pkgver=r257.a1c84ae5
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases (GTK2)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
makedepends=(lazarus make fpc gettext binutils gtk2 git)
depends=(gtk2 heidisql-common mariadb-libs postgresql-libs libperconaserverclient sqlite freetds)
provides=(heidisql-client heidisql heidisql-gtk2)
conflicts=(heidisql-gtk2)

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
  
  mkdir -p ./out/gtk2
  # Build with GTK2 widgetset - lazarus branch requires actual GTK2 libraries
  lazbuild --lazarusdir=/usr/lib/lazarus -B --bm=Release --ws=gtk2 heidisql.lpi
  mv -v ./out/heidisql ./out/gtk2/heidisql
}

package() {
  cd "${srcdir}/${pkgname}"
  
  # Install the actual binary to /usr/share/heidisql/ (where locale files are located)
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm755 "out/gtk2/heidisql" "${pkgdir}/usr/share/heidisql/heidisql-gtk2"
  
  # Create a wrapper script in /usr/bin that calls the actual binary
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/heidisql-gtk2" << 'EOF'
#!/bin/bash
exec /usr/share/heidisql/heidisql-gtk2 "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/heidisql-gtk2"
  
  install -Dm644 "package-skeleton/usr/share/applications/heidisql.desktop" \
    "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  sed -i 's/^Exec=heidisql/Exec=heidisql-gtk2/' "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  sed -i 's/^Name=HeidiSQL/Name=HeidiSQL (GTK2)/' "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  
  install -Dm644 "res/deb-package-icon.png" "${pkgdir}/usr/share/pixmaps/heidisql-gtk2.png"
}

