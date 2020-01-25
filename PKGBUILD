# Maintainer: Alexander Kjäll <alexander.kjall@gmail.com>
pkgname=ripasso-cursive
pkgrelname=ripasso
pkgver=0.4.0
pkgrel=1
pkgdesc="A password manager that uses the file format of the standard unix password manager 'pass', implemented in rust."
url="https://github.com/cortex/ripasso/"
arch=('x86_64')
license=("GPL3")
depends=('openssl' 'libxcb' 'libgpg-error' 'zlib' 'gpgme')
makedepends=('openssl' 'libgit2' 'gettext' 'cargo')
source=("https://github.com/cortex/ripasso/archive/release-$pkgver.tar.gz")
conflicts=('ripasso-git')
md5sums=()
sha256sums=('c55576c80a00a22685a2261ddb3d055489f63686c9bccc991d1cde61bff3d712')

build() {
    cd "$pkgrelname-release-$pkgver" || exit 1
    cargo build -p ripasso-cursive -p ripasso-man --release --locked
}

check() {
    cd "$pkgrelname-release-$pkgver" || exit 1
    cargo test --release --locked
}

package() {
    cd "$pkgrelname-release-$pkgver" || exit 1
    $srcdir/$pkgrelname-release-$pkgver/target/release/ripasso-man > $srcdir/$pkgrelname-release-$pkgver/ripasso-cursive.1
    rm -f $srcdir/$pkgrelname-release-$pkgver/ripasso-cursive.1.gz
    gzip $srcdir/$pkgrelname-release-$pkgver/ripasso-cursive.1
    mkdir -p "$pkgdir/usr/share/man/man1/"
    mkdir -p "$pkgdir/usr/share/ripasso/"
    install -Dm0644 "$srcdir/$pkgrelname-release-$pkgver/ripasso-cursive.1.gz" "$pkgdir/usr/share/man/man1/"
    install -Dm0555 "$srcdir/$pkgrelname-release-$pkgver/target/release/ripasso-cursive" "$pkgdir/usr/bin/$pkgrelname-cursive"

    install -Dm0644 "$srcdir/$pkgrelname-release-$pkgver/target/translations/cursive/fr.mo" "$pkgdir/usr/share/ripasso/"
    install -Dm0644 "$srcdir/$pkgrelname-release-$pkgver/target/translations/cursive/it.mo" "$pkgdir/usr/share/ripasso/"
    install -Dm0644 "$srcdir/$pkgrelname-release-$pkgver/target/translations/cursive/nb.mo" "$pkgdir/usr/share/ripasso/"
    install -Dm0644 "$srcdir/$pkgrelname-release-$pkgver/target/translations/cursive/nn.mo" "$pkgdir/usr/share/ripasso/"
    install -Dm0644 "$srcdir/$pkgrelname-release-$pkgver/target/translations/cursive/sv.mo" "$pkgdir/usr/share/ripasso/"
}
