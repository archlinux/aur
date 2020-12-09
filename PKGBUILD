# Maintainer: David Birks <david@tellus.space>
# Contributor: Dominik Heidler <dheidler@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor:	Jonatan Sastre <jsastreh [ at ] hotmail.com>

pkgname=gnuradio-git
_gitname=gnuradio
pkgver=v3.8.0.0.796.ga54c735fa
pkgrel=1
pkgdesc="General purpose DSP and SDR toolkit, with drivers for usrp and fcd."
arch=('i686' 'x86_64')
url="https://github.com/gnuradio/gnuradio"
license=('GPL')
depends=('fftw' 'python' 'python-numpy' 'python-mako' 'python-click' 'python-click-plugins' 'python-pyqt5' 'python-gobject' 'cppunit' 'gsl' 'blas' 'guile' 'boost-libs>=1.54' 'libusb' 'portaudio' 'libuhd' 'zeromq' 'libvolk' 'log4cpp')
makedepends=('git' 'boost' 'cmake' 'python-cairo' 'python-yaml' 'python-cheetah3' 'glu' 'pybind11' 'qwt' 'python-sphinx')
optdepends=('python-lxml: Some GRC modules use lxml optionally for improved performance')
source=("git+https://github.com/gnuradio/gnuradio.git")
md5sums=('SKIP')
conflicts=('gnuradio' 'gnuradio-companion')
provides=('gnuradio' 'gnuradio-companion')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "$srcdir/$_gitname"

    sed -i -e "s|GR_PKG_LIBEXEC_DIR|GR_RUNTIME_DIR|" grc/scripts/freedesktop/CMakeLists.txt
    msg "Starting build."
    mkdir -p build
    cd build
    cmake \
        -DENABLE_GRC=ON \
        -DENABLE_GR_QTGUI=ON \
        -DENABLE_INTERNAL_VOLK=OFF \
        -DENABLE_GR_CTRLPORT=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGR_PYTHON_DIR=/usr/lib/python3.9/site-packages \
        -DQWT_LIBRARIES=/usr/lib/libqwt.so -Wno-dev ../
    make
}

check() {
    cd "$srcdir/$_gitname/build"
    #make test
}

package() {
    cd "$srcdir/$_gitname/grc/scripts/freedesktop"
    install -Dm644 gnuradio-grc.desktop "$pkgdir/usr/share/applications/$pkgbase.desktop"
    cd "$srcdir/$_gitname/build"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/" -name '*.pyc' -delete
    find "$pkgdir/" -name '*.pyo' -delete
}
