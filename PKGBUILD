# Maintainer: Andy Locks <jandylokc@gmail.com>
pkgname=swhook
pkgver=0.0.1
pkgrel=1
pkgdesc='A minimalistic Webhook server'
arch=('x86_64')
url="https://github.com/AndyLocks/swhook"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$url/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('c7a25c1891cf4186cac66480185ffea6d53d09d3133dbfd5bbe5ba5de822bd6c')

build() {
  cd "$srcdir/$pkgname-$pkgname-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgname-v$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"

  "$pkgdir/usr/bin/$pkgname" completions bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  "$pkgdir/usr/bin/$pkgname" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  "$pkgdir/usr/bin/$pkgname" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

  install -Dm755 "etc/hello_world" "$pkgdir/usr/share/swhook/methods/hello_world"
  install -Dm644 "etc/swhook.conf" "$pkgdir/etc/swhook.conf"
  install -Dm644 "etc/swhook.service" "$pkgdir/usr/lib/systemd/system/swhook.service"
}
