# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Zezadas
# Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=libselinux
pkgver=2.3
pkgrel=1
pkgdesc="SELinux library and simple utilities"
arch=('i686' 'x86_64' 'armv6h')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
makedepends=('python2' 'python' 'ruby' 'xz' 'pcre' 'swig')
depends=('libsepol')
optdepends=('python2: python2 bindings'
            'python: python bindings'
            'ruby: ruby bindings')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
options=(!emptydirs)
source=("http://userspace.selinuxproject.org/releases/20140506/${pkgname}-${pkgver}.tar.gz"
        "http://pkgs.fedoraproject.org/cgit/libselinux.git/plain/selinuxdefcon.8"
        "http://pkgs.fedoraproject.org/cgit/libselinux.git/plain/selinuxconlist.8"
        "libselinux.tmpfiles.d")
sha256sums=('0b1e0b43ecd84a812713d09564019b08e7c205d89072b5cbcd07b052cd8e77b2'
            'ddfbbc31f2eb107b12d2c949612b997ff7dc86aff78019493b0a3a894ff65e29'
            'df5e0b3258df0953242b19bf1712e0c9bee53badfcab9a91071c915d3edd2098'
            'afe23890fb2e12e6756e5d81bad3c3da33f38a95d072731c0422fbeb0b1fa1fc')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's|pkg-config --cflags ruby|pkg-config --cflags ruby-2.1|' src/Makefile
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
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib PYTHON=python2 install-pywrap
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib PYTHON=python3 install-pywrap
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install-rubywrap

  install -Dm 0644 "${srcdir}"/libselinux.tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/libselinux.conf
  install -dm 0755 "${pkgdir}"/usr/share/man/man8/
  install -m 0644 "${srcdir}"/selinux{defcon,conlist}.8 "${pkgdir}"/usr/share/man/man8/

  # Rename those to match Fedora's names
  cd "${pkgdir}"/usr/sbin/
  mv getdefaultcon selinuxdefcon
  mv getconlist selinuxconlist

  # Those are removed in Fedora
  cd "${pkgdir}"/usr/sbin/
  rm compute_* getfilecon getpidcon policyvers setfilecon togglesebool \
    selinux_check_securetty_context
  rm "${pkgdir}"/usr/share/man/man8/togglesebool.8

  # /usr/lib/libselinux.so fix
  cd "${pkgdir}"/usr/lib
  rm libselinux.so
  ln -s libselinux.so.1 libselinux.so
}
