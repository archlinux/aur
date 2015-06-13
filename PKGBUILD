# Maintainer: Marco Pompili marcs.pompili@gmail.com
# Contributor: Giorgio Gilestro crocowhile@gmail.com

pkgname=sphinxbase
pkgver=0.8
pkgrel=4
pkgdesc='Common library for sphinx speech recognition.'
url='http://cmusphinx.sourceforge.net/'
arch=('i686' 'x86_64')
license=('BSD')
options=('!libtool')
makedepends=('bison')
depends=('python2' 'cython2' 'lapack' 'alsa-lib' 'libpulse' 'libsamplerate')
source=("http://downloads.sourceforge.net/cmusphinx/$pkgname-$pkgver.tar.gz")
md5sums=('7335d233f7ad4ecc4b508aec7b5dc101')
_pythondir="$pkgdir/usr/lib/python2.7/site-packages"

build() {
    cd $pkgname-$pkgver

    find -type f -exec sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' {} \;
    find -type f -exec sed -i 's_/usr/bin/python_/usr/bin/python2_' {} \;
    find -type f -exec sed -i 's_python -c_python2 -c_' {} \;
    find -type f -exec sed -i 's_python-config_python2-config_' {} \;
    find -type f -exec sed -i 's_cython_cython2_' {} \;

    export PYTHON=/usr/bin/python2
    export PYTHON_CONFIG=/usr/bin/python2-config

     ./configure --prefix=/usr --with-python=/usr/bin/python2

    make
}

package() {
    cd $pkgname-$pkgver

    install -d $_pythondir
    PYTHONPATH=$_pythondir make DESTDIR="$pkgdir" install

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"
} 
