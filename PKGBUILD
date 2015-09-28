# Maintainer: Marco Pompili < marcs (dot) pompili (at) gmail (dot) com >
# Contributor: Giorgio Gilestro crocowhile@gmail.com

pkgname=sphinxbase
pkgver=5prealpha
pkgrel=1
pkgdesc='Common library for sphinx speech recognition.'
url='http://cmusphinx.sourceforge.net/'
arch=('i686' 'x86_64')
license=('BSD-2')
options=('!libtool')
makedepends=('bison')
depends=('python2' 'cython2' 'swig' 'lapack' 'alsa-lib' 'libpulse' 'libsamplerate')
source=("http://downloads.sourceforge.net/project/cmusphinx/${pkgname}/${pkgver}/$pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/cmusphinx/sphinxbase/master/LICENSE")
md5sums=('12acdeda1d597631947e5531463431f1'
         '469fd92fa8cd1d4ca7ee0fe7435af689')
_pythondir="$pkgdir/usr/lib/python2.7/site-packages"

build() {
    cd $pkgname-$pkgver

    msg2 "Reconfiguring project for Automake v1.15"
    autoreconf -ivf > /dev/null

    msg2 "Setting python2 as the python installtion for ${pkgname}"

    find -type f -exec sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' {} \;
    find -type f -exec sed -i 's_/usr/bin/python_/usr/bin/python2_' {} \;
    find -type f -exec sed -i 's_python -c_python2 -c_' {} \;
    find -type f -exec sed -i 's_python-config_python2-config_' {} \;
    find -type f -exec sed -i 's_cython_cython2_' {} \;

    export PYTHON=/usr/bin/python2
    export PYTHON_CONFIG=/usr/bin/python2-config

    msg2 "Building..."

     ./configure --prefix=/usr

    make
}

package() {
    cd $pkgname-$pkgver

    install -d $_pythondir
    PYTHONPATH=$_pythondir make DESTDIR="$pkgdir" install

    install -d "$pkgdir/usr/share/licenses/$pkgname"

    install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    libtool --finish "$pkgdir/usr/lib"
    libtool --finish "$pkgdir/usr/lib/python2.7/site-packages/sphinxbase"
}
