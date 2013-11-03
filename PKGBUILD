# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=libselinux
pkgver=2.2
pkgrel=1
pkgdesc="SELinux library and simple utilities"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
depends=('libsepol>=2.2' 'python2' 'python' 'swig' 'ruby')
options=(!emptydirs)
source=("http://userspace.selinuxproject.org/releases/20131030/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e9dc64216543a7283d786f623ac28e8867f8794138e7deba474a3aa8d02dce33')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's|pkg-config --cflags ruby|pkg-config --cflags ruby-2.0|' src/Makefile
  sed -i 's|site_ruby|vendor_ruby|' src/Makefile
}

build() {
  cd ${pkgname}-${pkgver}
  make swigify
  make all
  make PYTHON=python2 pywrap
  make PYTHON=python3 pywrap
  make rubywrap
}

package(){
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib PYTHON=python2 install-pywrap
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib PYTHON=python3 install-pywrap
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install-rubywrap

  # /usr/lib/libselinux.so fix
  cd "${pkgdir}"/usr/lib
  rm libselinux.so
  ln -s libselinux.so.1 libselinux.so
}
