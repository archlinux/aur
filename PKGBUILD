# Maintainer: Marco Pompili < marcs DOT pompili AT gmail.com>
# Contributor: Ben Duffield <bavardage AT archlinux.us>

pkgname=pocketsphinx
pkgver=0.8
pkgrel=5
pkgdesc='Lightweight speech recognition engine, specifically tuned for handheld and mobile devices, though it works equally well on the desktop.'
arch=('i686' 'x86_64')
url='http://cmusphinx.sourceforge.net'
depends=('sphinxbase>=0.8' 'python2' 'gstreamer0.10-base' 'libpulse' 'libsamplerate')
license=('custom') 
source=("http://downloads.sourceforge.net/cmusphinx/$pkgname-$pkgver.tar.gz" "cython2_makefile.patch")
md5sums=('9f6fb6277d57fb33d2c49d4184587d26'
         '7524229c5d82c49a5c4afabd7f891a65')
options=('!libtool')

build() {
	cd $pkgname-$pkgver

	find -type f -exec sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' {} \;
	find -type f -exec sed -i 's_/usr/bin/python_/usr/bin/python2_' {} \;
	find -type f -exec sed -i 's_python -c_python2 -c_' {} \;
	find -type f -exec sed -i 's_python-config_python2-config_' {} \;
	find -type f -exec sed -i 's_cython_cython2_' {} \;

	#sed -i '/cython/s/$(CPPFLAGS) -I$(sphinxbase)\/python/$(SphinxBase_CFLAGS)/' python/Makefile.am

	patch -Np1 -i ${srcdir}/cython2_makefile.patch

	export PYTHON=/usr/bin/python2
	export PYTHON_CONFIG=/usr/bin/python2-config

	./autogen.sh \
		--prefix=/usr \
		--with-sphinxbase=auto \
		--with-python=/usr/bin/python2
	make 
}

package() {
	cd $pkgname-$pkgver

	make DESTDIR="$pkgdir" install
	
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname"
}
