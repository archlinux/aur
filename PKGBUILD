# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributer: Jason Chu <jchu@xentac.net>

pkgname=sweep
pkgver=0.9.3
pkgrel=6
pkgdesc="Sound editing and mixing program"
arch=('x86_64')
url="http://www.metadecks.org/software/sweep/"
license=('GPL2')
groups=('pro-audio')
depends=('glibc' 'libmad' 'speex')
makedepends=('alsa-lib' 'gtk2' 'libogg' 'libsamplerate' 'libsndfile'
'libvorbis')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('e1e2018ae46cb77cc3aa8faf8f83fc50e937600e6103c9ebb1bfee5a43c30aa1710fd8876c1f59285356a9d0517607deda8c03463ad7a6dcfe72bbff486b6a46')
b2sums=('0c7fcffdfd86ee6c2527b88c2c5099d8934f995a4c474f5e235ebceedc6923b497c54f27bd7d2b5ec47c0c7a247ec3fa34ff8685a551af996c0e0ee3a552ae18')

build() {
  cd $pkgname-$pkgver
  # this is a general hack for similar linking errors
  # TODO: report upstream
  export LDFLAGS="$LDFLAGS -lgmodule-2.0"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  # prevent overlinking
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  depends+=('libasound.so' 'libgmodule-2.0.so' 'libgtk-x11-2.0.so'
  'libgdk-x11-2.0.so' 'libgdk_pixbuf-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so'
  'libogg.so' 'libpango-1.0.so' 'libsamplerate.so' 'libsndfile.so'
  'libvorbis.so' 'libvorbisenc.so' 'libvorbisfile.so')

  cd $pkgname-$pkgver
  make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" localstatedir="$pkgdir/var" install
}
