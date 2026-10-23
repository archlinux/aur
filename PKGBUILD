# Maintainer: bahdotsh <appu.yess@gmail.com>
# Contributor: 9M2PJU <9m2pju@gmail.com>
pkgname=hopchat-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Offline, end-to-end encrypted terminal chat for your local network. No server, no internet, no accounts. (latest git)"
arch=('x86_64' 'aarch64')
url="https://github.com/bahdotsh/hopchat"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'cargo')
provides=('hopchat')
conflicts=('hopchat')
source=("$pkgname::git+https://github.com/bahdotsh/hopchat.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo test --locked --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/hopchat" "$pkgdir/usr/bin/hopchat"
  install -Dm644 packaging/hopchat.1 "$pkgdir/usr/share/man/man1/hopchat.1"
  install -Dm644 packaging/hopchat.desktop "$pkgdir/usr/share/applications/hopchat.desktop"
  install -Dm644 packaging/hopchat.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/hopchat.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
