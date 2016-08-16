# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Zezadas

pkgname=libselinux
pkgver=2.5
pkgrel=2
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
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223/${pkgname}-${pkgver}.tar.gz"
        "libselinux.tmpfiles.d"
        "0001-libselinux-only-mount-proc-if-necessary.patch"
        "0002-Avoid-mounting-proc-outside-of-selinux_init_load_pol.patch")
sha256sums=('94c9e97706280bedcc288f784f67f2b9d3d6136c192b2c9f812115edba58514f'
            'afe23890fb2e12e6756e5d81bad3c3da33f38a95d072731c0422fbeb0b1fa1fc'
            'da3ed20d45b7656c25411bcc31109a78b64265978839bbc06b25151a7231611c'
            '1d20ae0d6fb39dd93258388297206980cb530b04511c4b16db247e05c84804a8')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's|pkg-config --cflags ruby|pkg-config --cflags ruby-$(RUBYLIBVER)|' src/Makefile
  sed -i 's|site_ruby|vendor_ruby|' src/Makefile

  # Backport commits to fix issues when SELinux is disabled
  # https://github.com/systemd/systemd/issues/3962#issuecomment-239827399
  patch -Np2 -i "../0001-libselinux-only-mount-proc-if-necessary.patch"
  patch -Np2 -i "../0002-Avoid-mounting-proc-outside-of-selinux_init_load_pol.patch"
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
