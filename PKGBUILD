# Maintainer: Fabian Brosda <fabi3141@gmx.de>
pkgname=binfmtc
pkgver=0.17
pkgrel=1
pkgdesc="Execute C/C++ and Fortran Programs like scripts."
arch=('i686' 'x86_64')
url="https://www.netfort.gr.jp/~dancer/software/binfmtc.html.en"
license=('GPL')
depends=(systemd)
makedepends=(autoconf gcc)
source=(https://www.netfort.gr.jp/~dancer/software/downloads/$pkgname-$pkgver.tar.gz
        01-systemd-binfmt.patch
        02-remove-outdated.patch)
sha256sums=('c76ba4a9b05d6d9fe9b831c33ef11b3cb0bf8ccdada4f97de95bb0f6149553eb'
            'eb1b203138ea364d90b9c3178b112f575402d921097e6a943bfb7dad6a38f3dd'
            '5503ef878184ac4a1e0a4752817ff457804b886ec7a2029fd01625ca9207e134')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  for filename in "${source[@]}";
  do
    if [[ "$filename" =~ \.patch$ ]]; then
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
