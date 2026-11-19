# Maintainer: shbernal <shbernal.01@gmail.com>
# Issues and fixes: https://github.com/shbernal/aur-packages

_pkgname=multilogin
_appname=mlxapp
pkgname=${_pkgname}-bin
pkgver=12.18.0
pkgrel=1
pkgdesc='Desktop app for the Multilogin antidetect browser'
arch=('x86_64')
url='https://multilogin.com'
license=('LicenseRef-Multilogin')
depends=(
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'webkit2gtk-4.1'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

_deb="desktop-multilogin-${pkgver}-ubuntu-24.04-amd64.deb"
source=("${_deb}::https://cdn-mlx-prod.multiloginapp.com/desktop/${pkgver}/desktop-multilogin-ubuntu-24.04-amd64.deb"
        'LICENSE')
noextract=("${_deb}")
sha256sums=('7ab1769324997064632c40ab2005b79a98b67543ef137338d4bb402331deb91e'
            '5f27472826e4cec04ca9097936bc3ea149886097396d764eb969cadbc578e6eb')

prepare() {
  mkdir -p deb
  bsdtar -xOf "${_deb}" data.tar.gz | bsdtar -xf - -C deb
}

package() {
  # A self-contained Wails binary: the deb's /opt dir holds only it and the icon
  install -Dm755 "deb/opt/${_appname}/desktop.bin" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "deb/opt/${_appname}/mlx.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  # The app registers its mlxapp:// handler with xdg-settings by this desktop file name
  install -Dm644 "deb/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  sed -i \
    -e '/\[ee\]=/d' \
    -e "s|^Exec=.*|Exec=${_pkgname} %u|" \
    -e "s|^Icon=.*|Icon=${_pkgname}|" \
    -e '/^Path=/d' \
    -e 's|^Comment=.*|Comment=Antidetect browser profile manager|' \
    -e 's|^Categories=.*|Categories=Network;WebBrowser;|' \
    "${pkgdir}/usr/share/applications/${_appname}.desktop"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
