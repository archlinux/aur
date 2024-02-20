# Maintainer: Mekyt <hello at mek dot yt>

pkgname='rumqttd'
pkgver=0.19.0
pkgrel=3
pkgdesc='A high performance, embeddable MQTT broker'
arch=('x86_64')
url='https://github.com/bytebeamio/rumqtt'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/bytebeamio/rumqtt/archive/refs/tags/rumqttd-${pkgver}.tar.gz"
  'rumqttd.service'
  'rumqttd@.service'
  'rumqtt.sysusers'
)
b2sums=(
  'f7a13249021b0bc142568f84a5ac6c1dbce2314c0bd716d9a1bf1c5a82a9c794b7a79c8e00d86a98085cdad969c2ddea80b187ae8e580b5228351ddb2de5c27b'
  'a3bf1f5a8434d4292eafa6246df626625584219856a2c55a89452adaf02d29923580569df0e1dceef4cc572cb87b13402428010c85e38cad3387f7e0c686eec9'
  '3e0c29b4a3cbe6abf86def9e79e900723fd353d9ce64e3782aac7ce66e0db964c2e37891563e5c79411e43f5bd9f0a37b3fecd444db31fc4b554e3fb0d5f76d0'
  'a637f83755b832ed36c063bc5ba3cbe819ed82cbcb0ea5f0843d24e03cf4d3aa2cad664439afc1b183373326d944e63db84f1e047e081be36cf38a8a0738e2a8'
)
options=(!lto)
backup=('etc/rumqtt/config.toml')

build() {
    cd "rumqtt-${pkgname}-${pkgver}"

    cargo build --release
}

check() {
    cd "rumqtt-${pkgname}-${pkgver}"

    cargo test
}

package() {
    install -Dm 644 rumqttd.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 rumqttd@.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 rumqtt.sysusers "${pkgdir}/usr/lib/sysusers.d/rumqtt.conf"

    cd "rumqtt-${pkgname}-${pkgver}"

    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 rumqttd/rumqttd.toml "${pkgdir}/etc/rumqtt/config.toml"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
