# Maintainer: LIghtJUNction <support@lmm.best>

pkgname=lmm-api-go-bin
pkgver=0.1.61
pkgrel=1
pkgdesc='LMM API Go backend, native CLI, and systemd service (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/api.lmm.best'
license=('AGPL-3.0-only')
depends=('ca-certificates' 'coreutils' 'libarchive' 'pacman' 'paru' 'sudo' 'systemd' 'tzdata' 'util-linux')
makedepends=('cosign')
optdepends=(
  'postgresql: production database'
  'valkey: cache, rate limiting, and login sessions'
)
source "${startdir:?}/lmm-api-cli-phase.sh"
_lmm_cli_phase=$(lmm_cli_phase_for_binary_release "$pkgver")
lmm_cli_phase_apply_metadata "$_lmm_cli_phase" "$pkgver" \
  'lmm-api' 'lmm-api-bin' 'lmm-api-git' 'lmm-api-go' 'lmm-api-go-git'
backup=('etc/lmm-api-go/lmm-api-go.env')
options=('!strip')

_release_tag="go-v${pkgver}"
_legacy_bundled_version=0.1.34
_legacy_cli_archive_version=0.1.57
_legacy_external_operator_version=0.1.57
# go-v0.1.58 produced no release assets; 0.1.59 is T0 and 0.1.60 is T1.
_artifact="lmm-api-go-${pkgver}-linux"
_release_base="${url}/releases/download/${_release_tag}"
source=('lmm-api-cli-phase.sh')
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
sha256sums=('2b93864b302a7901a4688fd5b7df9b7e262f193a666a915718f434db20054935')
sha256sums_x86_64=(
  'e6c6f24cd4f4b78f2e038cc728510efb02358289891c78c80c5d1acea4aec13b'
  'bd1ae80a4fe1f5a53f7035ddc1de375f1502dd911e2a9d0510b4adfdf13a4682'
  '9bbbc56daa036d22163112b1ee63f136aa259c9010d209ad416b9c4ffd9f4dd9'
)
sha256sums_aarch64=(
  '2eb84ec9b1c185873e00d9c324f98d536f68cb856f36238121fd06d104c41762'
  '342aef98cb1e01a3c3162a069db57e5097afaed7f4d9d6842357c8c0181e39e8'
  'ca24c2b67d0f7fb4716d6a468f14e4c3544f4ab7be36660ff511fa500637f1ae'
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

  local bundle="${srcdir}/${_artifact}-${_release_arch}"
  if [[ ${pkgver} == "${_legacy_cli_archive_version}" || ${pkgver} == "${_legacy_bundled_version}" ]]; then
    [[ -f ${bundle}/lmm-api-go && ! -L ${bundle}/lmm-api-go ]] || return 1
    [[ ! -e ${bundle}/lmm-api ]] || return 1
  else
    [[ -f ${bundle}/lmm-api && ! -L ${bundle}/lmm-api ]] || return 1
    [[ ! -e ${bundle}/lmm-api-go ]] || return 1
  fi
  if [[ ${pkgver} == "${_legacy_bundled_version}" ]]; then
    [[ -f ${bundle}/frontend-dist/index.html ]] || return 1
  else
    [[ ! -e ${bundle}/frontend-dist ]] || return 1
    [[ -f ${bundle}/lmm-api-memory.conf && ! -L ${bundle}/lmm-api-memory.conf ]] || return 1
    if [[ ${pkgver} != "${_legacy_external_operator_version}" ]]; then
      for file in lmm-api-operator.sysusers lmm-api-operator.tmpfiles lmm-api-operator.sudoers; do
        [[ -f ${bundle}/${file} && ! -L ${bundle}/${file} ]] || return 1
      done
    fi
    [[ -f ${bundle}/API_ROUTE_CONTRACT_REVISION && ! -L ${bundle}/API_ROUTE_CONTRACT_REVISION ]] || return 1
    [[ $(<"${bundle}/API_ROUTE_CONTRACT_REVISION") =~ ^[0-9a-f]{64}$ ]] || return 1
    grep -Fqx 'Environment=LMM_API_FRONTEND_DIR=/srv/lmm-api-frontend/current' \
      "${bundle}/lmm-api.service"
  fi
}

