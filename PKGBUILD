# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=libssm
_pkgname=ssm
pkgver=1.4.0
pkgrel=3
pkgdesc="A C++ toolkit for superposition of macromolecules"
arch=('i686' 'x86_64')
url="https://launchpad.net/ssm"
license=('LGPL')
depends=('mmdb2>=2.0.19-1' 'libccp4>=6.5.1-6')
replaces=('ssmlib')
source=(ftp://ftp.ccp4.ac.uk/opensource/$_pkgname-$pkgver.tar.gz
        ssm-configure.ac.patch
	ssm.pc.in)
sha256sums=('dea88fd6a2716702ba064ca7c5889d98ee994b1d76227634cb3f7228893a8238'
            '271ec9165b4f5dd5e8ccc622056de2dee0582c8efa42ce8652d560b67d7fa8b4'
            'fd8c44c92c60768744840959c0caa6ccf53018a54f3b31263b5afe672e1d4a30')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np0 -i "$srcdir/ssm-configure.ac.patch"
  
  cp $srcdir/ssm.pc.in ./ssm.pc.in
  aclocal
  libtoolize --automake --copy
  autoconf
  automake --copy --add-missing --gnu
  ./configure --prefix=/usr \
              --with-mmdb=/usr \
              --enable-ccp4 \
              --enable-shared \
              --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
} 
