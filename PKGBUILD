# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=qspectrumanalyzer
pkgver=2.2.0
pkgrel=2
pkgdesc="Spectrum analyzer for multiple SDR platforms."
arch=('any')
url="https://github.com/xmikos/qspectrumanalyzer"
license=('GPL3')
depends=('python-qt.py' 'python-pyqt5' 'python-pyqtgraph' 'soapy_power>=1.5.0' 'python-setuptools')
optdepends=('rtl_power_fftw: Alternative RTL-SDR backend using FFTW library. Much faster than rtl_power.'
	    'rtl-sdr: original rtl_power backend. Slightly broken, use rtl-sdr-keenerd-git instead.'
	    'rx_tools: rx_power backend. Universal SoapySDR based backend, but seems slow and buggy.'
	    'hackrf: hackrf_sweep backend. Wideband spectrum monitoring with sweep rate of 8 GHz/s.')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        setenv.patch)
sha256sums=('d50e13fa4951a67ed4f56362fb74daff9faeda88d7fc3f9d98cffb8d63c6311d'
            '9205115603abf8c555d4325246f4b57207002cc7037f96a6e9a3a2cfa9d18037')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Patch start script to enforce usage of PyQt5
  cd "$pkgdir"
  patch -p1 < "$srcdir"/setenv.patch
}
