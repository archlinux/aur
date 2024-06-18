# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=shpool
pkgver=0.6.2
pkgrel=1
pkgdesc='Think tmux, then aim... lower'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/shell-pool/shpool'
license=(Apache-2.0)
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
checkdepends=('fish' 'less' 'zsh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('36a7d6d656a5724d6c32a8d5cc4a425771398b7a1ab6928b95fed1ed36399e7b91bce6ce5ca5c9a62e030f6409b3af2d0fbd5ee97bd37912f62f471f7221e135')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver

  XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$PWD/test-run}" \
    cargo test --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 README.md -t \
    "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 systemd/shpool.service -t \
    "$pkgdir/usr/lib/systemd/user/"

  install -Dm644 systemd/shpool.socket -t \
    "$pkgdir/usr/lib/systemd/user/"
}
