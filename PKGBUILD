# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=screencast
pkgver=1.6.0
pkgrel=2
pkgdesc='Command line interface to record a X11 desktop'
arch=('any')
url='https://github.com/dbermond/screencast/'
license=('GPL-2.0-or-later')
depends=('ffmpeg' 'xorg-xdpyinfo' 'libnotify' 'oxygen-icons')
optdepends=('imagemagick: watermark effect support'
            'slop: graphical screen region selection support'
            'sound-theme-freedesktop: sound notification support'
            'optipng: watermark optimization support'
            'oxipng: watermark optimization support'
            'littleutils: watermark optimization support'
            'truepng: watermark optimization support'
            'pingo: watermark optimization support'
            'advancecomp: watermark optimization support'
            'bash-completion: bash-completion support')
checkdepends=('xorg-server-xvfb' 'imagemagick' 'ttf-dejavu')
source=("https://github.com/dbermond/screencast/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/dbermond/screencast/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc"
        '010-screencast-fix-for-posix-shells.patch'::'https://github.com/dbermond/screencast/commit/3aca088565edce7d011f61f4278835c374d07b66.patch'
        '020-screencast-fix-muxer-and-demuxer-checks.patch'::'https://github.com/dbermond/screencast/commit/6081308bf6014c543b22f4750e944bb6d5ce10e0.patch'
        '030-screencast-fix-stream-mapping.patch'::'https://github.com/dbermond/screencast/commit/8855559fd84b56b63419fe69ea7b1a22f4124b28.patch')
sha256sums=('10a283372bf76753bdcbdc60661e0efe48bc579c3191f7c3495e14d65ad527e3'
            'SKIP'
            'fb068ac2ad623fb0a760d68cc542c62c580f6a08a761a203152ff6f01b4d34e6'
            '540c358e31e48562830442030ab1d26f9704d0886771d10b20df07ae49d8d58f'
            'e85b47f077b617102c72390a0e2a41c8d722331dacdd88c7a96bbecf98752774')
validpgpkeys=('3FFA6AB7B69AAE6CCA263DDE019A7474297D8577') # Daniel Bermond

prepare() {
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-screencast-fix-for-posix-shells.patch"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/020-screencast-fix-muxer-and-demuxer-checks.patch"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/030-screencast-fix-stream-mapping.patch"
}

build() {
    make -C "${pkgname}-${pkgver}"
}

check() {
    xvfb-run -n 71 --server-args='-screen 0 1280x720x24' \
        make -C "${pkgname}-${pkgver}" USEDISPLAY=':71.0' WMARK_FONT='DejaVu-Sans' AUDIOIN='none' test
}

package() {
    make -C "${pkgname}-${pkgver}" PREFIX='/usr' DESTDIR="$pkgdir" install
}
