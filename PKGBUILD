# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=createrepo_c
pkgver=0.10.0
pkgrel=1
pkgdesc="A C implementation of createrepo, a tool to create yum repositories"
arch=('i686' 'x86_64')
license=('GPL')
url='https://fedorahosted.org/createrepo_c/'
depends=('rpm-org' 'libxml2' 'curl' 'glib2' 'python2')
makedepends=('cmake' 'doxygen' 'python2-sphinx' 'sqlite' 'zlib')
source=("https://github.com/rpm-software-management/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('510d1006294c2cfc7e6e01a5ffa243ac8b8e8cdb045efadfebb5c03f0251adaa')

prepare() {
  cd ${pkgname}-${pkgver}
  msg2 "Fixing doc build: requires sphinx-build2 from python2-sphinx"
  sed -i 's|\(sphinx-build\)|\12|' doc/python/CMakeLists.txt
  msg2 "Fixing lib install: /usr/lib64 directory is not used in Arch"
  sed -i 's|\${LIB_SUFFIX}||' src/CMakeLists.txt
}

build() {
  cd ${pkgname}-${pkgver}

  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DLIB_INSTALL_DIR:PATH=/usr/lib \
    .

  make
  make doc
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

# vi:set ts=2 sw=2 et:
