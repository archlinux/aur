# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>

pkgname=lmm-api-go-bin
pkgver=0.1.4
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
  'c006a4d27836ffb11a98d3617c3476db83796a7e8af2d34fe1966d781ff13222'
  '3987dcb9e128734a3bcac50041c09696ad303155f4641c0aaab81de2eb10d6d9'
  '6015bdb2f4644f37883af1cf356c3fc65517e6b2f48d2c12ddaad0edf0136962'
)
sha256sums_aarch64=(
  '404053b14d09d5f457020b8624a33adf3c1930bd5c7669ad89c85d814af29faf'
  'a116221318ad5de8633daa0e897ead01bdce578bbbf589c28f99ae1e29248776'
  '2ef63a81d41ff91b5023e7ccc96d6dc23f54347736536f3949c7da62215c4bc2'
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
