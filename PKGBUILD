pkgname=stack-client
pkgver=5.3.1_20240731
pkgrel=1
pkgdesc="The STACK Client provides file sync to desktop clients."
arch=('x86_64')
url='https://www.transip.nl/stack/'
license=(GPL2)
depends=(
  'hicolor-icon-theme'
  'karchive'
  'kdsingleapplication'
  'libcloudproviders'
  'libp11'
  'libre-graph-api'
  'qt6-5compat'
  'qt6-svg'
  'qt6-declarative'
  'qt6-multimedia'
  'qt6-webengine'
  'qt6-websockets'
  'qtkeychain-qt6'
  'xdg-utils'
  'zlib'
)
optdepends=('python-nautilus: integration with Nautilus' 'nemo-python: integration with Nemo')
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'frameworkintegration'
  'git'
  'ninja'
  'qt6-tools'
)
conflicts=('stack-client-bin')
source=("http://filehosting-client.transip.nl/packages/stack/v${pkgver//_/-}/source/stack-v${pkgver//_/-}.tar.gz"
        "APPLICATION_NAME.patch")
sha256sums=('ac69699edb1618ef094e4b642fe72c87bf15e65026029486bef50826a746e19c'
            '977dbb37deac79bbd65c822887c92a44fde66a5fb65d73d27b326099996309bd')
 
prepare() {
  cd client
  patch -p1 < ${srcdir}/APPLICATION_NAME.patch
}
 
build() {
  cmake \
	-S client \
	-B build \
	-G Ninja \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DLINUX_PACKAGE_SHORTNAME=stack \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/${pkgname} \
        -DAPPLICATION_EXECUTABLE=stack-client \
	-DPLUGINDIR='lib/qt6/plugins' \
	-DBUILD_UPDATER=OFF \
        -DWITH_CRASHREPORTER=OFF \
	-DUNIT_TESTING=OFF \
	-DBUILD_TESTING=OFF \
	-Wno-dev
  cmake --build build
}
 
package() {
  DESTDIR="${pkgdir}" cmake --install build
}
