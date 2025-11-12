# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
pkgbase=heidisql
pkgname=(heidisql heidisql-qt6 heidisql-gtk2)
pkgver=12.13.1.1
pkgrel=8
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases."
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
makedepends=(lazarus qt6pas make fpc gettext gtk2 binutils)
_deb_filename="heidisql_${pkgver}_amd64.deb"
source=(
  "https://github.com/HeidiSQL/HeidiSQL/archive/v${pkgver}.tar.gz"
  "${_deb_filename}::https://github.com/HeidiSQL/HeidiSQL/releases/download/v${pkgver}/${_deb_filename}"
)
noextract=("${_deb_filename}")
install="heidisql.install"
sha256sums=('e9db116b0f3d8aa2300fde3266056452425304791393d84786ac9c0350ddc2b5'
            'e871bb5cf92476d026bd8c5887cb2a83e6f13877adb077ef5fbdd2edf2936122')

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
  # It contains pre-built .mo files that are built from Transifex
  # This is the only way to get all translations without Transifex access
  echo "Extracting translation files from official .deb package"
  (
    mkdir -p "${srcdir}/deb-extract"
    cd "${srcdir}/deb-extract"
    ar -x "${srcdir}/${_deb_filename}"
    bsdtar -xf data.tar.gz usr/share/heidisql/locale/
    if [ -d "usr/share/heidisql/locale" ] && [ -n "$(find usr/share/heidisql/locale -name '*.mo' 2>/dev/null)" ]; then
      mkdir -p "${srcdir}/HeidiSQL-${pkgver}/extra/locale"
      cp -v usr/share/heidisql/locale/*.mo "${srcdir}/HeidiSQL-${pkgver}/extra/locale/"
      count=$(find "${srcdir}/HeidiSQL-${pkgver}/extra/locale" -name '*.mo' 2>/dev/null | wc -l)
      echo "Extracted $count translation files"
    fi
    cd "${srcdir}"
    rm -rf deb-extract
  )
}

build() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
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
  depends=(heidisql-client mariadb-libs postgresql-libs libperconaserverclient sqlite)
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
    
    # Create symlinks for both qt6 and gtk2 variants
    # The app looks for .mo files matching the executable basename
    for mo_file in extra/locale/heidisql.*.mo; do
      if [ -f "$mo_file" ]; then
        lang_code=$(basename "$mo_file" | sed 's/^heidisql\.//' | sed 's/\.mo$//')
        ln -sf "heidisql.${lang_code}.mo" "${pkgdir}/usr/share/heidisql/locale/heidisql-qt6.${lang_code}.mo"
        ln -sf "heidisql.${lang_code}.mo" "${pkgdir}/usr/share/heidisql/locale/heidisql-gtk2.${lang_code}.mo"
      fi
    done
  fi
  
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm644 extra/ini/*.ini "${pkgdir}/usr/share/heidisql/"
  
  mkdir -p "${pkgdir}/usr/share/doc/heidisql"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/heidisql/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/doc/heidisql/"
}

package_heidisql-qt6() {
  pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases (Qt6)"
  depends=(qt6pas heidisql)
  provides=(heidisql-client)
  
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
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

package_heidisql-gtk2() {
  pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases (GTK2)"
  depends=(gtk2 heidisql)
  provides=(heidisql-client)
  
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
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
