# Maintainer: Andy Locks <jandylokc@gmail.com>
pkgname=swhook
pkgver=0.0.3
pkgrel=1
pkgdesc='A minimalistic Webhook server'
arch=('x86_64')
url="https://github.com/AndyLocks/swhook"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$url/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('249a95f485d7c970c4732c37beab0c069810c37fb4176117c7699049621096dd')

build() {
  cd "$srcdir/$pkgname-$pkgname-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgname-v$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 swhook.1.gz "$pkgdir/usr/share/man/man1/swhook.1.gz"

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
