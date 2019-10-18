# Maintainer: Alexander Kjäll <alexander.kjall@gmail.com>
pkgname=ripasso-cursive
pkgrelname=ripasso
pkgver=0.2.1
pkgrel=1
pkgdesc="A password manager that uses the file format of the standard unix password manager 'pass', implemented in rust."
url="https://github.com/cortex/ripasso/"
arch=('x86_64')
license=("GPL3")
depends=('openssl' 'libxcb' 'libgpg-error' 'zlib')
makedepends=('openssl' 'libgit2' 'gettext' 'cargo')
source=("https://github.com/cortex/ripasso/archive/release-0.2.1.tar.gz")
conflicts=('ripasso-git')
md5sums=()
sha256sums=('ec449a5fec848e14e38bbb5aaa91f733615e4dc46eb8a3a454fcafd1e0df8062')

build() {
    cd "$pkgrelname-release-$pkgver" || exit 1
    cargo build -p ripasso-cursive -p ripasso-man --release --locked
}

check() {
    cargo test --release --locked
}

package() {
    cd "$pkgrelname-release-$pkgver" || exit 1
    $srcdir/$pkgrelname-release-$pkgver/target/release/ripasso-man > $srcdir/$pkgrelname-release-$pkgver/ripasso-cursive.1
    rm -f $srcdir/$pkgrelname-release-$pkgver/ripasso-cursive.1.gz
    gzip $srcdir/$pkgrelname-release-$pkgver/ripasso-cursive.1
    mkdir -p "$pkgdir/usr/share/man/man1/"
    install -Dm0644 "$srcdir/$pkgrelname-release-$pkgver/ripasso-cursive.1.gz" "$pkgdir/usr/share/man/man1/"
    install -Dm0555 "$srcdir/$pkgrelname-release-$pkgver/target/release/ripasso-cursive" "$pkgdir/usr/bin/$pkgrelname-cursive"
}
