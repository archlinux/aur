# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>

pkgname=lmm-api-go-bin
pkgver=0.1.7
pkgrel=1
pkgdesc='LMM API Go backend, native CLI, systemd service, and web frontend (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/api.lmm.best'
license=('AGPL-3.0-only')
depends=('ca-certificates' 'systemd' 'tzdata')
makedepends=('cosign')
optdepends=(
  'postgresql: production database'
  'valkey: cache, rate limiting, and login sessions'
)
provides=("lmm-api-go=${pkgver}")
conflicts=('lmm-api' 'lmm-api-bin' 'lmm-api-git' 'lmm-api-go' 'lmm-api-go-git')
backup=('etc/lmm-api-go/lmm-api-go.env')
options=('!strip')

_release_tag="go-v${pkgver}"
_artifact="lmm-api-go-${pkgver}-linux"
_release_base="${url}/releases/download/${_release_tag}"
source_x86_64=(
  "${_artifact}-amd64.tar.gz::${_release_base}/${_artifact}-amd64.tar.gz"
  "${_artifact}-amd64.tar.gz.sha256::${_release_base}/${_artifact}-amd64.tar.gz.sha256"
  "${_artifact}-amd64.tar.gz.sigstore.json::${_release_base}/${_artifact}-amd64.tar.gz.sigstore.json"
)
source_aarch64=(
  "${_artifact}-arm64.tar.gz::${_release_base}/${_artifact}-arm64.tar.gz"
  "${_artifact}-arm64.tar.gz.sha256::${_release_base}/${_artifact}-arm64.tar.gz.sha256"
  "${_artifact}-arm64.tar.gz.sigstore.json::${_release_base}/${_artifact}-arm64.tar.gz.sigstore.json"
)
noextract=("${_artifact}-amd64.tar.gz" "${_artifact}-arm64.tar.gz")
sha256sums_x86_64=(
  'f07110a4623ff0a98499dda01a0cc740ff6fa90d092ebdab835cf5949adb4274'
  '347723806151cad227e2d0dfbf66fcfa7f10c901f9b6c24cbf06a03d0d3d797e'
  '2b62b1e3fc9890b455e98d4d5230afa2cc1e29fabfd1d2e73f1fc8bde732e643'
)
sha256sums_aarch64=(
  '906ef0548d8dfdbaadc6d50d3cff2147984dcbd6c2cb9167d18429ca40f7b1f0'
  'd613274f39743d62e10f24cb3da4752a90c78804caeded21d3d6185ca2a99d83'
  '8b0a098d20f2cdaf06cac07ac8199e8ee910cd79e166f2b4dccc9c27b8051452'
)

case "${CARCH}" in
  x86_64) _release_arch=amd64 ;;
  aarch64) _release_arch=arm64 ;;
  *) printf 'unsupported architecture: %s\n' "${CARCH}" >&2; return 1 ;;
esac

prepare() {
  local archive="${_artifact}-${_release_arch}.tar.gz"
  local expected actual

  expected=$(awk 'NR == 1 { print $1 }' "${archive}.sha256")
  [[ ${expected} =~ ^[[:xdigit:]]{64}$ ]] || return 1
  actual=$(sha256sum "${archive}")
  [[ ${actual%% *} == "${expected}" ]] || return 1
  cosign verify-blob \
    --bundle "${archive}.sigstore.json" \
    --certificate-identity \
      "${url}/.github/workflows/release-go.yml@refs/tags/${_release_tag}" \
    --certificate-oidc-issuer 'https://token.actions.githubusercontent.com' \
    "${archive}"
  bsdtar -xf "${archive}"
}

package() {
  local bundle="${srcdir}/${_artifact}-${_release_arch}"
  local file

  install -Dm0755 "${bundle}/lmm-api-go" "${pkgdir}/usr/bin/lmm-api-go"
  ln -s lmm-api-go "${pkgdir}/usr/bin/lmm-api"
  install -Dm0644 "${bundle}/lmm-api.service" \
    "${pkgdir}/usr/lib/systemd/system/lmm-api.service"
  install -Dm0600 "${bundle}/lmm-api-go.env" \
    "${pkgdir}/etc/lmm-api-go/lmm-api-go.env"

  install -d -m0755 "${pkgdir}/usr/share/lmm-api-go/frontend-dist"
  cp -R --no-preserve=ownership,mode,timestamps -- "${bundle}/frontend-dist/." \
    "${pkgdir}/usr/share/lmm-api-go/frontend-dist/"
  find "${pkgdir}/usr/share/lmm-api-go/frontend-dist" -type d -exec chmod 0755 {} +
  find "${pkgdir}/usr/share/lmm-api-go/frontend-dist" -type f -exec chmod 0644 {} +

  for file in LICENSE NOTICE THIRD-PARTY-LICENSES.md; do
    install -Dm0644 "${bundle}/${file}" "${pkgdir}/usr/share/licenses/${pkgname}/${file}"
  done
  install -Dm0644 "${bundle}/REVISION" "${pkgdir}/usr/share/doc/${pkgname}/REVISION"
}
