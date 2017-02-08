# $Id: PKGBUILD 271837 2016-07-13 18:04:54Z arojas $
# Maintainer : mesmer <mesmer@archlinux.org>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=flashplugin-beta
pkgver=25
pkgrel=1
pkgdesc='Adobe Flash Player Beta'
url='http://labs.adobe.com/downloads/flashplayer.html'
arch=('i686' 'x86_64')
depends=('mozilla-common' 'libxt' 'gtk2' 'nss' 'hicolor-icon-theme')
optdepends=('libvdpau: GPU acceleration on Nvidia card')
conflicts=('flashplugin')
provides=('flashplayer' 'flashplugin')
license=('custom')
options=(!strip)
install=flashplugin.install
backup=(etc/adobe/mms.cfg)
source=(mms.cfg)
source_i686=("flash_player_npapi_linux_${pkgver}_i386.tar.gz"::https://fpdownload.macromedia.com/pub/labs/flashruntimes/flashplayer/linux32/flash_player_npapi_linux.i386.tar.gz)
source_x86_64=("flash_player_npapi_linux_${pkgver}_x86_64.tar.gz"::https://fpdownload.macromedia.com/pub/labs/flashruntimes/flashplayer/linux64/flash_player_npapi_linux.x86_64.tar.gz)
md5sums=('f34aae6279b40e0bd2abfb0d9963d7b8')
md5sums_i686=('dfd3088dc0a4f75b8f2e4fc155cbeba9')
md5sums_x86_64=('039bfbce80409056e6c1980fc35b33e7')


prepare () {
    # In Adobe's x86_64 tarball, files in usr/lib/ are symlinked to
    # counterparts in usr/lib64/
    [[ $CARCH = 'x86_64' ]] && (
        rm -r usr/lib/
        mv usr/{lib64,lib}
    )

    # KDE 4 is no longer supported by Arch
    rm -r usr/{lib,share}/kde4

    chmod +x usr/bin/flash-player-properties
}

package() {
    cp -dr --no-preserve=ownership usr "$pkgdir/"
    install -Ddm755 "$pkgdir/usr/share/licenses/$pkgname/"
    cp -dr --no-preserve=ownership LGPL "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
    install -Dm755 "libflashplayer.so" "$pkgdir/usr/lib/mozilla/plugins/libflashplayer.so"
    install -Dm644 readme.txt "$pkgdir/usr/share/doc/$pkgname/readme.txt"
    install -Dm644 mms.cfg "$pkgdir/etc/adobe/mms.cfg"
}
