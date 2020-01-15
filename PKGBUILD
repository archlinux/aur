# Maintainer: Wil Thomason <wbthomason@cs.cornell.edu>
# Former maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=ompl
pkgver=1.4.2
pkgrel=1
pkgdesc="The Open Motion Planning Library (OMPL) consists of many state-of-the-art sampling-based motion planning algorithms"
arch=('i686' 'x86_64')
url="http://ompl.kavrakilab.org/"
license=('BSD')
# The restrictions on boost-libs and boost here are just until OMPL 1.50.0 is released, as it fixes
# compatibility with boost 1.71.0 via commit 962961f
depends=('boost-libs<=1.69.0' 'python' 'python-matplotlib')
makedepends=('boost<=1.69.0' 'cmake')
optdepends=('py++: Python binding'
            'ode: Plan using the Open Dynamics Engine'
            'eigen: For an informed sampling technique')
source=(https://github.com/ompl/ompl/archive/${pkgver}.tar.gz)
sha512sums=(67cd99ee80b2c74a35eb54ce1ed4faf19fafc58843d9a9eaf29d28ef0707623517ccf9571af4af094455309950ea8f38d56f5c04d963f5e7a2410a7638e6e5fa)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  rm -rf build
  mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DPYTHON_EXEC=/usr/bin/python2 \
    -DCMAKE_CXX_FLAGS=-D_POSIX_VERSION \
    -DOMPL_REGISTRATION=Off ..
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd build
  make DESTDIR=${pkgdir} install
}
