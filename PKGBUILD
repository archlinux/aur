# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.21.3'
pkgrel=1
pkgdesc="An extended 'cp'"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/tarka/xcp'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f8f0a6ef6971a64791b3d2d4cc7c4392027c90ce23910d956aa8d78bedfb99669df02b2758451c369674d0478c6478b050c3d068e0a8dab4bcc120ec40fa4f04')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver

  if grep --quiet '^mail:' /etc/passwd; then
    ./tests/scripts/test-linux.sh
  else
    ./tests/scripts/test-linux.sh test_no_acl
  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "completions/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 "completions/$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
