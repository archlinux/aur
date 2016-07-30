# Maintainer:  Shengyu Zhang <lastavengers@outlook.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Marcel Wysocki <maci@satgnu.net>
# Contributor: coolkehon <coolkehon at g m a i l>

pkgname=libircclient-pc
_pkgname=libircclient
pkgver=1.8
pkgrel=2
pkgdesc='Small but powerful library, which implements client-server IRC protocol, with pkg-config support'
arch=('i686' 'x86_64')
url='http://www.ulduzsoft.com/libircclient/'
license=('GPL')
depends=('glibc')
makedepends=('python2-sphinx' 'python2-rst2pdf') 
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "https://gist.githubusercontent.com/LastAvenger/af72b0fe71ed80dfb4fa87d74805abe0/raw/9dbb264f47d5e8662f942e7863d111b9ed1cd920/libircclient.pc"
       )
md5sums=('a1b4fd5491a36b8aedf65a6845755800'
         'a70bcacc524b904cbb7b644c7f385a72'
        )
conflicts=('libircclient')

prepare() {
  cd $_pkgname-$pkgver/src

  # fix include dir path
  sed -i "s/@\/include/&\/$_pkgname/" Makefile.in
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --enable-shared
  cd src && make

  cd ../doc
  make SPHINXBUILD=sphinx-build2 singlehtml man
}

package() {
  install -Dm644 $_pkgname.pc "$pkgdir"/usr/lib/pkgconfig/$_pkgname.pc

  cd $_pkgname-$pkgver/src
  make DESTDIR="$pkgdir" install

  # docs
  install -d "$pkgdir/usr/share/doc/$_pkgname"
  cp -a ../doc/_build/singlehtml/* "$pkgdir/usr/share/doc/$_pkgname"

  # man
  install -Dm644 ../doc/_build/man/$_pkgname.1 \
    "$pkgdir/usr/share/man/man1/$_pkgname.1"

  # examples
  install -d "$pkgdir/usr/share/$_pkgname/examples"
  install -Dm644 ../examples/* \
    "$pkgdir"/usr/share/$_pkgname/examples
}
