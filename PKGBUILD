# Maintainer: Ivy Huang <imyxh@imyxh.net>

_name="digital_rf"
pkgbase="$_name"-git
pkgname="$pkgbase"
pkgver=2.6.3.r173.ge150e09
pkgrel=1
pkgdesc="Read, write, and interact with data in the Digital RF and Digital Metadata formats"
url="https://github.com/MITHaystack/digital_rf"
license=('BSD')
arch=('x86_64')
depends=('hdf5' 'python-h5py' 'python-numpy' 'python-packaging'
         'python-dateutil' 'python-pytz' 'python-six')
makedepends=('git' 'cmake' 'python-mako' 'python-pkgconfig' 'python-setuptools')
optdepends=('matlab: for the MATLAB interface'
            'gnuradio: for gr_digital_rf'
            'gnuradio-osmosdr: for thorosmo'
            'gnuradio-iio: for thorpluto'
            'gnuradio-uhd: for thor'
            'python-matplotlib: for tools'
            'python-pandas: for digital_metadata'
            'python-sounddevice: for tools'
            'python-scipy: for tools'
            'python-uhd: for uhdtorf'
            'python-watchdog: for mirror, ringbuffer, watchdog')
checkdepends=('python-pytest')
source=('git+https://github.com/MITHaystack/digital_rf.git')
sha512sums=('SKIP')

# cmake should detect the existence of MATLAB at build-time
#_cmakeopts=('-DENABLE_MATLAB=OFF')

pkgver() {
    cd "$srcdir/$_name"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    # cmake -B build -S "$_name" "${_cmakeopts[@]}"
    cmake -B build -S "$_name"
    cd build
    make
}

check() {
    cd build
    make test
    # pytest not working yet (can't find module on first install)
    #pytest
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}

