# Maintainer: LIghtJUNction <support@lmm.best>

pkgname=lmm-api-go-bin
pkgver=0.2.6
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
source "${startdir:?}/lmm-api-go-package.sh"
lmm_go_package_apply_metadata "$pkgver" "$pkgname" \
  'lmm-api-go' 'lmm-api-go-bin' 'lmm-api-go-git'
backup=('etc/lmm-api-go/lmm-api-go.env')
options=('!strip')

_release_tag="go-v${pkgver}"
_legacy_bundled_version=0.1.34
_legacy_cli_archive_version=0.1.57
_legacy_external_operator_version=0.1.57
# go-v0.1.58 produced no release assets. Only signed 0.1.69 is accepted as the legacy N-1 layout.
_artifact="lmm-api-go-${pkgver}-linux"
_release_base="${url}/releases/download/${_release_tag}"
source=('lmm-api-go-package.sh')
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
sha256sums=('655e9346a6d87baa1cb81d97dcc412243d7ee305f90371b99d89033ea0e99bb1')
sha256sums_x86_64=(
  '66c43d8c5eaf36ebbd417f71b8f8e9c7f0c3107c16fa6559e8f3289a63b8f58a'
  'af0a5e12c14faf0a5111347f6aaf19beeca01f778f281d043868dc43f64ee907'
  '2e610d4c745811987675f0839aa063f9b7c62efd5ae87d2b5a2fdfe74d4e081c'
)
sha256sums_aarch64=(
  'ccc1534866f03ed80b4973f28dce194f21986d96cfe65580e0e4e021874205f6'
  '1f411ce6aae73b3ba8eb5d5a901c14edd762078e0331208c48b9bcb968fff539'
  '26cd4a8f767aa922c51c4a53b45f8aa9d48efb0fa67d4812a7ea3a02a029cbb3'
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
