# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: feighur
# Maintainer: robertfoster
# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=janus-gateway
pkgver=0.10.2
pkgrel=1
pkgdesc="An open source, general purpose, WebRTC server"
arch=('x86_64' 'i686')
url='https://janus.conf.meetecho.com'
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
backup=('etc/janus/janus.eventhandler.gelfevh.jcfg'
        'etc/janus/janus.eventhandler.mqttevh.jcfg'
        'etc/janus/janus.eventhandler.nanomsgevh.jcfg'
        'etc/janus/janus.eventhandler.rabbitmqevh.jcfg'
        'etc/janus/janus.eventhandler.sampleevh.jcfg'
        'etc/janus/janus.eventhandler.wsevh.jcfg'
        'etc/janus/janus.jcfg'
        'etc/janus/janus.logger.jsonlog.jcfg'
        'etc/janus/janus.plugin.audiobridge.jcfg'
        'etc/janus/janus.plugin.duktape.jcfg'
        'etc/janus/janus.plugin.echotest.jcfg'
        'etc/janus/janus.plugin.lua.jcfg'
        'etc/janus/janus.plugin.nosip.jcfg'
        'etc/janus/janus.plugin.recordplay.jcfg'
        'etc/janus/janus.plugin.sip.jcfg'
        'etc/janus/janus.plugin.streaming.jcfg'
        'etc/janus/janus.plugin.textroom.jcfg'
        'etc/janus/janus.plugin.videocall.jcfg'
        'etc/janus/janus.plugin.videoroom.jcfg'
        'etc/janus/janus.plugin.voicemail.jcfg'
        'etc/janus/janus.transport.http.jcfg'
        'etc/janus/janus.transport.mqtt.jcfg'
        'etc/janus/janus.transport.nanomsg.jcfg'
        'etc/janus/janus.transport.pfunix.jcfg'
        'etc/janus/janus.transport.rabbitmq.jcfg'
        'etc/janus/janus.transport.websockets.jcfg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/meetecho/janus-gateway/archive/v${pkgver}.tar.gz"
        'janus.service'
        'janus.conf')
sha256sums=('b82ea3a2573296a5dd581baf397eebb6b0163c4d3ef12dd168c0a5a8510fca06'
            'cf2b6c8fdcd60ccfa179c4cd207a23ee7edfee90588c2c3847aa6cda418bed7f'
            'aa2480ba28a049ac3571159583736216e1a5db145c0df672d4ff0a2fc7d9789f')

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
        --enable-rabbitmq
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install configs
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$srcdir/janus.service"
    install -Dm644 -t "$pkgdir/usr/lib/sysusers.d/" "$srcdir/janus.conf"
}
