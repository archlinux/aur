# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
pkgbase=heidisql
pkgname=(heidisql heidisql-qt6 heidisql-gtk2)
pkgver=12.13.1.1
pkgrel=5
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases."
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
makedepends=(lazarus qt6pas make fpc gettext gtk2 binutils)
source=(
  "https://github.com/HeidiSQL/HeidiSQL/archive/v${pkgver}.tar.gz"
  "https://github.com/HeidiSQL/HeidiSQL/releases/download/v${pkgver}/heidisql_${pkgver}_amd64.deb"
)
install="heidisql.install"
sha256sums=('SKIP' 'SKIP')

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
  
  # Extract translation files from official .deb package
  # The .deb contains pre-built .mo files (36 languages) that are built from Transifex
  # This is the only way to get all translations without Transifex access
  if [ -f "${srcdir}/heidisql_${pkgver}_amd64.deb" ]; then
    echo "Extracting translation files from official .deb package"
    (
      mkdir -p "${srcdir}/deb-extract"
      cd "${srcdir}/deb-extract"
      ar -x "${srcdir}/heidisql_${pkgver}_amd64.deb"
      bsdtar -xf data.tar.gz usr/share/heidisql/locale/ 2>/dev/null || true
      if [ -d "usr/share/heidisql/locale" ] && [ -n "$(find usr/share/heidisql/locale -name '*.mo' 2>/dev/null)" ]; then
        mkdir -p "${srcdir}/HeidiSQL-${pkgver}/extra/locale"
        cp -v usr/share/heidisql/locale/*.mo "${srcdir}/HeidiSQL-${pkgver}/extra/locale/" 2>/dev/null || true
        count=$(find "${srcdir}/HeidiSQL-${pkgver}/extra/locale" -name '*.mo' 2>/dev/null | wc -l)
        echo "Extracted $count translation files"
      fi
      cd "${srcdir}"
      rm -rf deb-extract
    )
  fi
}

build() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  export GITHUB=1
  
  # Build GTK2 version
  mkdir -p ./out/gtk2
  lazbuild --lazarusdir=/usr/lib/lazarus -B --bm=Release --ws=gtk2 heidisql.lpi
  mv -v ./out/heidisql ./out/gtk2/heidisql
  
  # Build Qt6 version
  lazbuild --lazarusdir=/usr/lib/lazarus -B --bm=Release --ws=qt6 heidisql.lpi
  mkdir -p ./out/qt6
  mv -v ./out/heidisql ./out/qt6/heidisql
}

package_heidisql() {
  pkgdesc="Metapackage for HeidiSQL - wrapper script and shared files (install heidisql-qt6 or heidisql-gtk2)"
  depends=(heidisql-client)
  optdepends=('heidisql-qt6: Qt6 variant' 'heidisql-gtk2: GTK2 variant')
  provides=(heidisql)
  arch=(any)
  
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/heidisql" << 'EOF'
#!/bin/bash
# Prefer GTK2, fallback to Qt6
if [ -x /usr/bin/heidisql-gtk2 ]; then
    exec /usr/bin/heidisql-gtk2 "$@"
elif [ -x /usr/bin/heidisql-qt6 ]; then
    exec /usr/bin/heidisql-qt6 "$@"
else
    echo "Error: No HeidiSQL variant found. Please install heidisql-gtk2 or heidisql-qt6." >&2
    exit 1
fi
EOF
  chmod +x "${pkgdir}/usr/bin/heidisql"
  
  # Install shared files
  # These are shared between both variants to avoid conflicts
  if [ -d "extra/locale" ]; then
    mkdir -p "${pkgdir}/usr/share/heidisql/locale"
    for mo_file in extra/locale/*.mo; do
      [ -f "$mo_file" ] && install -Dm644 "$mo_file" "${pkgdir}/usr/share/heidisql/locale/$(basename "$mo_file")"
    done
  fi
  
  if [ -d "extra/ini" ]; then
    mkdir -p "${pkgdir}/usr/share/heidisql"
    install -Dm644 extra/ini/*.ini "${pkgdir}/usr/share/heidisql/"
  fi
  
  mkdir -p "${pkgdir}/usr/share/doc/heidisql"
  [ -f "README.md" ] && install -Dm644 README.md "${pkgdir}/usr/share/doc/heidisql/"
  [ -f "LICENSE" ] && install -Dm644 LICENSE "${pkgdir}/usr/share/doc/heidisql/"
}

package_heidisql-qt6() {
  pkgdesc="HeidiSQL Qt6 variant - A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases (Qt6)"
  depends=(qt6pas mariadb-libs postgresql-libs libperconaserverclient sqlite)
  provides=(heidisql-client)
  
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  install -Dm755 "out/qt6/heidisql" "${pkgdir}/usr/bin/heidisql-qt6"
  
  install -Dm644 "package-skeleton/usr/share/applications/heidisql.desktop" \
    "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  sed -i 's/^Exec=heidisql/Exec=heidisql-qt6/' "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  sed -i 's/^Name=HeidiSQL/Name=HeidiSQL (Qt6)/' "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  
  install -Dm644 "res/deb-package-icon.png" "${pkgdir}/usr/share/pixmaps/heidisql-qt6.png"
  ln -s heidisql-qt6.png "${pkgdir}/usr/share/pixmaps/heidisql.png"
}

package_heidisql-gtk2() {
  pkgdesc="HeidiSQL GTK2 variant - A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases (GTK2)"
  depends=(gtk2 mariadb-libs postgresql-libs libperconaserverclient sqlite)
  provides=(heidisql-client)
  
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  if [ ! -f "out/gtk2/heidisql" ]; then
    echo "Warning: GTK2 binary not found, creating empty package"
    return 0
  fi
  
  install -Dm755 "out/gtk2/heidisql" "${pkgdir}/usr/bin/heidisql-gtk2"
  
  install -Dm644 "package-skeleton/usr/share/applications/heidisql.desktop" \
    "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  sed -i 's/^Exec=heidisql/Exec=heidisql-gtk2/' "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  sed -i 's/^Name=HeidiSQL/Name=HeidiSQL (GTK2)/' "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  
  install -Dm644 "res/deb-package-icon.png" "${pkgdir}/usr/share/pixmaps/heidisql-gtk2.png"
}
