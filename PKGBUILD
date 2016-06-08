# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Bjoern Franke <bjo@nord-west.org>

pkgname=tvheadend

pkgver=4.0.9
pkgrel=2
pkgdesc="TV streaming server for Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://tvheadend.org/projects/tvheadend"
license=('GPL3')
depends=('avahi' 'linuxtv-dvb-apps' 'openssl' 'python2' 'ffmpeg2.8' 'uriparser')
makedepends=('git' 'wget')
optdepends=('xmltv: For an alternative source of programme listings')
provides=('tvheadend')
conflicts=('tvheadend' 'hts-tvheadend' 'hts-tvheadend-svn' 'hts-tvheadend-git' 'tvheadend-git')
install=tvheadend.install

source=("https://github.com/tvheadend/tvheadend/archive/v$pkgver.tar.gz" 
	'tvheadend.service'
	'tvheadend-4.0.9-1.patch'
)
sha512sums=('ba8c6edcef126c6a260a9251b0948747074061c8f16fb20f03b250c6698645172c9396530b7fa44bf9cf4d8305fcece08c672c812ba6c48211edfbb2691fb58e'
            '456084a08ce0e02a4a32d67a8a7937d45695cb4b08b29297ead8a7e9d2a92963335f653f56d4c9346f4b2729868408fafbcd4caebf9fc8cdaa90171514cf4a57'
            '166985b311e1e004afed53af1fdd58b0f29f3fd09af367abca270f94564f5f821027e60220f9e588a8895939eae360e99947f45b863fbbc0b541c99389d82bad')
 
prepare() {
    export PKG_CONFIG_PATH=/usr/lib/ffmpeg2.8/pkgconfig
    cd ${srcdir}/${pkgname}-${pkgver}
    patch -p1 < ../tvheadend-4.0.9-1.patch
    ./configure --prefix=/usr --python=python2
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
    chmod 0644 ${pkgdir}/usr/share/man/man1/tvheadend.1
    install -D -m 644 "$srcdir/tvheadend.service" "$pkgdir/usr/lib/systemd/system/tvheadend.service"
}
