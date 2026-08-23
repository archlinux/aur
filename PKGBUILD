# Maintainer: LIghtJUNction <support@lmm.best>

pkgname=lmm-api-deploy-bin
pkgver=0.1.49
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
_release_revision=148fd59336b25de68742c4c8c499f0b2863ad13b
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
  '5a9218ea1fded560baff464e5a7fa799c8a085d313e5ff6ba3737dda48e250f7'
  '379f95765bae39a2ca5e24f4bf6456f3f5ae0e6a7bccca3c384f04903c11f335'
  '13317bc52394245c255174025b097f3b53300f88e79aa7856b871fa078469d9c'
)
sha256sums_aarch64=(
  '62591f18c4cc449cf54f9cad75a424e1a181b9f16e911786c7d8fd95d0b41210'
  '4a85cc3c63feb8e603ab5095103d3144556c0f2f09c3f8ba13a294a7f1a2e53e'
  '4f3f4a7c738de56d2c952be8b44ea8e27c64fd31e852aa6c9ade264028d73147'
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
