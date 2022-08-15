# Maintainer: Brett Dutro (brett dot dutro at gmail dot com)
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Frank Ickstadt (frank dot ickstadt at gmail dot com)

pkgname=libjbig-shared
pkgver=2.1
pkgrel=6
pkgdesc="Shared library interface to jbigkit built from Debian patchset"
arch=('x86_64' 'i686')
url="https://www.cl.cam.ac.uk/~mgk25/jbigkit/"
license=('GPL')
depends=('jbigkit')
provides=('libjbig.so.0')
source=(https://www.cl.cam.ac.uk/~mgk25/download/jbigkit-$pkgver.tar.gz
        http://deb.debian.org/debian/pool/main/j/jbigkit/jbigkit_$pkgver-3.1.debian.tar.xz)
sha256sums=('de7106b6bfaf495d6865c7dd7ac6ca1381bd12e0d81405ea81e7f2167263d932'
            'ebc3c52deaf37d52baea54d648a713640dc262926abda7bf05cd08e7db5dd1ee')

prepare() {
  cd "$srcdir"/jbigkit-$pkgver
  patch --forward --strip=1 -i "$srcdir"/debian/patches/allNewMainMakefile.diff
  patch --forward --strip=1 -i "$srcdir"/debian/patches/pbmtoolsMakefile.diff
  patch --forward --strip=1 -i "$srcdir"/debian/patches/shared-lib.diff
}

build() {
  cd "$srcdir"/jbigkit-$pkgver
  unset CFLAGS CPPFLAGS LDFLAGS
  [ "$CARCH" == "x86_64" ] && export CFLAGS="$CFLAGS -fPIC"
  make CFLAGS="$CFLAGS"
}

package() {
  cd "$srcdir"/jbigkit-$pkgver

  install -D -m755 libjbig/libjbig.so.0 "$pkgdir"/usr/lib/libjbig.so.0
  ln -s libjbig.so.0 "$pkgdir"/usr/lib/libjbig.so
}
