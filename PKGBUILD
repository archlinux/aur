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
md5sums=('2e4717c591a2cbbd4aeb63d00c87a0cb'
         '227635b3097771214e4ed5c97b698ff2')

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

  install -dm755 "$pkgdir/usr/share/man/man1"
  install -Dm644 xtail.1 "$pkgdir/usr/share/man/man1/xtail.1"

  install -Dm755 xtail $pkgdir/usr/bin/xtail
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

