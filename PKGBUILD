# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=doctave
pkgver=0.4.1
pkgrel=1
pkgdesc="A batteries-included developer documentation site generator"
arch=('x86_64')
url="https://www.doctave.com"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
_commit='bde7764bdbc66acc0db726126332db440959a492'
source=(
  "$pkgname::git+https://github.com/Doctave/doctave.git#commit=$_commit"
  'Cargo.lock'
)
sha512sums=('SKIP'
            'cad78f16b0d1b05f03b1e3ef3cf2bfa2ba5095d0850ca424e4bc7e946a0fa8656c835224101c05b5a13bf23767351699f6988a9e53ebd6ab1a16a1228c23950d')
b2sums=('SKIP'
        '5a981b59020045aff81ab12c396478546dbada470e09ecf908f046cbd9792e9ac26d59f273768ea46a5bb36db136860ac756e956916822143da8ca246e375a79')

pkgver() {
  cd "$pkgname"
  git describe --tags
}

prepare() {
  cd "$pkgname"

  cp -vf ../Cargo.lock .

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  cargo build --frozen --release 
}

check() {
  cd "$pkgname"
  cargo test --frozen 
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/doctave

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
