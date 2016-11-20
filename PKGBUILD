# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Zezadas

pkgname=libselinux
pkgver=2.6
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
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014/${pkgname}-${pkgver}.tar.gz"
        "libselinux.tmpfiles.d"
        '0001-libselinux-fix-pointer-handling-in-realpath_not_fina.patch'
        '0002-Revert-libselinux-support-new-python3-functions.patch')
sha256sums=('4ea2dde50665c202253ba5caac7738370ea0337c47b251ba981c60d24e1a118a'
            'afe23890fb2e12e6756e5d81bad3c3da33f38a95d072731c0422fbeb0b1fa1fc'
            '4d7998c5368a6d13f5b730184b4e9ddb28dd42e1576f8daf12676ca468a935b3'
            '82f598ab5c5d21b8b76e887fea43e5d8549f4e9a4047ba3a4cf1a6980ff22eec')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np2 -i '../0001-libselinux-fix-pointer-handling-in-realpath_not_fina.patch'
  patch -Np2 -i '../0002-Revert-libselinux-support-new-python3-functions.patch'
}

build() {
  cd "${pkgname}-${pkgver}"

  # Do not build deprecated rpm_execcon() interface. It is useless on Arch Linux anyway.
  export DISABLE_RPM=y

  make swigify
  make all
  make PYTHON=python2 pywrap
  make PYTHON=python3 pywrap
  make rubywrap
}

package(){
  cd "${pkgname}-${pkgver}"

  export DISABLE_RPM=y

  make DESTDIR="${pkgdir}" USRBINDIR="${pkgdir}"/usr/bin LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install
  make DESTDIR="${pkgdir}" USRBINDIR="${pkgdir}"/usr/bin LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib PYTHON=python2 install-pywrap
  make DESTDIR="${pkgdir}" USRBINDIR="${pkgdir}"/usr/bin LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib PYTHON=python3 install-pywrap
  make DESTDIR="${pkgdir}" USRBINDIR="${pkgdir}"/usr/bin LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install-rubywrap
  python2 -m compileall "${pkgdir}/$(python2 -c 'import site; print(site.getsitepackages()[0])')"
  python3 -m compileall "${pkgdir}/$(python3 -c 'import site; print(site.getsitepackages()[0])')"

  install -Dm 0644 "${srcdir}"/libselinux.tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/libselinux.conf
}
