# Maintainer: THS <mail@thson.de>
pkgname=aseba-git
pkgver=2.0.0.r35.gca18645f
pkgrel=1
pkgdesc="A set of tools which allow beginners to program robots easily and efficiently."
arch=('x86_64')
url="https://github.com/Mobsya/aseba"
license=('LGPL3')
provides=('aseba')
makedepends=('git' 'ninja' 'cmake')
depends=('boost' 'doxygen' 'qt5-charts' 'qt5-tools' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-graphicaleffects'  'qt5-webengine' 'sdl2' 'qt5-svg' 'avahi' 'zzuf' 'qwt' 'python')
install="aseba-git.install"
source=('enki::git+https://github.com/Mobsya/enki'
	'aseba::git+https://github.com/Mobsya/aseba.git'
	'qtzeroconf::git+https://github.com/Mobsya/QtZeroConf'
	'libusb::git+https://github.com/Mobsya/libusb.git'
	'spdlog::git+https://github.com/gabime/spdlog'
	'expected::git+https://github.com/TartanLlama/expected'
	'aware::git+https://github.com/mobsya/aware'
	'flatbuffers::git+https://github.com/google/flatbuffers'
	'fmt::git+https://github.com/fmtlib/fmt.git'
	'qt-solutions::git+https://github.com/qtproject/qt-solutions.git'
	'park.variant::git+https://github.com/mpark/variant'
	'pugixml::git+https://github.com/zeux/pugixml.git'
	'range-v3::git+https://github.com/ericniebler/range-v3'
	'quazip::git+https://github.com/mobsya/quazip'
	'scratch-gui.tar.gz::https://github.com/Mobsya/scratch-gui/releases/download/v20200505.1/scratch-gui.tar.gz'
        'thymio-blockly.tar.gz::https://github.com/Mobsya/thymio-blockly-standalone/releases/download/v20200506.1/thymio-blockly.tar.gz'
	'vpl3-thymio-suite.tar.gz::https://github.com/Mobsya/ci-data/releases/download/data/vpl3-thymio-suite.tar.gz')

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/aseba"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -rf $srcdir/scratch $srcdir/aseba/scratch
  cp -rf $srcdir/thymio_blockly $srcdir/aseba/thymio_blockly
  cp -rf $srcdir/vpl3-thymio-suite $srcdir/aseba/vpl3-thymio-suite
  cd $srcdir/aseba
  git submodule init
  git config submodule.enki.url $srcdir/enki
  git config submodule."third_party/QtZeroConf".url $srcdir/qtzeroconf
  git config submodule."third_party/libusb/libusb".url $srcdir/libusb
  git config submodule."third_party/spdlog/spdlog".url $srcdir/spdlog
  git config submodule."third_party/expected/expected".url $srcdir/expected
  git config submodule."third_party/aware".url $srcdir/aware
  git config submodule."third_party/flatbuffers".url $srcdir/flatbuffers
  git config submodule."third_party/fmt".url $srcdir/fmt
  git config submodule."third_party/qt-solutions/qt-solutions".url $srcdir/qt-solutions
  git config submodule."third_party/mpark.variant".url $srcdir/park.variant
  git config submodule."third_party/pugixml".url $srcdir/pugixml
  git config submodule."third_party/range-v3".url $srcdir/range-v3
  git config submodule."third_party/quazip".url $srcdir/quazip
  git submodule update
}


build() {
  cd $srcdir/aseba
  mkdir -p build && cd build
  cmake -GNinja -DMOBSYA_WEBAPPS_ROOT_DIR=share/ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF ..
  ninja
}

package() {
    cd $srcdir/aseba/build

    DESTDIR=$pkgdir ninja install

    install -D --target-directory $pkgdir/usr/share/mobsya/Playground/  $srcdir/aseba/aseba/targets/playground/examples/*
}
