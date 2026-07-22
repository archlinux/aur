# Maintainer: Markus Hartung <mail@hartmark.se>

pkgname=junie-eap
_binname=junie
provides=('junie')
conflicts=('junie')

pkgver=2144.5
pkgrel=1
pkgdesc="Junie command‑line client"
arch=('x86_64' 'aarch64')
options=('staticlibs')
url="https://github.com/jetbrains/junie"

license=('LicenseRef-Junie')
# License details: https://www.jetbrains.com/legal/docs/terms/jetbrains-junie/

depends=(
  'bash'
  'glibc'
  'gcc-libs'
  'java-runtime'
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
            'cb1277b44d0cf8fe650685013b5d4fa4ac01f4f7c42cc90c94990c9dfde71b7ff19210d0f9c766990d56058c0516ddd5b4ba9710da30ceed27cd11dbb1288c52')

_latest_eap_version() {
  jq -r '.version' "$srcdir/$pkgname/update-info-eap.jsonl" | sort -V | tail -n 1
}

_eap_download_url() {
  local _version="$1"
  local _platform="$2"
  local _url

  _url=$(jq -rse --arg version "$_version" --arg platform "$_platform" '
    map(select(.version == $version and .platform == $platform and .downloadUrl? != null))
    | .[0].downloadUrl
  ' "$srcdir/$pkgname/update-info-eap.jsonl" 2>/dev/null)

  if [[ -z "$_url" || "$_url" == "null" ]]; then
    _url="https://github.com/JetBrains/junie/releases/download/${_version}/junie-eap-${_version}-${_platform}.zip"
  fi

  echo "$_url"
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

  if [[ "$CARCH" == "aarch64" ]]; then
    _platform="linux-aarch64"
  else
    _platform="linux-amd64"
  fi

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

