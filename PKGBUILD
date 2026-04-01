pkgname=vellum
_reponame=Vellum
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayland wallpaper stack with daemon and TUI"
arch=('x86_64')
url="https://github.com/CPT-Dawn/Vellum"
license=('GPL3')
depends=('liblz4')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3318a3a12abbed3e566bf209bc0067ba89cd7a0eb10985cc9d2b67e54d5546c6')
install="$pkgname.install"

prepare() {
  cd "$srcdir/$_reponame-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$_reponame-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --frozen --locked --workspace --bins
}

package() {
  cd "$srcdir/$_reponame-$pkgver"

  install -Dm755 "$srcdir/target/release/vellum" "$pkgdir/usr/bin/vellum"
  install -Dm755 "$srcdir/target/release/vellum-daemon" "$pkgdir/usr/bin/vellum-daemon"

  install -Dm644 packaging/systemd/user/vellum-daemon.service \
    "$pkgdir/usr/lib/systemd/user/vellum-daemon.service"

  install -Dm644 packaging/autostart/vellum.desktop \
    "$pkgdir/usr/share/doc/$pkgname/examples/vellum.desktop"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
