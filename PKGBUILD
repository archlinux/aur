# Maintainer : Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>, Ionut Biru <ibiru@archlinux.org>

# This is a copy of extra/flashplugin that includes the patch from [1] which
# replaces the string _NET_ACTIVE_WINDOW with _XET_ACTIVE_WINDOW.
#
# With this patch Flash won't automatically exit full-screen mode anymore when
# another window gets the focus (this situation is only possible when using
# multiple physical or virtual screens).

pkgname=flashplugin-focusfix
_licensefile='PlatformClients_PC_WWEULA_Combined_20100108_1657.pdf'
pkgver=11.2.202.481
pkgrel=1
pkgdesc='Adobe Flash Player with multi-monitor full-screen fix'
url='http://get.adobe.com/flashplayer'
arch=('i686' 'x86_64')
depends=('mozilla-common' 'libxt' 'libxpm' 'gtk2' 'nss' 'curl' 'hicolor-icon-theme')
optdepends=('libvdpau: GPU acceleration on Nvidia card')
provides=('flashplugin' 'flashplayer')
conflicts=('flashplugin')
license=('custom')
options=(!strip)
install=flashplugin.install
backup=(etc/adobe/mms.cfg)

_patchorig='\x4E\x45\x54\x5F\x41\x43\x54\x49\x56\x45\x5F\x57\x49\x4E\x44\x4F\x57'
_patchrepl='\x58\x45\x54\x5F\x41\x43\x54\x49\x56\x45\x5F\x57\x49\x4E\x44\x4F\x57'

source=(http://www.adobe.com/products/eulas/pdfs/${_licensefile}
        mms.cfg)
source_i686=(flashplugin_$pkgver.i386.tar.gz::http://fpdownload.macromedia.com/get/flashplayer/pdc/$pkgver/install_flash_player_11_linux.i386.tar.gz)
source_x86_64=(flashplugin_$pkgver.x86_64.tar.gz::http://fpdownload.macromedia.com/get/flashplayer/pdc/$pkgver/install_flash_player_11_linux.x86_64.tar.gz)
md5sums=('94ca2aecb409abfe36494d1a7ec7591d'
         'f34aae6279b40e0bd2abfb0d9963d7b8')
md5sums_i686=('5ab30a7c2ac4c4c7388602b16ce0c3eb')
md5sums_x86_64=('a41c1a9519ea4e3009c1e89934fe0bf6')

build () {
    sed -i "s/$_patchorig/$_patchrepl/" libflashplayer.so
}

package () {
    install -Dm755 libflashplayer.so "$pkgdir/usr/lib/mozilla/plugins/libflashplayer.so"
    if [ "$CARCH" = x86_64 ]; then
        install -Dm755 usr/lib64/kde4/kcm_adobe_flash_player.so "$pkgdir/usr/lib/kde4/kcm_adobe_flash_player.so"
    else
        install -Dm755 usr/lib/kde4/kcm_adobe_flash_player.so "$pkgdir/usr/lib/kde4/kcm_adobe_flash_player.so"
    fi
    install -Dm755 usr/bin/flash-player-properties "$pkgdir/usr/bin/flash-player-properties"
    for i in 16x16 22x22 24x24 32x32 48x48; do
        install -Dm644 usr/share/icons/hicolor/$i/apps/flash-player-properties.png \
            "$pkgdir/usr/share/icons/hicolor/$i/apps/flash-player-properties.png"
    done
    install -Dm644 usr/share/applications/flash-player-properties.desktop "$pkgdir/usr/share/applications/flash-player-properties.desktop"
    install -Dm644 usr/share/kde4/services/kcm_adobe_flash_player.desktop "$pkgdir/usr/share/kde4/services/kcm_adobe_flash_player.desktop"
    install -Dm644 "${_licensefile}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
    install -Dm644 mms.cfg "$pkgdir/etc/adobe/mms.cfg"
}
