# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
#
# PRs are welcome here: https://github.com/yurikoles-aur/upwork
#

pkgname=upwork
_pkgname='Upwork'
pkgver=5.8.0.24
_hashver='aef0dc8c37cf46a8'
pkgrel=1
pkgdesc='Track your time for Hourly Payment Protection. Stay connected.'
arch=(x86_64)
url='https://www.upwork.com/ab/downloads/?os=linux'
license=(custom)
depends=(alsa-lib at-spi2-core gtk3 libxss nss openssl-1.0)
conflicts=(upwork-beta)
_useragent="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101 Firefox/104.0"
_rawver=${pkgver//./_}
DLAGENTS=("https::/usr/bin/curl --tlsv1.3 -H ${_useragent// /\\ } %u -o %o")
source=(https://upwork-usw2-desktopapp.upwork.com/binaries/v${_rawver}_${_hashver}/upwork_${pkgver}_amd64.deb
        LICENSE)
sha256sums=('f57d54fc8988f067c28982e92c3fa320260062c02bd4d24b94e32f79c5caee17'
            '793d8d7bc0f088c48798bda3d5483972636c6b8c5dcd9aeaf85411f7d4547b38')

prepare() {
    bsdtar -xpf data.tar.xz
}

package() {
    # Base
    install -dm755 $pkgdir/opt/${_pkgname}
    cp -dr --no-preserve=ownership opt/${_pkgname}/* $pkgdir/opt/${_pkgname}/

    # Code ref: https://github.com/electron-userland/electron-builder/blob/master/packages/app-builder-lib/templates/linux/after-install.tpl
    # SUID chrome-sandbox for Electron 5+
    test -e $pkgdir/opt/${_pkgname}/chrome-sandbox && chmod 4755 $pkgdir/opt/${_pkgname}/chrome-sandbox || true

    # Exec
    install -dm755 $pkgdir/usr/bin/
    ln -s /opt/${_pkgname}/${pkgname} $pkgdir/usr/bin/

    # Menu
    install -Dm644 usr/share/applications/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

    # Icons
    install -dm755 $pkgdir/usr/share
    cp -dr --no-preserve=ownership usr/share/icons "${pkgdir}/usr/share"

    # License
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

