# Maintainer: LIghtJUNction <support@lmm.best>

pkgname=lmm-api-deploy-bin
pkgver=0.1.41
pkgrel=1
pkgdesc='LMM API tooling-only production deployment operator (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/api.lmm.best'
license=('AGPL-3.0-only')
depends=('ca-certificates' 'coreutils' 'libarchive' 'pacman' 'paru' 'sudo' 'systemd' 'util-linux')
makedepends=('cosign')
provides=("lmm-api-deploy=${pkgver}")
conflicts=('lmm-api-deploy')
options=('!strip')

_release_tag="go-v${pkgver}"
_release_revision=79c87b7e34e70e8d0b423441784c66d2809028f3
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
  'cd9690d465ebc634f77d68363328c9730ca62f7b0b946c7b54283048e9f5345c'
  '36b9644118ab436363cef7c9f1f0a23027bd43a0d877bae77a2793fe9989acc0'
  '5532e5793e542c66ec1e2c8473e9e61fe6158dc53e5cd92c831352011b6cd49a'
)
sha256sums_aarch64=(
  '10037bcf0d4d54a9c5fcfa7660b89d31de23551027a0cfb34a900979b3e7099c'
  'f533e212f0828fbda30cd49e73b3f0ba02e4fb6e4e4ffd32b8b1f0a36624a5e7'
  '6e052ea798ec3c38a08f2f4af37ede4ebd2dff331afd3a381fa13e604f8dffb7'
)

case "${CARCH}" in
  x86_64) _release_arch=amd64 ;;
  aarch64) _release_arch=arm64 ;;
  *) printf 'unsupported architecture: %s\n' "${CARCH}" >&2; return 1 ;;
esac

prepare() {
  local archive="${_artifact}-${_release_arch}.tar.gz"
  local bundle="${srcdir}/${_artifact}-${_release_arch}"
  local expected actual revision

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

  [[ -f ${bundle}/lmm-api-go && -x ${bundle}/lmm-api-go ]] || return 1
  [[ -f ${bundle}/REVISION && ! -L ${bundle}/REVISION ]] || return 1
  revision=$(<"${bundle}/REVISION")
  [[ ${revision} == "${_release_revision}" ]] || return 1
  if [[ -e ${bundle}/API_ROUTE_CONTRACT_REVISION ]]; then
    [[ -f ${bundle}/API_ROUTE_CONTRACT_REVISION && ! -L ${bundle}/API_ROUTE_CONTRACT_REVISION ]] || return 1
    [[ $(<"${bundle}/API_ROUTE_CONTRACT_REVISION") =~ ^[0-9a-f]{64}$ ]] || return 1
  fi
}

package() {
  local bundle="${srcdir}/${_artifact}-${_release_arch}"
  local archive="${srcdir}/${_artifact}-${_release_arch}.tar.gz"
  local file binary_hash asset_hash

  install -Dm0755 "${bundle}/lmm-api-go" \
    "${pkgdir}/usr/lib/lmm-api-deploy/lmm-api-go"
  install -d -m0755 "${pkgdir}/usr/bin"
  ln -s ../lib/lmm-api-deploy/lmm-api-go "${pkgdir}/usr/bin/lmm-api-deploy"

  install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/lmm-api-deploy.conf" <<'EOF'
u lmm-api-deploy - "LMM API deployment operator" /var/lib/lmm-api-go-deploy/operator /usr/bin/nologin
EOF
  install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/lmm-api-deploy.conf" <<'EOF'
d /var/lib/lmm-api-go-deploy 0710 root lmm-api-deploy -
d /var/lib/lmm-api-go-deploy/operator 0700 lmm-api-deploy lmm-api-deploy -
EOF
  install -d -m0750 "${pkgdir}/etc/sudoers.d"
  install -Dm0440 /dev/stdin "${pkgdir}/etc/sudoers.d/lmm-api-deploy" <<'EOF'
lmm-api-deploy ALL=(root) NOPASSWD: /usr/bin/pacman ^--upgrade --noconfirm -- /var/lib/lmm-api-go-deploy/work/[A-Za-z0-9][A-Za-z0-9._-]{0,79}/staging/lmm-api-go-bin-[A-Za-z0-9][A-Za-z0-9._+@~-]*\.pkg\.tar\.(zst|xz|gz|bz2|lz4|lrz|lzo|Z)$
lmm-api-deploy ALL=(root) NOPASSWD: /usr/bin/pacman ^--upgrade --noconfirm -- /var/lib/lmm-api-go-deploy/work/[A-Za-z0-9][A-Za-z0-9._-]{0,79}/staging/lmm-api-web-bin-[A-Za-z0-9][A-Za-z0-9._+@~-]*\.pkg\.tar\.(zst|xz|gz|bz2|lz4|lrz|lzo|Z)$
EOF

  for file in LICENSE NOTICE THIRD-PARTY-LICENSES.md; do
    install -Dm0644 "${bundle}/${file}" \
      "${pkgdir}/usr/share/licenses/${pkgname}/${file}"
  done
  install -Dm0644 "${bundle}/REVISION" \
    "${pkgdir}/usr/share/doc/${pkgname}/REVISION"
  if [[ -f ${bundle}/API_ROUTE_CONTRACT_REVISION ]]; then
    install -Dm0644 "${bundle}/API_ROUTE_CONTRACT_REVISION" \
      "${pkgdir}/usr/share/doc/${pkgname}/API_ROUTE_CONTRACT_REVISION"
  fi

  binary_hash=$(sha256sum "${bundle}/lmm-api-go")
  printf '%s\n' "${binary_hash%% *}" >"${srcdir}/OPERATOR_SHA256"
  install -Dm0644 "${srcdir}/OPERATOR_SHA256" \
    "${pkgdir}/usr/share/doc/${pkgname}/OPERATOR_SHA256"
  asset_hash=$(sha256sum "${archive}")
  printf '%s\n' "${asset_hash%% *}" >"${srcdir}/RELEASE_ASSET_SHA256"
  install -Dm0644 "${srcdir}/RELEASE_ASSET_SHA256" \
    "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_ASSET_SHA256"
}
