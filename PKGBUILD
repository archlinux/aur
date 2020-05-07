# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: robertfoster
# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>
# Contributor: feighur

pkgname=janus-gateway
pkgver=0.9.4
pkgrel=2
pkgdesc="Janus WebRTC Server"
arch=('x86_64' 'i686')
url='http://janus.conf.meetecho.com'
license=('GPL3')
depends=('curl' # TURN REST API support, RTSP support in Streaming/Event Handler plugin
         'ffmpeg' # Post-processor
         'glib2'
         'jansson'
         'libconfig'
         'libmicrohttpd'
         'libnice'
         'libogg' # Voicemail plugin and/or post-processor
         'librabbitmq-c' # RabbitMQ support for the Janus API or events
         'libsrtp'
         'libusrsctp-git'
         'libwebsockets' # WebSockets support for Janus API
         'lua' # Lua plugin
         'nanomsg' # Nanomsg support for the Janus API
         'paho-mqtt-c-git' # MQTT support for the Janus API or events
         'openssl'
         'opus' # Bridge plugin
         'sofia-sip' # SIP plugin
)
makedepends=('cmake'
             'gengetopt')
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
    install -dm0700 -o "$_userid" -g "$_userid" "${pkgdir}/var/lib/janus"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$srcdir/janus.service"
    install -Dm644 -t "$pkgdir/usr/lib/sysusers.d/" "$srcdir/janus.conf"
}
