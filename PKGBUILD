# $Id: PKGBUILD 255073 2015-12-10 04:42:49Z foutrelis $
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=lib32-audiofile
_pkgname=audiofile
pkgver=0.3.6
pkgrel=1
pkgdesc="Silicon Graphics Audio File Library"
arch=('i686' 'x86_64')
url="http://www.68k.org/~michael/audiofile/"
license=('LGPL')
depends=('gcc-libs' 'alsa-lib' 'flac')
source=("http://audiofile.68k.org/$_pkgname-$pkgver.tar.gz"
        "fix-undefined-behavior-in-sign-conversion.patch")
sha256sums=('cdc60df19ab08bfe55344395739bb08f50fc15c92da3962fac334d3bff116965'
            'b584998c79e75637f69d88691e420309db5938e0e7ac9d1c6e73db8a13718e83')
prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 <"$srcdir/fix-undefined-behavior-in-sign-conversion.patch"
}
build() {
  cd "$srcdir/$_pkgname-$pkgver"
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --build=i686-pc-linux-gnu \
    --disable-docs \
    --disable-examples
  make
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  cd "$pkgdir/usr"
  rm -r bin include
}
# vim:set ts=2 sw=2 et:
