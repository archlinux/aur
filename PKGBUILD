pkgname=streambooru-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="StreamBooru — cross‑platform Electron app to browse multiple booru sites"
arch=('x86_64')
url="https://github.com/Amateur-God/StreamBooru"
license=('GPL3')

# Common Electron runtime deps on Arch
depends=('alsa-lib' 'nss' 'gtk3' 'libxss' 'libxtst')
optdepends=(
  'libappindicator-gtk3: tray icon support'
  'libnotify: desktop notifications'
  'xdg-utils: open links with xdg-open'
)

provides=('streambooru')
conflicts=('streambooru')

# The release asset is named exactly: streambooru-${pkgver}.tar.gz
# Rename locally to have a stable filename in $srcdir.
source=(
  "streambooru-${pkgver}.tar.gz::https://github.com/Amateur-God/StreamBooru/releases/download/v${pkgver}/streambooru-${pkgver}.tar.gz"
  "streambooru.sh"
  "streambooru.desktop"
)
sha256sums=(
  'da9c324c99e2c4405cd58aaed447ce319a942ae5307b7a2fccc00c0a2bb21a55'  # SHA256 of v${pkgver}/streambooru-${pkgver}.tar.gz
  'SKIP'
  'SKIP'
)

package() {
  install -d "${pkgdir}/opt/streambooru-bin" \
             "${pkgdir}/usr/bin" \
             "${pkgdir}/usr/share/applications"

  # Robust extraction: works whether tarball has top-level folder or not
  local _tmp="${srcdir}/_extract"
  mkdir -p "${_tmp}"
  tar -xzf "${srcdir}/streambooru-${pkgver}.tar.gz" -C "${_tmp}"

  # Try to find directory where Electron binary lives
  local _app_src=""
  local _cand
  _cand="$(find "${_tmp}" -maxdepth 2 -type f \( -name streambooru -o -name StreamBooru \) -printf '%h\n' -quit)"
  if [[ -n "${_cand}" && -d "${_cand}" ]]; then
    _app_src="${_cand}"
  else
    # Fallback: single top-level dir, else extract root
    mapfile -t _tops < <(find "${_tmp}" -mindepth 1 -maxdepth 1 -type d)
    if [[ ${#_tops[@]} -eq 1 ]]; then
      _app_src="${_tops[0]}"
    else
      _app_src="${_tmp}"
    fi
  fi

  # Install payload
  cp -a "${_app_src}/." "${pkgdir}/opt/streambooru-bin/"

  # Electron sandbox helper (if present)
  if [[ -f "${pkgdir}/opt/streambooru-bin/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/streambooru-bin/chrome-sandbox" || true
  fi

  # CLI wrapper + compatibility symlink
  install -Dm755 "${srcdir}/streambooru.sh" "${pkgdir}/usr/bin/streambooru"
  ln -s streambooru "${pkgdir}/usr/bin/streambooru-bin"

  # Desktop entry (generic icon)
  install -Dm644 "${srcdir}/streambooru.desktop" "${pkgdir}/usr/share/applications/streambooru.desktop"
}
