# Maintainer: Markus Hartung <mail@hartmark.se>

pkgname=junie-eap
_binname=junie
provides=('junie')
conflicts=('junie')

pkgver=1892.12
pkgrel=1
pkgdesc="Junie command‑line client"
arch=('x86_64' 'aarch64')
options=('!strip' 'staticlibs')
url="https://github.com/jetbrains/junie"

license=('LicenseRef-Junie')
# License details: https://www.jetbrains.com/legal/docs/terms/jetbrains-junie/

depends=(
  'bash'
  'glibc'
  'gcc-libs'
  'zlib'
  'libx11'
  'libxext'
  'libxrender'
  'libxi'
  'libxtst'
  'alsa-lib'
  'freetype2'
  'harfbuzz'
  'libpng'
  'libjpeg-turbo'
  'lcms2'
  'giflib'
  'pcsclite'
)
makedepends=('git' 'unzip' 'curl' 'jq')
optdepends=()

source=("$pkgname::git+https://github.com/jetbrains/junie.git"
        'LICENSE')
sha512sums=('SKIP'
            'SKIP')

_latest_eap_version() {

  jq -rs '
    def blacklist: [];

    map(
      select(.version? != null)
      | select(.version as $v | blacklist | index($v) | not)
      | .version
    )
    | max_by(split(".") | map(tonumber))
  ' "$srcdir/$pkgname/update-info-eap.jsonl"
}

_eap_download_url() {
  local _version="$1"
  local _platform="$2"

  jq -rse --arg version "$_version" --arg platform "$_platform" '
    map(select(.version == $version and .platform == $platform and .downloadUrl? != null))
    | .[0].downloadUrl
  ' "$srcdir/$pkgname/update-info-eap.jsonl"
}

pkgver() {
  cd "$pkgname"
  _latest_eap_version
}

prepare() {
  cd "$srcdir"
  local _version
  local _platform
  local _download_url
  local _archive

  _version="$(_latest_eap_version)"

  case "$CARCH" in
    x86_64) _platform="linux-amd64" ;;
    aarch64) _platform="linux-aarch64" ;;
    *)
      printf 'Unsupported architecture: %s\n' "$CARCH" >&2
      return 1
      ;;
  esac

  if ! _download_url="$(_eap_download_url "$_version" "$_platform")"; then
    printf 'No download URL found for version %s on %s\n' "$_version" "$_platform" >&2
    return 1
  fi

  _archive="junie-eap-${_version}-${_platform}.zip"

  curl -fLo "$_archive" "$_download_url"
  unzip -o "$_archive"
}

package() {
    cd "${srcdir}"

    install -dm755 \
        "${pkgdir}/usr/bin" \
        "${pkgdir}/usr/lib/${pkgname}" \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -R --no-preserve=ownership \
        "${srcdir}/junie-app/"* \
        "${pkgdir}/usr/lib/${pkgname}/"

    cat << 'EOF' > "${pkgdir}/usr/bin/${_binname}"
#!/usr/bin/env bash
exec /usr/lib/junie-eap/bin/junie "$@"
EOF

    chmod 755 "${pkgdir}/usr/bin/${_binname}"

    install -Dm644 \
        "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

