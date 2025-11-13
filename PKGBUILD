# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
pkgname=heidisql-common
pkgver=12.13.1.1
pkgrel=1
pkgdesc="Shared files for HeidiSQL (locale files, ini files, documentation)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
makedepends=(lazarus make fpc gettext binutils)

_deb_filename="heidisql_${pkgver}_amd64.deb"
source=(
  "https://github.com/HeidiSQL/HeidiSQL/archive/v${pkgver}.tar.gz"
  "${_deb_filename}::https://github.com/HeidiSQL/HeidiSQL/releases/download/v${pkgver}/${_deb_filename}"
)
noextract=("${_deb_filename}")
sha256sums=('e9db116b0f3d8aa2300fde3266056452425304791393d84786ac9c0350ddc2b5'
            'e871bb5cf92476d026bd8c5887cb2a83e6f13877adb077ef5fbdd2edf2936122')

prepare() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
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

package() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  # Install shared locale files
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
  
  # Install shared ini files
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm644 extra/ini/*.ini "${pkgdir}/usr/share/heidisql/"
  
  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/heidisql"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/heidisql/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/doc/heidisql/"
}

