# Maintainer: LIghtJUNction <support@lmm.best>

pkgname=lmm-api-web-bin
pkgver=0.1.71
pkgrel=1
pkgdesc='LMM API production web frontend (prebuilt)'
arch=('any')
url='https://github.com/LIghtJUNction/api.lmm.best'
license=('AGPL-3.0-only')
depends=('nginx')
if (( $(vercmp "${pkgver}" 0.1.52) >= 0 )); then
  depends+=('lmm-api-provider')
else
  depends+=('bash' 'coreutils' 'diffutils' 'findutils' 'gawk' 'grep' 'sed' 'systemd' 'util-linux')
fi
makedepends=('cosign')
provides=("lmm-api-web=${pkgver}")
conflicts=('lmm-api-web')
install=lmm-api-web.install

_release_tag="web-v${pkgver}"
_legacy_contractless_version=0.1.31
_artifact="lmm-api-web-${pkgver}.tar.gz"
_release_base="${url}/releases/download/${_release_tag}"
source=(
  "${_artifact}::${_release_base}/${_artifact}"
  "${_artifact}.sha256::${_release_base}/${_artifact}.sha256"
  "${_artifact}.sigstore.json::${_release_base}/${_artifact}.sigstore.json"
)
noextract=("${_artifact}")
sha256sums=(
  '035be5bb21c70d80d2fe6d92c7487e19df8af691effb0375a3d85825401f276f'
  'aba0c09315f298546f7fdd6bfc81a0da742b7f89af6f53cc750232e30f6a16c6'
  '6109ee196e749b85740ff4d629280bca6793ee5f0608cb510585287a0cc245de'
)

prepare() {
  local expected actual

  expected=$(awk 'NR == 1 { print $1 }' "${_artifact}.sha256")
  [[ ${expected} =~ ^[[:xdigit:]]{64}$ ]] || return 1
  actual=$(sha256sum "${_artifact}")
  [[ ${actual%% *} == "${expected}" ]] || return 1
  cosign verify-blob \
    --bundle "${_artifact}.sigstore.json" \
    --certificate-identity \
      "${url}/.github/workflows/release-web.yml@refs/tags/${_release_tag}" \
    --certificate-oidc-issuer 'https://token.actions.githubusercontent.com' \
    "${_artifact}"
  bsdtar -xf "${_artifact}"
  [[ -f ${srcdir}/dist/index.html ]]
  if (( $(vercmp "${pkgver}" 0.1.43) >= 0 )); then
    [[ -f ${srcdir}/lmm-api-web.install && ! -L ${srcdir}/lmm-api-web.install ]] || return 1
  fi
  if [[ -f ${srcdir}/lmm-api-web.install ]]; then
    cmp -s "${startdir}/lmm-api-web.install" "${srcdir}/lmm-api-web.install" || return 1
  fi
  ! find "${srcdir}/dist" -type l -print -quit | grep -q .
  if [[ ${pkgver} != "${_legacy_contractless_version}" ]]; then
    [[ -f ${srcdir}/API_ROUTE_CONTRACT_REVISION && ! -L ${srcdir}/API_ROUTE_CONTRACT_REVISION ]]
    [[ $(<"${srcdir}/API_ROUTE_CONTRACT_REVISION") =~ ^[0-9a-f]{64}$ ]]
  fi
}

package() {
  local release_asset_sha256

  install -d -m0755 "${pkgdir}/usr/share/lmm-api-web/frontend-dist"
  cp -R --no-preserve=ownership,mode,timestamps -- "${srcdir}/dist/." \
    "${pkgdir}/usr/share/lmm-api-web/frontend-dist/"
  find "${pkgdir}/usr/share/lmm-api-web/frontend-dist" -type d -exec chmod 0755 {} +
  find "${pkgdir}/usr/share/lmm-api-web/frontend-dist" -type f -exec chmod 0644 {} +

  local file
  for file in LICENSE NOTICE THIRD-PARTY-LICENSES.md; do
    install -Dm0644 "${srcdir}/${file}" "${pkgdir}/usr/share/licenses/${pkgname}/${file}"
  done
  if (( $(vercmp "${pkgver}" 0.1.52) < 0 )); then
    install -Dm0755 "${srcdir}/lmm-api-web-activate" \
      "${pkgdir}/usr/lib/lmm-api-web/lmm-api-web-activate"
    install -Dm0755 "${srcdir}/frontend-release.sh" \
      "${pkgdir}/usr/lib/lmm-api-web/frontend-release.sh"
  fi
  install -Dm0644 "${srcdir}/REVISION" "${pkgdir}/usr/share/doc/${pkgname}/REVISION"
  release_asset_sha256=$(sha256sum "${srcdir}/${_artifact}")
  printf '%s\n' "${release_asset_sha256%% *}" >"${srcdir}/RELEASE_ASSET_SHA256"
  install -Dm0644 "${srcdir}/RELEASE_ASSET_SHA256" \
    "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_ASSET_SHA256"
  if [[ -f ${srcdir}/API_ROUTE_CONTRACT_REVISION ]]; then
    install -Dm0644 "${srcdir}/API_ROUTE_CONTRACT_REVISION" \
      "${pkgdir}/usr/share/doc/${pkgname}/API_ROUTE_CONTRACT_REVISION"
  fi
}
