# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Zezadas

pkgname=libselinux
pkgver=2.3
pkgrel=3
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
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20140506/${pkgname}-${pkgver}.tar.gz"
        "libselinux.tmpfiles.d")
sha256sums=('0b1e0b43ecd84a812713d09564019b08e7c205d89072b5cbcd07b052cd8e77b2'
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

  # /usr/lib/libselinux.so is installed as a symlink to ../../lib/libselinux.so.1 instead of directly libselinux.so.1
  # This issue will be fixed in libselinux 2.4
  # (patch: https://github.com/SELinuxProject/selinux/commit/71393a181d63c9baae5fe8dcaeb9411d1f253998)
  # For now, fix the symlink by hand.
  cd "${pkgdir}"/usr/lib
  rm libselinux.so
  ln -s libselinux.so.1 libselinux.so
}
