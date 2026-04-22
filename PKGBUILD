# Maintained automatically by Beam release automation
pkgname=beam-launcher-bin
pkgver=1.0.14
pkgrel=2
pkgdesc="A blazing-fast, open-source command launcher for Linux"
arch=('x86_64')
url="https://github.com/krishkalaria12/beam"
license=('MIT')
depends=('gtk3' 'gtk-layer-shell' 'hicolor-icon-theme' 'libayatana-appindicator' 'librsvg' 'webkit2gtk-4.1')
optdepends=('dsearch-bin: faster file search backend')
provides=('beam')
conflicts=('beam')
options=('!strip')
source=(
  'beam-x86_64.deb::https://github.com/krishkalaria12/beam/releases/download/v1.0.14/beam_1.0.0_amd64.deb'
  'beam.desktop'
  'beam.png'
  'LICENSE'
)
noextract=('beam-x86_64.deb')
sha256sums=(
  '20351de9b9d01ccaed39e59ce9097349b48aefac35c239ab2b0790a6e66f9bc6'
  '7d15c07727daabdfda7d6f9296ee93f8c8f96d843d6c0d43bdcf5ca5b3902851'
  'a2a20586021b840189a4752a46d8a914ec13808d0da19173d165621a6102dd4b'
  'ac8271c92e0705cc6cdfa44336243253a98ef62dc35690c099fdb8597a553907'
)

package() {
  local extract_dir="${srcdir}/deb-extract"
  local data_archive=

  rm -rf "$extract_dir"
  mkdir -p "$extract_dir"
  bsdtar -xf "${srcdir}/beam-x86_64.deb" -C "$extract_dir"

  for candidate in "$extract_dir"/data.tar.*; do
    if [[ -f "$candidate" ]]; then
      data_archive="$candidate"
      break
    fi
  done

  if [[ -z "$data_archive" ]]; then
    echo "missing data archive in beam-x86_64.deb" >&2
    return 1
  fi

  bsdtar -xf "$data_archive" -C "${pkgdir}"

  install -Dm644 "${srcdir}/beam.desktop" "${pkgdir}/usr/share/applications/beam.desktop"
  install -Dm644 "${srcdir}/beam.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/beam.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/beam-launcher-bin/LICENSE"
}
