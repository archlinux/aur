# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=aivpn
pkgver=0.4.0
pkgrel=1
pkgdesc="VPN that disguises traffic as legitimate application traffic to evade DPI"
arch=('x86_64')
url="https://github.com/infosave2007/aivpn"
makedepends=('rust' 'cargo')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/infosave2007/aivpn/archive/refs/tags/v${pkgver}.tar.gz"
        "aivpn.service"
        "aivpn.sysusers"
        "aivpn.tmpfiles"
        "server.json")
sha512sums=('989b1764141dbe542db00086e9c599a69c8afb2fde264aff109f0cc3b107a127da4a2893a0b1bb7d7b795e26711669e34248ab4eb5ea6798fe968a378cac4941'
            '1b7a0740e9ed666f846b6f950edfeaf4896899f7d4c44ea5faadea92c6b1a3f84f0f9d7c53fc6488480d75168f6d333aeb21e42b5d59e4981a9d3ed5ce0fc7d3'
            'cdca52deef0c352582aa324b7732248bfb14f2d10b23700107e1457696c6633cb23d0c8a9f26a51f4a6555eb6e94705e64ef8189252277e0c1d96cd5836f4bcd'
            '786f7c638b52a907828e417691f6759b2d59cbae5a9dd61acbe3d19693f11bec0138ff22469fafc9d3c418f85aea149546868ebb3d7e0e439ebfac877f87c1af'
            'eb70d44a7590e81d12717cbef888e4b8862eea2acb9199b7e4d980d8584764e7e58f7611ab8143facf3a07388b85db84ef67c5c68eb447ce9594519dc88de824')
backup=('etc/aivpn/server.json')
install="aivpn.install"

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/target/release/aivpn-server" "${pkgdir}/usr/bin/aivpn-server"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/target/release/aivpn-client" "${pkgdir}/usr/bin/aivpn-client"
  install -Dm 644 "${srcdir}/aivpn.service" "${pkgdir}/usr/lib/systemd/system/aivpn.service"
  install -Dm 644 "${srcdir}/aivpn.sysusers" "${pkgdir}/usr/lib/sysusers.d/aivpn.conf"
  install -Dm 644 "${srcdir}/aivpn.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/aivpn.conf"
  install -Dm 640 "${srcdir}/server.json" "${pkgdir}/etc/aivpn/server.json"

  local mask
  for mask in "$srcdir/$pkgname-$pkgver/mask-assets/"*.json; do
    install -Dm 644 "$mask" "${pkgdir}/var/lib/aivpn/masks/$(basename "$mask")"
  done
}
