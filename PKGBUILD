# Maintainer: Alexander Kjäll <alexander.kjall@gmail.com>
pkgname=ripasso-cursive
_pkgrelname=ripasso
pkgver=0.5.2
pkgrel=1
pkgdesc="A password manager that uses the file format of the standard unix password manager 'pass', implemented in rust."
url="https://github.com/cortex/ripasso/"
arch=('x86_64')
license=("GPL3")
depends=('openssl' 'libxcb' 'libgpg-error' 'zlib' 'gpgme' 'libgit2')
makedepends=('libgit2' 'gettext' 'rust')
source=("https://github.com/cortex/ripasso/archive/release-$pkgver.tar.gz")
conflicts=('ripasso-git')
md5sums=()
sha256sums=('805d2207c01cff017407c0dbfa996860c3a6b4b66c1f0e3816ad2f93883593f7')

build() {
    cd "$_pkgrelname-release-$pkgver" || exit 1
    cargo build -p ripasso-cursive --release --locked
}

check() {
    cd "$_pkgrelname-release-$pkgver" || exit 1
    cargo test --release --locked
}

package() {
    cd "$_pkgrelname-release-$pkgver" || exit 1
    rm -f $srcdir/$_pkgrelname-release-$pkgver/target/man-page/cursive/ripasso-cursive.1.gz

    # touch in order to make makepkg -f happy
    touch $srcdir/$_pkgrelname-release-$pkgver/target/man-page/cursive/ripasso-cursive.1
    gzip $srcdir/$_pkgrelname-release-$pkgver/target/man-page/cursive/ripasso-cursive.1
    mkdir -p "$pkgdir/usr/share/man/man1/"
    mkdir -p "$pkgdir/usr/share/ripasso/"
    install -Dm0644 "$srcdir/$_pkgrelname-release-$pkgver/target/man-page/cursive/ripasso-cursive.1.gz" "$pkgdir/usr/share/man/man1/"
    install -Dm0555 "$srcdir/$_pkgrelname-release-$pkgver/target/release/ripasso-cursive" "$pkgdir/usr/bin/$_pkgrelname-cursive"

    install -Dm0644 "$srcdir/$_pkgrelname-release-$pkgver/target/translations/cursive/fr.mo" "$pkgdir/usr/share/ripasso/"
    install -Dm0644 "$srcdir/$_pkgrelname-release-$pkgver/target/translations/cursive/it.mo" "$pkgdir/usr/share/ripasso/"
    install -Dm0644 "$srcdir/$_pkgrelname-release-$pkgver/target/translations/cursive/nb.mo" "$pkgdir/usr/share/ripasso/"
    install -Dm0644 "$srcdir/$_pkgrelname-release-$pkgver/target/translations/cursive/nn.mo" "$pkgdir/usr/share/ripasso/"
    install -Dm0644 "$srcdir/$_pkgrelname-release-$pkgver/target/translations/cursive/sv.mo" "$pkgdir/usr/share/ripasso/"
}
