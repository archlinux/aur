# Contributor: Leah Neukirchen <leahneukirchen.org>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: pjvm <pjvm742 at disroot dot org>
pkgname=nn
pkgver=6.7.3
_debver=15
pkgrel=4
pkgdesc="Heavy-duty USENET news reader (curses-based client, with Debian patches)"
arch=('i686' 'x86_64')
url="http://packages.debian.org/en/sid/news/nn"
license=('custom')
depends=('sh' 'ncurses')
makedepends=('gawk')
install=nn.install
source=("http://deb.debian.org/debian/pool/main/n/nn/nn_6.7.3.orig.tar.gz"
        "https://deb.debian.org/debian/pool/main/n/nn/nn_$pkgver-$_debver.debian.tar.xz"
        "config.h")
sha256sums=('f696e9e2115ea4019398fc06aadcf07c43822559210cd05daf20801ea733f3ba'
            'f19bf0821d96decba2e3a632ad8762ea12010fe7850ca9140f0ef888cdd61314'
            'SKIP') # checksums from Debian's .dsc file

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  for patchfile in "$srcdir"/debian/patches/*.diff
  do
	  cat "$patchfile" | patch -p1
  done
  cp -f "$srcdir/config.h" .
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir"/usr/{bin,lib/nn/help,share/man/{man1,man8}}
  DESTDIR="$pkgdir" ./inst n
  install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "$srcdir/debian/nnbatch.1" "$pkgdir/usr/share/man/man1/nnbatch.1"
  rm -rf "$pkgdir"/usr/share/man/man8 \
         "$pkgdir"/usr/share/man/man1/nn*.1m* \
         "$pkgdir"/usr/bin/{nnadmin,nnstats,nnusage,nnact}
}
