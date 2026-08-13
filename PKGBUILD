# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>

pkgname=lmm-api-go-bin
pkgver=0.1.3
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
  'de7dbf18397599887c6a77ac91df9e09044132184d28a7d6d95de86289c9237e'
  '3df2a4700ce3f6fa08144fd155fd280c9d348a6cdfbd6ee16060d7bd8a2e5f8f'
  '5aad7a3117d18250be6f0195e489ffbe4c7ebc3ca1ee273c4924f356ece08e4a'
)
sha256sums_aarch64=(
  '89cc568e03fdeaced41ce00ce32d2baaa2e5210f91b5b222d19095de7b13b10a'
  'e1017d05e59a076be0173ab94b97536c466367d6f71e444b5eebb08d9bd2dc8a'
  'f702e0be1ec5943589a744046c35c6bc1d35c4b1d3c08d2be440eb167f123818'
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
