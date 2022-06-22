# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: feighur
# Maintainer: robertfoster
# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=janus-gateway
pkgver=1.0.3
pkgrel=1
pkgdesc='An open source, general purpose, WebRTC server'
arch=(x86_64 i686)
url='https://janus.conf.meetecho.com'
license=(GPL3)
depends=(
  'glib2'
  'jansson'
  'libconfig'
  'libmicrohttpd'
  'libnice'
  'libsrtp'
  'libusrsctp'
  'openssl'
)
optdepends=(
  'curl: TURN REST API support, RTSP support in Streaming/Event Handler plugin'
  'duktape: Javascript support'
  'ffmpeg: Post-processor'
  'libogg: Voicemail plugin and/or post-processor'
  'librabbitmq-c: RabbitMQ support for the Janus API or events'
  'libwebsockets: WebSockets support for Janus API'
  'lua: Lua plugin'
  'nanomsg: Nanomsg support for the Janus API'
  'opus: Bridge plugin'
  'paho-mqtt-c: MQTT support for the Janus API or events'
  'sofia-sip: SIP plugin'
)
makedepends=(
  'curl'
  'duktape'
  'ffmpeg'
  'gengetopt'
  'libogg'
  'librabbitmq-c'
  'libwebsockets'
  'lua'
  'nanomsg'
  'opus'
  'paho-mqtt-c'
  'sofia-sip'
)
backup=(
  'etc/janus/janus.eventhandler.gelfevh.jcfg'
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
  'etc/janus/janus.transport.websockets.jcfg'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/meetecho/janus-gateway/archive/v$pkgver.tar.gz"
  'janus.service'
  'janus.conf'
)
sha256sums=('5b8a7304761783585bfa8db7471bf8c393fa2a0ffc346747afadc0c1a9d213f5'
            'cf2b6c8fdcd60ccfa179c4cd207a23ee7edfee90588c2c3847aa6cda418bed7f'
            'bd6d7615e722adb64816fae3c5323f6aeb1b9561c39f1652568ed494ffdaa191')

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
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" \
    "$srcdir/janus.service"
  install -Dm644 -t "$pkgdir/usr/lib/sysusers.d/" \
    "$srcdir/janus.conf"
}
