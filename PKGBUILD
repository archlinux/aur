pkgname=rmqtt
pkgver=0.18.1
pkgrel=6
pkgdesc="MQTT Server/MQTT Broker - Scalable Distributed MQTT Message Broker for IoT in the 5G Era"
arch=(x86_64 aarch64)
url="https://github.com/rmqtt/rmqtt"
license=('MIT')
conflicts=(rmqtt-git librmqtt_macros.so)
makedepends=(rust cmake cargo protobuf)
options=('!strip' '!lto')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
	'rmqttd.toml'
	'rmqttd.service')
sha256sums=('5ff05b98f0ea21c317b71c9a8ec822536db1e6babb47f2fc541ac4406eb6fc23'
            '68e467ee60b993eb6dfa70fdef9f70850b9bcf94e5f2cd3f0316dffdf25005b1'
            '9f76865ca930a927c919597f6bb36a9306b1b8227f58137a3979bfa766095079')

build() {
    cd $srcdir/$pkgname-$pkgver

    export CARGO_TARGET_DIR=$srcdir/target
    cargo build --release
}

package() {
    install -Dm0755 -o root -g root $srcdir/target/release/rmqttd -t $pkgdir/usr/bin/
    install -Dm0644 -o nobody -o nobody $srcdir/rmqttd.toml -t $pkgdir/etc/rmqtt/
    install -Dm664 -o root -o root $srcdir/rmqttd.service -t $pkgdir/usr/lib/systemd/system/
}
