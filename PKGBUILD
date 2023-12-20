# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.16.0'
pkgrel=2
pkgdesc="An extended 'cp'"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/tarka/xcp'
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	xcp.bash
	xcp.fish
	xcp.zsh)
sha512sums=('7df09979bee61bfe1dee0446b72a718d619aa431d63a2521e0d9434f394c138529b573511262f34990bdb6e0acf27c8e5f6a2506ceb9425b47ebeb779d7b7d9a'
            'cb5f337a5a91bdfc5ec2d1cb63b57308cf5ee52e60e2b6cd946909abb96b9c0ccaaa8c802d40e47c25fe1df41cdd20c56c324d41a4ce06515d0b0670367a0b59'
            '3a61b68be8722088960b132d50b453afe778845a95c65606bbd68a181adfe730627c80556cc14a97d63e83c828346f8b43e752d7490e93103512f9cfbda28270'
            '34da34a1f10b589b66e86ee780ee913191e67a671424930793333a00af02d2e7305b9829f6bc81ee8eaa14c34e0d61397aa3d5cae393c4b74771e201de036046')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  # reflink tests are currently broken on ext4
  cargo test --release --locked --features test_no_reflink
}

package() {
  install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # completions
  install -Dm644 "$srcdir/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$srcdir/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 "$srcdir/$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
