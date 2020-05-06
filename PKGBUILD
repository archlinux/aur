# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: robertfoster
# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=janus-gateway
pkgver=0.9.4
pkgrel=1
pkgdesc="Janus WebRTC Server"
arch=('x86_64' 'i686')
url='http://janus.conf.meetecho.com'
license=('GPL3')
depends=('ffmpeg'
         'glib2'
         'jansson'
         'libconfig'
         'libmicrohttpd'
         'libnice'
         'libogg'
         'librabbitmq-c'
         'libsrtp'
         'libusrsctp-git'
         'libwebsockets'
         'lua'
         'paho-mqtt-c-git'
         'openssl'
         'opus'
         'sofia-sip')
makedepends=('cmake'
             'gengetopt')
install=janus-gateway.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/meetecho/janus-gateway/archive/v${pkgver}.tar.gz"
        'janus.service'
        'janus.conf')
sha256sums=('97f3653066748f4f2888b6571d28ecf400653c86523cb1c1ed42ba065649cba9'
            'cf2b6c8fdcd60ccfa179c4cd207a23ee7edfee90588c2c3847aa6cda418bed7f'
            '60f6aef6b082f6c3f15803f7f727a2a023d6d18668e309571af3dff55bce1e92')

_userid=531

build() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
    ./configure \
        --prefix /usr \
        --sysconfdir /etc \
        --disable-docs \
        --enable-javascript-commonjs-module \
        --enable-post-processing \
        --enable-mqtt \
        --enable-rabbit-mq
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install configs
    backup+=($(cd "$pkgdir" && echo "etc/janus/"*.jcfg))
    rm -f "$pkgdir/usr/share/janus/certs/mycert.{key,pem}"
    install -dm0700 -o "$_userid" -g "$_userid" "${pkgdir}/var/lib/janus"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$srcdir/janus.service"
    install -Dm644 -t "$pkgdir/usr/lib/sysusers.d/" "$srcdir/janus.conf"
}
