# Maintainer: Johannes Pohl <johannes.pohl90@gmail.com>
pkgname=urh
license=('GPL3')
pkgver=2.2.1
pkgrel=1
pkgdesc="Universal Radio Hacker: investigate wireless protocols like a boss"
arch=('i686' 'x86_64')
url="https://github.com/jopohl/urh"
depends=('python>=3.4' 'python-pyqt5' 'python-numpy' 'python-psutil' 'python-pyzmq')
makedepends=('gcc' 'python-setuptools' 'cython')
optdepends=(
  'airspy: for native airspy backend'
  'cython: for recompiling native backends right from inside URH'
  'hackrf: for native hackrf backend'
  'libuhd: for native USRP backend'
  'rtl-sdr: for native RTL-SDR backend'
  'rfcat-hg: for rfcat plugin'
  'gnuradio: for USRP gnuradio backend'
  'gnuradio-osmosdr: for more gnuradio device backends (HackRF, FunCubeDongle, RTL-SDR)'
  'python-pyaudio: for soundcard support (use soundcard as SDR)'
)

source=($pkgname-$pkgver.tar.gz::https://github.com/jopohl/urh/tarball/v$pkgver)
md5sums=('66208507b7b170a8e197056cecc6a8d9')
sha256sums=('cdc180171c9b2f6808c0ce77b481e562fdb3e6a72de684be3dd6b450f560b3de')

build() {
  cd "$srcdir"
  mv jopohl* "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  msg 'Building C++ extensions...'
  python setup.py build_ext
  msg 'successfully built C++ extensions'
}


package() {
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  if [ -f urh.desktop ]; then
    install -Dm644 urh.desktop "${pkgdir}/usr/share/applications/urh.desktop"
  else
    install -Dm644 ./data/urh.desktop "${pkgdir}/usr/share/applications/urh.desktop"
  fi
  install -Dm644 ./data/icons/appicon.png "${pkgdir}/usr/share/pixmaps/urh.png"
  install -Dm644 README.md "${pkgdir}/usr/share/docs/${pkgname}/README.md"
}

