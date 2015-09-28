# Maintainer: Marco Pompili <marcs DOT pompili AT gmail DOT com>
# Contributor: Ben Duffield <bavardage AT archlinux.us>

pkgname=pocketsphinx
pkgver=5prealpha
pkgrel=1
pkgdesc='Lightweight speech recognition engine, specifically tuned for handheld and mobile devices, though it works equally well on the desktop.'
arch=('i686' 'x86_64')
url='http://cmusphinx.sourceforge.net'
depends=('sphinxbase=5prealpha' 'python2' 'gstreamer0.10-base' 'libpulse' 'libsamplerate')
license=('BSD-2')
source=("http://downloads.sourceforge.net/cmusphinx/$pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/cmusphinx/pocketsphinx/master/LICENSE")
md5sums=('e8402e90570935b26745d313c133b376'
         '93bfe6b712fe592d844ef581e1e53d47')
options=('!libtool')

build() {
	cd $pkgname-$pkgver

	find -type f -exec sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' {} \;
	find -type f -exec sed -i 's_/usr/bin/python_/usr/bin/python2_' {} \;
	find -type f -exec sed -i 's_python -c_python2 -c_' {} \;
	find -type f -exec sed -i 's_python-config_python2-config_' {} \;
	find -type f -exec sed -i 's_cython_cython2_' {} \;

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

	install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
	install -D -m644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    libtool --finish "$pkgdir/usr/lib"
    libtool --finish "$pkgdir/usr/lib/gstreamer-1.0"
    libtool --finish "$pkgdir/usr/lib/python2.7/site-packages/pocketsphinx"
}
