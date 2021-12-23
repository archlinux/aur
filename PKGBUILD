# Maintainer: Alexander Kjäll <alexander.kjall@gmail.com>
# Maintainer: Stig Otnes Kolstad <stig@stigok.com>
pkgname=ripasso-git
pkgrelname=ripasso
pkgver=642.c8f0721
pkgrel=1
pkgdesc="A password manager that uses the file format of the standard unix password manager 'pass', implemented in rust."
url="https://github.com/cortex/ripasso/"
arch=('x86_64')
license=("GPL3")
depends=('openssl' 'libxcb' 'libgpg-error' 'zlib' 'gpgme' 'libgit2')
makedepends=('gettext' 'rust')
source=("git://github.com/cortex/ripasso.git")
conflicts=('ripasso')
md5sums=('SKIP')

build() {
  cd "$pkgrelname" || exit 1
  cargo build -p ripasso-cursive --release
}

pkgver() {
  cd ${srcdir}/${pkgrelname} || exit 1
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgrelname" || exit 1
  gzip -fk $srcdir/$pkgrelname/target/man-page/cursive/ripasso-cursive.1
  mkdir -p "$pkgdir/usr/share/man/man1/"
  mkdir -p "$pkgdir/usr/share/ripasso/"
  install -Dm0644 "$srcdir/$pkgrelname/target/man-page/cursive/ripasso-cursive.1.gz" "$pkgdir/usr/share/man/man1/"
  install -Dm0555 "$srcdir/$pkgrelname/target/release/ripasso-cursive" "$pkgdir/usr/bin/$pkgrelname-cursive"

  install -Dm0644 "$srcdir/$pkgrelname/target/translations/cursive/de.mo" "$pkgdir/usr/share/ripasso/"
  install -Dm0644 "$srcdir/$pkgrelname/target/translations/cursive/fr.mo" "$pkgdir/usr/share/ripasso/"
  install -Dm0644 "$srcdir/$pkgrelname/target/translations/cursive/it.mo" "$pkgdir/usr/share/ripasso/"
  install -Dm0644 "$srcdir/$pkgrelname/target/translations/cursive/nb.mo" "$pkgdir/usr/share/ripasso/"
  install -Dm0644 "$srcdir/$pkgrelname/target/translations/cursive/nn.mo" "$pkgdir/usr/share/ripasso/"
  install -Dm0644 "$srcdir/$pkgrelname/target/translations/cursive/sv.mo" "$pkgdir/usr/share/ripasso/"
}
