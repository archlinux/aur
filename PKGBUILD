# Maintainer: shbernal <shbernal.01@gmail.com>
# Issues and fixes: https://github.com/shbernal/aur-packages

_pkgname=multilogin-agent
_appname=mlx
pkgname=${_pkgname}-bin
pkgver=1.44.0
pkgrel=1
pkgdesc='Tray agent that lets the Multilogin X web app start antidetect browser profiles'
arch=('x86_64')
url='https://multilogin.com'
license=('LicenseRef-Multilogin')
depends=(
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

_deb="multiloginx-${pkgver}-amd64.deb"
source=("${_deb}::https://cdn-mlx-prod.multiloginapp.com/mlx/${pkgver}/multiloginx-amd64.deb"
        'LICENSE')
noextract=("${_deb}")
sha256sums=('fca764305ec470f43e738ceca89890bcd3f3d19265c460ef9e0e5fd3f596e728'
            '5f27472826e4cec04ca9097936bc3ea149886097396d764eb969cadbc578e6eb')

prepare() {
  mkdir -p deb
  bsdtar -xOf "${_deb}" data.tar.gz | bsdtar -xf - -C deb
}

package() {
  # A self-contained Go binary: the deb's /opt dir holds only it and the icon
  install -Dm755 "deb/opt/${_appname}/agent.bin" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "deb/opt/${_appname}/mlx.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  # The agent registers its mlx:// handler with xdg-settings by this desktop file name
  install -Dm644 "deb/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  sed -i \
    -e '/\[ee\]=/d' \
    -e 's|^Name=.*|Name=Multilogin X Agent|' \
    -e "s|^Exec=.*|Exec=${_pkgname} %u|" \
    -e "s|^Icon=.*|Icon=${_pkgname}|" \
    -e '/^Path=/d' \
    -e 's|^Comment=.*|Comment=Starts Multilogin X browser profiles for the web app|' \
    -e 's|^Categories=.*|Categories=Network;WebBrowser;|' \
    "${pkgdir}/usr/share/applications/${_appname}.desktop"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
