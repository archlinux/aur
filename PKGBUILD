# Maintainer: Daniel Lima <danielm@nanohub.tk>

pkgname=ccv
pkgver=0.7.r1618
pkgrel=1
pkgdesc='The C-based/Cached/Core Computer Vision Library'
arch=('i686' 'x86_64')
url='http://libccv.org/'
license=('BSD3')
depends=('gsl' 'libpng' 'zlib' 'fftw' 'blas' 'liblinear') 
makedepends=('subversion' 'clang')
optdepends=('ccv-samples: sample datasets')
source=('svn+https://github.com/liuliu/ccv/trunk/doc'
        'svn+https://github.com/liuliu/ccv/trunk/lib'
        'https://raw.githubusercontent.com/liuliu/ccv/stable/COPYING')
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
	cd lib
	echo 0.7.r`svn info | head -7 | tail -1 | cut -d' ' -f2`
}

build() {
	cd lib
	./configure
	make -j`nproc` libccv.a
}

package() {
	mkdir -p $pkgdir/usr/doc
	install -D -m644 COPYING $pkgdir/usr/share/licenses/ccv/COPYING
	cp -r doc $pkgdir/usr/doc/ccv
	cd lib
	install -D -m644 libccv.a $pkgdir/usr/lib/libccv.a
	find -name '*.h' | while read -r f; do
		install -D -m644 $f $pkgdir/usr/include/ccv/$f
	done
}

