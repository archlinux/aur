# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=createrepo_c
pkgver=0.9.1
pkgrel=1
pkgdesc="A C implementation of createrepo, a tool to create yum repositories"
arch=('i686' 'x86_64')
license=('GPL')
url='https://fedorahosted.org/createrepo_c/'
depends=('rpm-org' 'libxml2' 'curl' 'glib2')
makedepends=('cmake' 'doxygen' 'python2-sphinx' 'sqlite' 'zlib')
source=("https://github.com/rpm-software-management/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('adc2e8243153e3e7f39bc82f1ec26f93caa9770c25ee57b5ae2b92cb24732014')

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
