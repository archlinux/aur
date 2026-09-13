# Maintainer: LIghtJUNction <support@lmm.best>

pkgname=lmm-api-go-bin
pkgver=0.2.28
pkgrel=1
pkgdesc='LMM API Go backend, native CLI, and systemd service (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/TokenNotIncluded/api.lmm.best'
license=('AGPL-3.0-only')
depends=('ca-certificates' 'coreutils' 'libarchive' 'pacman' 'paru' 'sudo' 'systemd' 'tzdata' 'util-linux')
makedepends=('cosign')
optdepends=(
  'postgresql: production database'
  'valkey: cache, rate limiting, and login sessions'
)
source "${startdir:?}/lmm-api-go-package.sh"
lmm_go_package_apply_metadata "$pkgver" "$pkgname" \
  'lmm-api-go' 'lmm-api-go-bin' 'lmm-api-go-git'
backup=('etc/lmm-api-go/lmm-api-go.env')
options=('!strip')
install=lmm-api-go.install

_release_tag="go-v${pkgver}"
_legacy_bundled_version=0.1.34
_legacy_cli_archive_version=0.1.57
_legacy_external_operator_version=0.1.57
# go-v0.1.58 produced no release assets. Only signed 0.1.69 is accepted as the legacy N-1 layout.
_artifact="lmm-api-go-${pkgver}-linux"
_release_base="${url}/releases/download/${_release_tag}"
source=('lmm-api-go-package.sh' 'lmm-api-go.install')
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
sha256sums=(
  '655e9346a6d87baa1cb81d97dcc412243d7ee305f90371b99d89033ea0e99bb1'
  '0d66ac2265d289653a84b4d25a7601a779893b1cf011951dfe7b420ea8b4ccc6'
)
sha256sums_x86_64=(
  '3eba2af2aaa7175ae36b91e9c35a10616bb7acfaef68e584e0ce0fdaf57ce12d'
  '60f3443b25c91da5fccac254b8aead4a17852100291fda5838289221cc3f96b5'
  '080423da0ae1d346f78a4219f147899a13d2a8bf5ae5cf9ff6c6f3f1c1c1d31c'
)
sha256sums_aarch64=(
  '75caa62532bb926141bddc921be5ae9f63bb21743b53a73398029fde362e3752'
  '671d35e75c0470e2bdaef3970cc0f3b3a63307f1d5e94ed90716b739bdd22772'
  '1a328d7e659218fc20a1001261f3bd3bdae7a84e3c85eaf1677b09fc775b14cc'
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
  if lmm_go_package_is_verified_legacy "$pkgname" "$pkgver"; then
    # Explicit N-1 migration evidence: go-v0.1.69 shipped the provider payload
    # as lmm-api. Only this signed release may be remapped to lmm-api-go.
    [[ -f ${bundle}/lmm-api && ! -L ${bundle}/lmm-api ]] || return 1
    [[ ! -e ${bundle}/lmm-api-go && ! -L ${bundle}/lmm-api-go ]] || return 1
  else
    [[ -f ${bundle}/lmm-api-go && ! -L ${bundle}/lmm-api-go ]] || return 1
    [[ ! -e ${bundle}/lmm-api && ! -L ${bundle}/lmm-api ]] || return 1
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
    if [[ -e ${bundle}/OAUTH_MANAGED_TOKEN_CAPABILITY ]]; then
      [[ -f ${bundle}/OAUTH_MANAGED_TOKEN_CAPABILITY && ! -L ${bundle}/OAUTH_MANAGED_TOKEN_CAPABILITY ]] || return 1
      [[ $(<"${bundle}/OAUTH_MANAGED_TOKEN_CAPABILITY") == v1 ]] || return 1
    fi
    if [[ -e ${bundle}/REFUND_TASK_DRAIN_CAPABILITY ]]; then
      [[ -f ${bundle}/REFUND_TASK_DRAIN_CAPABILITY && ! -L ${bundle}/REFUND_TASK_DRAIN_CAPABILITY ]] || return 1
      [[ $(<"${bundle}/REFUND_TASK_DRAIN_CAPABILITY") == v1 ]] || return 1
    fi
    grep -Fqx 'Environment=LMM_API_FRONTEND_DIR=/srv/lmm-api-frontend/current' \
      "${bundle}/lmm-api.service"
  fi
  if lmm_go_package_is_verified_legacy "$pkgname" "$pkgver"; then
    [[ -f ${bundle}/CLI_TRANSITION_PHASE && ! -L ${bundle}/CLI_TRANSITION_PHASE ]] || return 1
    [[ $(<"${bundle}/CLI_TRANSITION_PHASE") == t0 ]] || return 1
  else
    [[ ! -e ${bundle}/CLI_TRANSITION_PHASE && ! -L ${bundle}/CLI_TRANSITION_PHASE ]] || return 1
  fi
}

package() {
  local archive="${_artifact}-${_release_arch}.tar.gz"
  local bundle="${srcdir}/${_artifact}-${_release_arch}"
  local cli=lmm-api-go
  local file release_asset_sha256

  if lmm_go_package_is_verified_legacy "$pkgname" "$pkgver"; then
    cli=lmm-api
  fi
  if lmm_go_package_is_verified_legacy "$pkgname" "$pkgver"; then
    install -Dm0755 "${bundle}/${cli}" "${pkgdir}/usr/bin/lmm-api"
    ln -s lmm-api "${pkgdir}/usr/bin/lmm-api-go"
  else
    install -Dm0755 "${bundle}/${cli}" "${pkgdir}/usr/bin/lmm-api-go"
  fi
  lmm_go_package_assert_payload "$pkgdir" "$pkgname" "$pkgver"
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
      install -d -m0750 "${pkgdir}/etc/sudoers.d"
      install -m0440 "${bundle}/lmm-api-operator.sudoers" \
        "${pkgdir}/etc/sudoers.d/lmm-api-operator"
    fi
    install -Dm0644 "${bundle}/API_ROUTE_CONTRACT_REVISION" \
      "${pkgdir}/usr/share/doc/${pkgname}/API_ROUTE_CONTRACT_REVISION"
  fi
  if [[ -f ${bundle}/OAUTH_MANAGED_TOKEN_CAPABILITY ]]; then
    install -Dm0644 "${bundle}/OAUTH_MANAGED_TOKEN_CAPABILITY" \
      "${pkgdir}/usr/share/doc/${pkgname}/OAUTH_MANAGED_TOKEN_CAPABILITY"
  fi
  if [[ -f ${bundle}/REFUND_TASK_DRAIN_CAPABILITY ]]; then
    install -Dm0644 "${bundle}/REFUND_TASK_DRAIN_CAPABILITY" \
      "${pkgdir}/usr/share/doc/${pkgname}/REFUND_TASK_DRAIN_CAPABILITY"
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
  if lmm_go_package_is_verified_legacy "$pkgname" "$pkgver"; then
    install -Dm0644 "${bundle}/CLI_TRANSITION_PHASE" \
      "${pkgdir}/usr/share/doc/${pkgname}/CLI_TRANSITION_PHASE"
  fi
  release_asset_sha256=$(sha256sum "${srcdir}/${archive}")
  printf '%s\n' "${release_asset_sha256%% *}" >"${srcdir}/RELEASE_ASSET_SHA256"
  install -Dm0644 "${srcdir}/RELEASE_ASSET_SHA256" \
    "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_ASSET_SHA256"
}
