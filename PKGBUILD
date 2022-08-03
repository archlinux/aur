pkgname=sui
pkgver=0.6.3.devnet
pkgrel=2
pkgdesc='Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language.'
url='https://sui.io'
arch=('x86_64')
license=('Apache')
depends=('rust' 'openssl')
makedepends=('git' 'rust' 'cmake' 'clang' 'curl')
source=("suid.conf"
        "sui.sysusers"
        "sui.tmpfiles"
        "suid.service"
        "git+https://github.com/MystenLabs/sui#tag=devnet-0.6.3"
        "https://github.com/MystenLabs/sui-genesis/raw/main/devnet/genesis.blob")
sha512sums=('c75abbdce2702a97813db7193908e2c629280ab49fc1fd8e624c760574489f396c2ec26a744689b77c5401bd5ef403f98c475c369735c287fef118b398d85eb0'
            '78f99a84c722388ecb34e78079c1e8e76f7762e32bf29aa9f2a3152d3990250190bf87d21744c736b0c615b9869bc29098eea6ece17665b80290629b50613f2c'
            '521e2127fc69987a9739d52d605b327ee692bc9a8712bddfd16c779590e801dacda122a0fe9e3c4c0da4660ec06da266f1689c7fecf9e4bbf1552e065019fffe'
            '6330a9c9aa4986b9135f3423d409a769f14c31042184f1c0d1e5b9d2e76456a5178c97b74198e3c4c3dcbc7924b0582feba5d930b5faf3dbf7c3aea161897a8b'
            'SKIP'
            '657f10edbd770b1fdee134190d152fb9296721efa9e40e69db19ae7fc67cfe34d6b5ff116f6b76f9cd9b82a9e2bd2136cc003d1cdd5fbb5ab092d6c2cf55fac1')

pkgver() {
  cd $pkgname

  echo $(git describe --tags | cut -d "-" -f 2).devnet
}

build() {
  cd $pkgname

  cargo build --release
}

package() {
  cd $pkgname

  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 755 "target/release/${pkgname}-node" "${pkgdir}/usr/bin/${pkgname}d"

  install -Dm644 "../${pkgname}d.conf" -t "$pkgdir/etc"
  install -Dm644 "../${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "../${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "../${pkgname}d.service" -t "${pkgdir}/usr/lib/systemd/system"

  install -Dm644 "../genesis.blob" -t "${pkgdir}/var/lib/${pkgname}"

  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
