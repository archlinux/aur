# Maintainer: Alonso Rodríguez <alonso.rodriguez (at) udc.es>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=oprofile
pkgver=1.4.0
pkgrel=2
pkgdesc='System-wide profiler for Linux systems'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="http://oprofile.sourceforge.net"
license=('GPL')
depends=('popt' 'gcc-libs' 'zlib' 'sh')
options=('staticlibs')
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
        oprofile.sysusers
        config-implicit.patch
        musl.patch
        gcc12.patch)
sha1sums=('d4d7634372d18de821b33650ad0ff7392e94c6e3'
          'efcd625073759b69f95cf74dbb4c2839e03af017'
          '96deeb49c0d7eaef5901933be61415422b149f50'
          '58c85b57e2958c770fc70069c689cddd8e7f73a1'
          '7616a6b9d4a5106f2412ae56c69692b7b682d02a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # Apply patches from gentoo: https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-util/oprofile/files
  sed -i 's/==/=/g' "configure.ac" && echo "Patching configure.ac succeeded"
  patch -Np1 -i "${srcdir}/config-implicit.patch"
  patch -Np1 -i "${srcdir}/musl.patch"
  patch -Np1 -i "${srcdir}/gcc12.patch"

  # autoreconf -fi || true
  /bin/sh ./autogen.sh
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-x
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
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
