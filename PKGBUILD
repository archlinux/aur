# Maintainer: LIghtJUNction <support@lmm.best>

pkgname=lmm-api-web-bin
pkgver=0.1.19
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
  '953e13b20324ed9b8645ad8cde6ddfe3f34ead7ee2dd0faa2b67ad652046a6bb'
  '0624e296f15c62294621e8a075bb25ba6f186ec2fa5d8101a1507f19f529fb7a'
  '1695c681bd5457774417883ce7d776185fcf7bf6a5c7e5832a0a767148f60243'
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
  ! find "${srcdir}/dist" -type l -print -quit | grep -q .
}

package() {
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
}
