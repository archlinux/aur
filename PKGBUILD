# Maintainer up to 2020-07-10: Aaron Griffin <aaron@archlinux.org>
# Maintainer : Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=oprofile
pkgver=1.4.0
pkgrel=1
pkgdesc='System-wide profiler for Linux systems'
arch=('x86_64')
url="http://oprofile.sourceforge.net"
license=('GPL')
depends=('popt' 'gcc-libs' 'zlib' 'sh')
options=('staticlibs')
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
        oprofile.sysusers)
sha1sums=('d4d7634372d18de821b33650ad0ff7392e94c6e3'
          'efcd625073759b69f95cf74dbb4c2839e03af017')

build() {
  cd $pkgname-$pkgver
#CXXFLAGS+=" -std=gnu++03"
  ./configure --prefix=/usr --with-x
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/var/lib/oprofile"

# installing development libraries and headers - FS#20089
  install -d  "$pkgdir/usr/include/oprofile"
  install -m644 config.h libop/op_*.h libregex/op_*.h libdb/odb.h \
    libpp/{locate_images.h,image_errors.h} libutil/op_*.h \
    libutil++/{op_*.h,bfd_support.h,utility.h,cached_value.h} "$pkgdir/usr/include/oprofile"
  install -m644 libop/libop.a libdb/libodb.a "$pkgdir/usr/lib/"
  install -m644 libabi/libabi.a "$pkgdir/usr/lib/libopabi.a"
  install -m644 libutil/libutil.a "$pkgdir/usr/lib/liboputil.a"
  install -m644 libutil++/libutil++.a "$pkgdir/usr/lib/liboputil++.a"
}

