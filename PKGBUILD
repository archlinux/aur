# Maintainer: willemw <willemw12@gmail.com>
# Contributor: blaise <blaise@gmail.com>

pkgname=xtail
_pkgver=2.1
_pkgver_diff=2.1-5.1
pkgver=2.1.5.1
pkgrel=1
pkgdesc="Tail multiple logfiles at once, even if rotated"
arch=('x86_64')
url="https://unicom.crosenthal.com/sw/xtail"
license=('BSD')
#source=(https://unicom.crosenthal.com/files/xtail-$_pkgver.tar.gz
source=(http://ftp.debian.org/debian/pool/main/x/xtail/xtail_$_pkgver.orig.tar.gz
        http://ftp.debian.org/debian/pool/main/x/xtail/xtail_$_pkgver_diff.diff.gz)
#noextract=(xtail_$_pkgver_diff.diff.gz)
sha256sums=('75184926dffd89e9405769b24f01c8ed3b25d3c4a8eac60271fc5bb11f6c2d53'
            'eb59ff51c5a595e306c28a98c09af3eb8176a0ff891a385107e8a489a2fe5196')

prepare() {
  # Workaround: *.diff.gz file is not extracted
  cp --dereference xtail_$_pkgver_diff{,.tmp}.diff.gz
  gunzip xtail_$_pkgver_diff.tmp.diff.gz

  chmod -R +w $pkgname-$_pkgver
  patch -Np0 -i xtail_$_pkgver_diff.tmp.diff
}

build() {
  cd $pkgname-$_pkgver

  autoreconf -v
  ./configure --prefix="$pkgdir/usr/bin" --mandir="$pkgdir/usr/share/man"
  make
}

package() {
  cd $pkgname-$_pkgver

  install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 xtail.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm755 xtail -t "$pkgdir/usr/bin"
}

