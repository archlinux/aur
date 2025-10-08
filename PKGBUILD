# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=playdate-sdk
pkgver=3.0.0
pkgrel=1
pkgdesc='SDK for the Playdate console with Lua and C APIs, docs, and a simulator'
arch=('x86_64')
url='https://play.date/dev/'
license=('LicenseRef-SdkLicense')
depends=(
  'bash'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libpng'
  'libx11'
  'libxkbcommon'
  'pango'
  'python'
  'systemd-libs'
  'webkit2gtk'
  'xdg-utils'
  'zlib'
)
makedepends=('curl' 'jq')
optdepends=(
  'python-click: to run the firmware_symbolizer.py utility'
  'wayland: for Wayland compatibility'
  'zeal: read the Playdate SDK docset offline'
)
options=('!strip')
install="${pkgname}.install"
_url_base='https://download-cdn.panic.com/playdate_sdk/Linux/PlaydateSDK'

source=(
  "${pkgname}-${pkgver}.tar.gz::${_url_base}-${pkgver}.tar.gz"
  'date.play.simulator.desktop'
  'playdate-sdk.install'
  'playdate-simulator.shim'
)

sha512sums=('05c09e8be1c08e189c1bfc640c6edf50f4f4d3111243ef7ff7fa38758dfd126a19504c04e906ac6bb2c55d178f19498fbf92da2c2b01ed3615ec4741574e0646'
            '7286f35bff63253ff430860ce6a3ce52dfd88bcd90e6dd6cfcbeb90a76b38d2341d4fc428259d00eac7b67c2b94e0319e3d438a67e76e8016d8cd36be1123677'
            'ed30d6745f686e985bd54cd23c5a8e9bee95bad7209d065871bf461dc8321dea032583d6a3da9fa9909efca2969dde0954777a55ba42b4974c49ed1993101c92'
            '361a60c924c91370fe33a76261c32e3f6fcf044d83b14e3c17fb3749d8794ad20a0535f4d1a44713b880364bb699e2b54ade922b3b769bd506e352cdfed6fab0')

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
  # shellcheck disable=SC2016
  cat > "${pkgdir}/etc/profile.d/${pkgname}.sh" \
    <<< 'export PLAYDATE_SDK_PATH="${XDG_DATA_HOME:-"${HOME}/.local/share"}/playdate-sdk"'

  echo >&2 'Packaging SDK files'
  cp -r --preserve=mode -T \
    "${srcdir}/${pkgname}-${pkgver}" \
    "${pkgdir}/opt/${pkgname}"

  echo >&2 'Packaging executables'
  ln -s -t "${pkgdir}/usr/bin" \
    "/opt/${pkgname}/bin/"{pdc,pdutil}
  install -D -m 755 -T \
    "${srcdir}/playdate-simulator.shim" \
    "${pkgdir}/usr/bin/PlaydateSimulator"
}
