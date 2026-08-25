# Maintainer: LIghtJUNction <support@lmm.best>

pkgname=lmm-api-web-bin
pkgver=0.1.43
pkgrel=1
pkgdesc='LMM API production web frontend (prebuilt)'
arch=('any')
url='https://github.com/LIghtJUNction/api.lmm.best'
license=('AGPL-3.0-only')
depends=('bash' 'coreutils' 'diffutils' 'findutils' 'gawk' 'grep' 'nginx' 'sed' 'systemd' 'util-linux')
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
  "lmm-api-web-activate::${url}/raw/refs/tags/${_release_tag}/packaging/aur/lmm-api-web-bin/lmm-api-web-activate"
)
noextract=("${_artifact}")
sha256sums=(
  'beb6031ea443efa7e3d2efce7394eb68fa23d5f7ab8c8d1b7d44db3e428f3403'
  '0ed6888d3d79c492ea454b2057977cc00d9b41e3df26375c403aa96bcb63f580'
  '481126f84fad17d68c479371d3ed040a55d55221465c19718cbcd0d497575e4f'
  '358f5b958f3520757628d803027dafb1b67ec61b565d00bf4cd4f7927347cf33'
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
  install -m0755 lmm-api-web-activate lmm-api-web-activate.local
  bsdtar -xf "${_artifact}"
  [[ -f ${srcdir}/dist/index.html ]]
  [[ -x ${srcdir}/lmm-api-web-activate.local ]]
  [[ -x ${srcdir}/frontend-release.sh ]]
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

  install -Dm0755 "${srcdir}/lmm-api-web-activate.local" \
    "${pkgdir}/usr/lib/lmm-api-web/lmm-api-web-activate"
  install -Dm0755 "${srcdir}/frontend-release.sh" \
    "${pkgdir}/usr/lib/lmm-api-web/frontend-release.sh"

  local file
  for file in LICENSE NOTICE THIRD-PARTY-LICENSES.md; do
    install -Dm0644 "${srcdir}/${file}" "${pkgdir}/usr/share/licenses/${pkgname}/${file}"
  done
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
