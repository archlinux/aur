# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=libsemanage
pkgver=2.5
pkgrel=1
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
makedepends=('flex' 'python2' 'python' 'swig')
depends=('ustr-selinux' 'libselinux>=2.5' 'audit')
optdepends=('python2: python2 bindings'
            'python: python bindings')
options=(!emptydirs)
install=libsemanage.install
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223/${pkgname}-${pkgver}.tar.gz"
        "semanage.conf")
sha256sums=('46e2f36254369b6e91d1eea0460c262b139361b055a3a67d3ceea2d8ef72e006'
            '5b0e6929428e095b561701ccdfa9c8b0c3d70dad3fc46e667eb46a85b246a4a0')

build() {
  cd "${pkgname}-${pkgver}"
  make swigify
  make all
  make PYTHON=python2 pywrap
  make PYTHON=python3 pywrap
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" LIBEXECDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" install
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" LIBEXECDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" PYTHON=python2 install-pywrap
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" LIBEXECDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" PYTHON=python3 install-pywrap

  install -D -m0644 "${srcdir}/semanage.conf" "${pkgdir}/etc/selinux/semanage.conf"

  # Create /var/lib/selinux for the policy store
  mkdir -p "${pkgdir}/var/lib/selinux"
}
