
pkgname=yesplaymusic
pkgver=0.4.9
pkgrel=1
pkgdesc="A third party music application for Netease Music"
arch=("x86_64")
url="https://github.com/qier222/YesPlayMusic"
license=("MIT")
provides=("yesplaymusic")
depends=(
    "gtk3"
    "nss"
)
optdepends=(
    'c-ares'
    'ffmpeg'
    'http-parser'
    'libevent'
    'libvpx'
    'libxslt'
    'minizip'
    're2'
    'snappy'
    'libnotify'
    'libappindicator-gtk3'
)
source=(
    "YesPlayMusic-${pkgver}.tar.gz::https://github.com/qier222/YesPlayMusic/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9b240d6b605d547c9dbc7d6222a0d2f28bfb0586201e01181e1d0e25bb83885a')

package() {
    cd ${srcdir}/YesPlayMusic-${pkgver}
    make DESTDIR="${pkgdir}" install
    # Remove existing files
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
    # Make KDE happy :)
    echo 'Comment[zh_CN]=高颜值的第三方网易云播放器' >>${pkgdir}/usr/share/applications/yesplaymusic.desktop
    sed -i -E "s|Categories=Music;|Categories=Music;AudioVideo;Player;|" ${pkgdir}/usr/share/applications/yesplaymusic.desktop
}

post_install() {
    # Link to the binary
    ln -sf '/opt/YesPlayMusic/yesplaymusic' '/usr/bin/yesplaymusic'
    # SUID chrome-sandbox for Electron 5+
    chmod 4755 '/opt/YesPlayMusic/chrome-sandbox' || true
    update-mime-database /usr/share/mime || true
    update-desktop-database /usr/share/applications || true
}

post_remove() {
    rm -f '/usr/bin/yesplaymusic'
}
