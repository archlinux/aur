# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Zezadas

pkgname=libselinux
pkgver=2.4
pkgrel=1
pkgdesc="SELinux library and simple utilities"
arch=('i686' 'x86_64' 'armv6h')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
makedepends=('python2' 'python' 'ruby' 'xz' 'swig')
depends=('libsepol' 'pcre')
optdepends=('python2: python2 bindings'
            'python: python bindings'
            'ruby: ruby bindings')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
options=(!emptydirs)
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20150202/${pkgname}-${pkgver}.tar.gz"
        "libselinux.tmpfiles.d")
sha256sums=('46043091f4c5ba4f43e8d3715f30d665a2d571c9126c1f03945c9ea4ed380f7b'
            'afe23890fb2e12e6756e5d81bad3c3da33f38a95d072731c0422fbeb0b1fa1fc')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's|pkg-config --cflags ruby|pkg-config --cflags ruby-$(RUBYLIBVER)|' src/Makefile
  sed -i 's|site_ruby|vendor_ruby|' src/Makefile
}

build() {
  cd "${pkgname}-${pkgver}"
  make swigify
  make all
  make PYTHON=python2 pywrap
  make PYTHON=python3 pywrap
  make rubywrap
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" USRBINDIR="${pkgdir}"/usr/bin LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install
  make DESTDIR="${pkgdir}" USRBINDIR="${pkgdir}"/usr/bin LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib PYTHON=python2 install-pywrap
  make DESTDIR="${pkgdir}" USRBINDIR="${pkgdir}"/usr/bin LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib PYTHON=python3 install-pywrap
  make DESTDIR="${pkgdir}" USRBINDIR="${pkgdir}"/usr/bin LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install-rubywrap

  install -Dm 0644 "${srcdir}"/libselinux.tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/libselinux.conf
}