package() {
  local archive="${_artifact}-${_release_arch}.tar.gz"
  local bundle="${srcdir}/${_artifact}-${_release_arch}"
  local cli=lmm-api
  local file release_asset_sha256

  if [[ ${pkgver} == "${_legacy_cli_archive_version}" || ${pkgver} == "${_legacy_bundled_version}" ]]; then
    cli=lmm-api-go
  fi
  install -Dm0755 "${bundle}/${cli}" "${pkgdir}/usr/bin/lmm-api"
  lmm_cli_phase_install_compatibility_alias "$_lmm_cli_phase" "$pkgdir"
  install -Dm0644 "${bundle}/lmm-api.service" \
    "${pkgdir}/usr/lib/systemd/system/lmm-api.service"
  install -d -m0700 "${pkgdir}/etc/lmm-api-go"
  install -m0600 "${bundle}/lmm-api-go.env" \
    "${pkgdir}/etc/lmm-api-go/lmm-api-go.env"

  if [[ ${pkgver} == "${_legacy_bundled_version}" ]]; then
    install -d -m0755 "${pkgdir}/usr/share/lmm-api-go/frontend-dist"
    cp -R --no-preserve=ownership,mode,timestamps -- "${bundle}/frontend-dist/." \
      "${pkgdir}/usr/share/lmm-api-go/frontend-dist/"
    find "${pkgdir}/usr/share/lmm-api-go/frontend-dist" -type d -exec chmod 0755 {} +
    find "${pkgdir}/usr/share/lmm-api-go/frontend-dist" -type f -exec chmod 0644 {} +
  else
    install -Dm0644 "${bundle}/lmm-api-memory.conf" \
      "${pkgdir}/usr/lib/systemd/system/lmm-api.service.d/20-memory.conf"
    if [[ ${pkgver} != "${_legacy_external_operator_version}" ]]; then
      install -Dm0644 "${bundle}/lmm-api-operator.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/lmm-api-operator.conf"
      install -Dm0644 "${bundle}/lmm-api-operator.tmpfiles" \
        "${pkgdir}/usr/lib/tmpfiles.d/lmm-api-operator.conf"
      install -Dm0440 "${bundle}/lmm-api-operator.sudoers" \
        "${pkgdir}/etc/sudoers.d/lmm-api-operator"
    fi
    install -Dm0644 "${bundle}/API_ROUTE_CONTRACT_REVISION" \
      "${pkgdir}/usr/share/doc/${pkgname}/API_ROUTE_CONTRACT_REVISION"
  fi

  install -d -m0755 "${pkgdir}/usr/share/lmm-api-go/edge-policy"
  cp -R --no-preserve=ownership,mode,timestamps -- "${bundle}/edge-policy/." \
    "${pkgdir}/usr/share/lmm-api-go/edge-policy/"
  find "${pkgdir}/usr/share/lmm-api-go/edge-policy" -type d -exec chmod 0755 {} +
  find "${pkgdir}/usr/share/lmm-api-go/edge-policy" -type f -exec chmod 0644 {} +

  for file in LICENSE NOTICE THIRD-PARTY-LICENSES.md; do
    install -Dm0644 "${bundle}/${file}" "${pkgdir}/usr/share/licenses/${pkgname}/${file}"
  done
  install -Dm0644 "${bundle}/REVISION" "${pkgdir}/usr/share/doc/${pkgname}/REVISION"
  release_asset_sha256=$(sha256sum "${srcdir}/${archive}")
  printf '%s\n' "${release_asset_sha256%% *}" >"${srcdir}/RELEASE_ASSET_SHA256"
  install -Dm0644 "${srcdir}/RELEASE_ASSET_SHA256" \
    "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_ASSET_SHA256"
}
