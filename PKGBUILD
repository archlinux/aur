# Maintainer: Ricardo Cabral <ricardo.arturo.cabral@gmail.com>
# Maintainer: Ben Mezger <me@benmezger.nl>

_name=Tibia
pkgname=tibia
pkgver=latest
pkgrel=1
pkgdesc="Fast-paced free massively multiplayer online role-playing game"
arch=('x86_64')
url="http://www.tibia.com"
license=('custom:cipsoft')
depends=('glu' 'libgl' 'libice' 'libxext' 'libxml2-legacy')
optdepends=(
  'qt6-base'              # Qt6Core/Gui/Widgets/Network/Concurrent
  'qt6-declarative'       # Qt6Qml/Quick
  'qt6-wayland'           # Qt6 Wayland client/compositor + shell plugins
  'dbus'                  # libdbus-1.so.3 (QtDBus)
  'freetype2'             # libfreetype.so.6
  'fontconfig'            # libfontconfig.so.1
  'libxkbcommon'          # libxkbcommon.so.0
  'libxkbcommon-x11'      # libxkbcommon-x11.so.0
  'xcb-util-image'        # libxcb-image.so.0
  'xcb-util-keysyms'      # libxcb-keysyms.so.1
  'xcb-util-renderutil'   # libxcb-render-util.so.0
  'xcb-util-wm'           # libxcb-icccm.so.4
  'xcb-util-cursor'       # libxcb-cursor.so.0
  'ttf-ms-fonts'
)
makedepends=('gendesk' 'python-html2text')
source=("${pkgname}.tar.gz::https://static.tibia.com/download/tibia.x64.tar.gz"
        "${pkgname}-agreement.php::https://www.tibia.com/support/agreement.php")
sha256sums=('SKIP'
            'SKIP')
DLAGENTS=("https::/usr/bin/curl --compressed -fLC - --retry 0 --retry-delay 0 -e %u -o %o %u"
          "${DLAGENTS[@]}")

prepare() {
  gendesk -f -n --pkgname="${pkgname%-bin}"
  html2text "${pkgname}-agreement.php" > LICENSE
}

package() {
  cd $_name

  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r . "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_name}" "${pkgdir}/usr/bin/${pkgname}"

  cd $OLDPWD
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 Tibia/tibia.ico -t "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
