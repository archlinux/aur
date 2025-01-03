pkgname=hatsu
_pkgver=0.3.2
pkgver=0.3.2
pkgrel=1.0
pkgdesc='Self-hosted & Fully-automated ActivityPub Bridge for Static Sites.'
arch=('x86_64' 'aarch64')
url='https://github.com/importantimport/hatsu'
license=('AGPL-3.0')
depends=('sqlite')
makedepends=('git' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/importantimport/hatsu/archive/refs/tags/v${_pkgver}.tar.gz"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$pkgname.service"
        "$pkgname.env")
options+=(!lto)
sha256sums=('87b1d484b52def1396058353901b514f679527aeb9c890a1d48c151504036910'
            '80e8a450ddd50a77e3c6aae1ce3d1efe1a5ef83a1eff2466a5b8be9002d3627b'
            '257fe7e172293e96f0ba725dea88ef033837260ce65949420e7798d40e63ac9c'
            '3543f60491638d5c44c1332ca3d4de3f7cba698c8237abf2d0d48a5d7d9ac9c4'
            '5b32af12abab9e1b0c27cb1540c403fc024af9eeb77a52bb54f1085533ef9081')

prepare() {
  cd ${pkgname}-$_pkgver
  rm rust-toolchain.toml
}

build() {
  cd ${pkgname}-$_pkgver
  cargo build --release
}

package() {
  cd ${pkgname}-$_pkgver
  install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
  install -Dm0644 "../$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm0644 "../$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm0644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm0644 "../$pkgname.env" "$pkgdir/etc/hatsu/.env"
}
