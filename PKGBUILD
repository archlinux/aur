# Maintainer: LIghtJUNction <support@lmm.best>

pkgname=lmm-api-deploy-bin
pkgver=0.1.45
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
_release_revision=441574aae3d3c86bf8fc9414dd727d3a1a7385db
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
  'e72e1ed369e1414fa34c877d33bc3ac47e9f680a9d1f813fff4d681947abc3c0'
  'f7a28114196dfc124955546164dcdcbc25d75798b1be5b6fcd2f44d28adfe958'
  'cd069cdd9e89bace207071bc93465216f4aa570aef32e61c245a7f677ca741de'
)
sha256sums_aarch64=(
  'ab9f92e486bcbeb7455fe33e843438ba1d4310f83030deead597d598f69ac5d0'
  '837723f0154d2407dede8a894af15bb82db278caf51559fc9125d8fa8b400e16'
  'afde7d32c7d149ca7fa6af6f6066f91c81cc5055c78b6272b45fc1f62dd2ed39'
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
