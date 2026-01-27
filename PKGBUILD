pkgname=rmqtt
pkgver=0.18.1
pkgrel=2
pkgdesc="MQTT Server/MQTT Broker - Scalable Distributed MQTT Message Broker for IoT in the 5G Era"
arch=(x86_64 aarch64)
url="https://github.com/rmqtt/rmqtt"
license=('MIT')
conflicts=(${pkgname%-git} librmqtt_macros.so)
makedepends=(rust cmake cargo)
options=('!strip' '!lto')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
	'rmqttd.toml'
	'rmqttd.service')
sha256sums=('5ff05b98f0ea21c317b71c9a8ec822536db1e6babb47f2fc541ac4406eb6fc23'
            '68e467ee60b993eb6dfa70fdef9f70850b9bcf94e5f2cd3f0316dffdf25005b1'
            '7f456a4fcbd4c5b4610ab849e22dfb1358e23a012289138be8897244848b07e3')

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
