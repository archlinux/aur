# Maintainer: revanthnemtoor <revanthnemtoor@github.com>
pkgname=hyperfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A high-performance system fetch tool written in Rust"
arch=('x86_64')
url="https://github.com/revanthnemtoor/hyperfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
# Note: Pointing to a specific commit since v0.1.0 tag doesn't exist yet.
# You should update this to a tag once you create one (e.g. v0.1.0).
_commit=032a11b4a225954fe1fad9631fb0c093b120cff4
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('deb82adc0fd1f4ddde4a91f0407dd6618d6ecdadf429a1e826d264fd6959eaf4')

prepare() {
  cd "$pkgname-$_commit"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$_commit"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$_commit"
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$_commit"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Licenses usually go in /usr/share/licenses/$pkgname/
  # If you add a LICENSE file to your repo, uncomment the lines below:
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
