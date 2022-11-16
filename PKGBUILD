pkgname=stack-client
pkgver=2.11.1
pkgrel=1
pkgdesc="The STACK Client provides file sync to desktop clients."
arch=('x86_64')
url='https://www.transip.nl/stack/'
license=(GPL2)
depends=('qtkeychain' 'qt5-webengine' 'hicolor-icon-theme' 'xdg-utils' 'libcloudproviders')
optdepends=('python-nautilus: integration with Nautilus' 'nemo-python: integration with Nemo')
makedepends=('cmake' 'qt5-tools' 'extra-cmake-modules' 'frameworkintegration')
conflicts=('stack-client-bin')
source=("http://filehosting-client.transip.nl/packages/stack/v${pkgver}-20220906/source/stack-v${pkgver}-20220906.tar.gz"
        "APPLICATION_NAME.patch")
sha256sums=('c3107d11f3b3bc9680e11f56cb9b1a4f691f93d8fe9990bfebd1a2556e21df82'
            '977dbb37deac79bbd65c822887c92a44fde66a5fb65d73d27b326099996309bd')
 
prepare() {
  cd client
  patch -p1 < ${srcdir}/APPLICATION_NAME.patch
}
 
build() {
  mkdir -p stack-client-build
  cd stack-client-build
 
  cmake ../client \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DLINUX_PACKAGE_SHORTNAME=stack \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/${pkgname} \
        -DAPPLICATION_EXECUTABLE=stack-client \
        -DMIRALL_VERSION_SUFFIX=
  make
}
 
package() {
  cd ${srcdir}/stack-client-build
  make DESTDIR=${pkgdir} install
}
