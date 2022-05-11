# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=playdate-sdk
pkgver=1.11.0
pkgrel=1
pkgdesc='SDK for the Playdate console with Lua and C APIs, docs, and a simulator'
arch=('any')
url='https://play.date/dev/'
license=('custom')
depends=('xdg-utils')
makedepends=('curl' 'jq')
optdepends=('zeal: read the Playdate SDK docset offline')
options=('!strip')
install="${pkgname}.install"
_url_base='https://download-keycdn.panic.com/playdate_sdk/Linux/PlaydateSDK'

source=(
  "${pkgname}-${pkgver}.tar.gz::${_url_base}-${pkgver}.tar.gz"
  'date.play.simulator.desktop'
  'playdate-sdk.install'
  'playdate-simulator.shim'
)

sha512sums=(
  '8a62ed91d470a51303561517df14620158f5dcb51b91169f518b243826fc8b69482da4cbcbcee14e7a8b634ba9345428ef2060835a83cb2b1c0e3ced25d63809'
  '7286f35bff63253ff430860ce6a3ce52dfd88bcd90e6dd6cfcbeb90a76b38d2341d4fc428259d00eac7b67c2b94e0319e3d438a67e76e8016d8cd36be1123677'
  'ed30d6745f686e985bd54cd23c5a8e9bee95bad7209d065871bf461dc8321dea032583d6a3da9fa9909efca2969dde0954777a55ba42b4974c49ed1993101c92'
  '2a909f7d290489e23a5dd1648269e8575e3912057d03649d898fa23a6ff74185bd1080c6366db1b840bce4cb72482c72e218f88bb1aac4d91eec6f89205573cb'
)

noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}"
  tar -x \
    -f "${srcdir}/${pkgname}-${pkgver}.tar.gz" -z \
    --no-anchored --wildcards \
    -C "${srcdir}/${pkgname}-${pkgver}" \
    --exclude='setup.sh' \
    --strip-components=1
}

pkgver() {
  curl -s -o /dev/null -w '%{json}' "${_url_base}-latest.tar.gz" \
    | jq -r '.redirect_url' \
    | sed -E 's/.*SDK-(.*)\.tar\.gz/\1/'
}

package() {
  mkdir -p \
    "${pkgdir}/etc/profile.d" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/udev/rules.d" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/" \
    "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${pkgdir}/usr/share/mime/packages" \
    "${pkgdir}/opt"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/SDK_LICENSE.md"

  echo >&2 'Packaging the README'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/README.md"

  echo >&2 'Packaging the icon'
  install -D -m 644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
    "${srcdir}/${pkgname}-${pkgver}/Resources/date.play.simulator.svg"

  echo >&2 'Packaging the desktop file'
  install -D -m 755 -T \
    "${srcdir}/date.play.simulator.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  echo >&2 'Packaging MIME type additions'
  install -D -m 644 -t "${pkgdir}/usr/share/mime/packages" \
    "${srcdir}/${pkgname}-${pkgver}/Resources/playdate-types.xml"

  echo >&2 'Packaging environment additions'
  cat > "${pkgdir}/etc/profile.d/${pkgname}.sh" \
    <<< 'export PLAYDATE_SDK_PATH="${XDG_DATA_HOME:-"${HOME}/.local/share"}/playdate-sdk"'

  echo >&2 'Packaging SDK files'
  cp -r --preserve=mode -T \
    "${srcdir}/${pkgname}-${pkgver}" \
    "${pkgdir}/opt/${pkgname}"

  echo >&2 'Packaging executables'
  mv -t "${pkgdir}/usr/bin" \
    "${pkgdir}/opt/${pkgname}/bin/"{pdc,pdutil}
  install -D -m 755 -T \
    "${srcdir}/playdate-simulator.shim" \
    "${pkgdir}/usr/bin/PlaydateSimulator"
}
