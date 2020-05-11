# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: feighur
# Maintainer: robertfoster
# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=janus-gateway
pkgver=0.9.4
pkgrel=3
pkgdesc="Janus WebRTC Server"
arch=('x86_64' 'i686')
url='http://janus.conf.meetecho.com'
license=('GPL3')
depends=('glib2'
         'jansson'
         'libconfig'
         'libmicrohttpd'
         'libnice'
         'libsrtp'
         'libusrsctp-git'
         'openssl')
optdepends=('libwebsockets: WebSockets support for Janus API'
            'librabbitmq-c: RabbitMQ support for the Janus API or events'
            'paho-mqtt-c-git: MQTT support for the Janus API or events'
            'nanomsg: Nanomsg support for the Janus API'
            'curl: TURN REST API support, RTSP support in Streaming/Event Handler plugin'
            'sofia-sip: SIP plugin'
            'opus: Bridge plugin'
            'libogg: Voicemail plugin and/or post-processor'
            'ffmpeg: Post-processor'
            'lua: Lua plugin')
makedepends=('curl'
             'ffmpeg'
             'gengetopt'
             'libogg'
             'librabbitmq-c'
             'libwebsockets'
             'lua'
             'nanomsg'
             'opus'
             'paho-mqtt-c-git'
             'sofia-sip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/meetecho/janus-gateway/archive/v${pkgver}.tar.gz"
        'janus.service'
        'janus.conf')
sha256sums=('97f3653066748f4f2888b6571d28ecf400653c86523cb1c1ed42ba065649cba9'
            'cf2b6c8fdcd60ccfa179c4cd207a23ee7edfee90588c2c3847aa6cda418bed7f'
            'ad965a52fbe23e23a92b878bb08fa4c815b15a7569776882b21ff83c988dbd3e')

_userid=531

build() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
    ./configure \
        --prefix /usr \
        --sysconfdir /etc \
        --disable-docs \
        --enable-json-logger \
        --enable-mqtt \
        --enable-plugin-duktape \
        --enable-plugin-lua \
        --enable-post-processing \
        --enable-rabbit-mq
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install configs
    backup+=($(cd "$pkgdir" && echo "etc/janus/"*.jcfg))
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$srcdir/janus.service"
    install -Dm644 -t "$pkgdir/usr/lib/sysusers.d/" "$srcdir/janus.conf"
}
