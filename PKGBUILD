# Maintainer: Marco Pompili <marcs DOT pompili AT gmail DOT com>
# Contributor: Ben Duffield <bavardage AT archlinux.us>

pkgname=pocketsphinx
pkgver=5prealpha
pkgrel=3
pkgdesc='Lightweight speech recognition engine, specifically tuned for handheld and mobile devices, though it works equally well on the desktop.'
arch=('i686' 'x86_64')
url='http://cmusphinx.sourceforge.net'
license=('BSD')
makedepends=('swig')
depends=('sphinxbase=5prealpha' 'python2' 'python' 'gstreamer0.10-base' 'gst-plugins-base-libs')
source=("http://downloads.sourceforge.net/cmusphinx/$pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/cmusphinx/pocketsphinx/master/LICENSE")
md5sums=('e8402e90570935b26745d313c133b376'
         '93bfe6b712fe592d844ef581e1e53d47')
options=('!libtool')

prepare() {
  cp -R "$pkgname-$pkgver" "$pkgname-$pkgver-py2"
  cp -R "$pkgname-$pkgver" "$pkgname-$pkgver-py3"
}

build() {
  cd "$pkgname-$pkgver-py3"
  ./configure --prefix=/usr
  make

	cd "../$pkgname-$pkgver-py2"
	export PYTHON=/usr/bin/python2
  ./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver-py3"

	make DESTDIR="$pkgdir" install

  cd "../$pkgname-$pkgver-py2/swig"
  make DESTDIR="$pkgdir" install

	install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
	install -D -m644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  libtool --finish "$pkgdir/usr/lib"
  libtool --finish "$pkgdir/usr/lib/gstreamer-1.0"
  libtool --finish "$pkgdir/usr/lib/python2.7/site-packages/pocketsphinx"
  libtool --finish "$pkgdir/usr/lib/python3.5/site-packages/pocketsphinx"
}
