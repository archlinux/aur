# Maintainer: shbernal <shbernal.01@gmail.com>
# Issues and fixes: https://github.com/shbernal/aur-packages

_pkgname=multilogin
_appname=mlxapp
pkgname=${_pkgname}-bin
pkgver=12.17.0
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
sha256sums=('c75da7b7a313132b8286ad1beab7bfffe3717382bfb6b302dcca12227468bc71'
            '5f27472826e4cec04ca9097936bc3ea149886097396d764eb969cadbc578e6eb')

prepare() {
  mkdir -p deb
  bsdtar -xOf "${_deb}" data.tar.gz | bsdtar -xf - -C deb
}

package() {
  # A self-contained Wails binary: the deb's /opt dir holds only it and the icon
  install -Dm755 "deb/opt/${_appname}/desktop.bin" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "deb/opt/${_appname}/mlx.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  install -Dm644 "deb/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i \
    -e '/\[ee\]=/d' \
    -e "s|^Exec=.*|Exec=${_pkgname} %u|" \
    -e "s|^Icon=.*|Icon=${_pkgname}|" \
    -e '/^Path=/d' \
    -e 's|^Comment=.*|Comment=Antidetect browser profile manager|' \
    -e 's|^Categories=.*|Categories=Network;WebBrowser;|' \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
