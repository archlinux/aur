# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=heidisql-common
pkgver=12.14.1.1
pkgrel=2
pkgdesc="Shared files for HeidiSQL (wrapper script, locale files, ini files, documentation)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
makedepends=(curl jq)

source=(
  "https://github.com/HeidiSQL/HeidiSQL/archive/v${pkgver}.tar.gz"
  heidisql
)
sha256sums=('0e240b55be181bf4b8321a45b47242fe62b211ba9ca77d433d5bb700a201fb01'
            '46ef8b2c4207d88dd732b70dbc6c012ab0dd7b40d3229227ecfee9153eff3feb')

prepare() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  # Fetch compiled translations directly from the daily Transifex snapshots
  # served by heidisql.com instead of extracting them from the .deb package.
  echo "Downloading translation files from heidisql.com"
  local locale_dir="${srcdir}/HeidiSQL-${pkgver}/extra/locale"
  mkdir -p "${locale_dir}"

  local base_url="https://www.heidisql.com/downloads/locale/"
  local index_file
  index_file="$(mktemp)"

  curl -fsSL "${base_url}" -o "${index_file}" || exit 1

  mapfile -t locales < <(jq -r '.[] | select(length>0)' "${index_file}")
  rm -f "${index_file}"

  if [ "${#locales[@]}" -eq 0 ]; then
    echo "Locale index is empty or invalid" >&2
    exit 1
  fi

  local downloaded=0
  for name in "${locales[@]}"; do
    echo "Downloading ${base_url}${name}"
    if curl -fsSL "${base_url}${name}" -o "${locale_dir}/${name}"; then
      downloaded=$((downloaded + 1))
    else
      echo "Failed to download ${name}" >&2
      exit 1
    fi
  done

  echo "Downloaded ${downloaded} locale files"
}

package() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  # Install shared locale files
  if [ -d "extra/locale" ]; then
    mkdir -p "${pkgdir}/usr/share/heidisql/locale"
    for mo_file in extra/locale/*.mo; do
      [ -f "$mo_file" ] && install -Dm644 "$mo_file" "${pkgdir}/usr/share/heidisql/locale/$(basename "$mo_file")"
    done
    
    # # Create symlinks for both qt6 and gtk2 variants
    # # The app looks for .mo files matching the executable basename
    # for mo_file in extra/locale/heidisql.*.mo; do
    #   if [ -f "$mo_file" ]; then
    #     lang_code=$(basename "$mo_file" | sed 's/^heidisql\.//' | sed 's/\.mo$//')
    #     ln -sf "heidisql.${lang_code}.mo" "${pkgdir}/usr/share/heidisql/locale/heidisql-qt6.${lang_code}.mo"
    #     ln -sf "heidisql.${lang_code}.mo" "${pkgdir}/usr/share/heidisql/locale/heidisql-gtk2.${lang_code}.mo"
    #   fi
    # done
  fi
  
  # Install shared ini files
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm644 extra/ini/*.ini "${pkgdir}/usr/share/heidisql/"

  # Install icon
  install -Dm644 res/deb-package-icon.png "${pkgdir}/usr/share/pixmaps/heidisql.png"
  
  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/heidisql"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/heidisql/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/doc/heidisql/"
  install -Dm644 package-skeleton/usr/share/doc/heidisql/copyright "${pkgdir}/usr/share/doc/heidisql/"

  # Install wrapper script that selects the appropriate variant (gtk2/qt5/qt6)
  install -Dm755 "${srcdir}/heidisql" "${pkgdir}/usr/bin/heidisql"
}

