# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=libsemanage
pkgver=2.7
pkgrel=1
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('LGPL2.1')
groups=('selinux')
makedepends=('flex' 'python2' 'python' 'ruby' 'swig')
depends=('libselinux>=2.7' 'audit')
optdepends=('python2: python2 bindings'
            'python: python bindings'
            'ruby: ruby bindings')
options=(!emptydirs) # For /var/lib/selinux
install=libsemanage.install
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804/${pkgname}-${pkgver}.tar.gz"
        "semanage.conf")
sha256sums=('07e9477714ce6a4557a1fe924ea4cb06501b62d0fa0e3c0dc32a2cf47cb8d476'
            '5b0e6929428e095b561701ccdfa9c8b0c3d70dad3fc46e667eb46a85b246a4a0')

build() {
  cd "${pkgname}-${pkgver}"
  make swigify
  make all
  make PYTHON=/usr/bin/python2 pywrap
  make PYTHON=/usr/bin/python3 pywrap
  make RUBY=/usr/bin/ruby rubywrap
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" \
    LIBEXECDIR="${pkgdir}/usr/lib" \
    SHLIBDIR="${pkgdir}/usr/lib" \
    install
  make DESTDIR="${pkgdir}" PYTHON=python2 \
    LIBEXECDIR="${pkgdir}/usr/lib" \
    SHLIBDIR="${pkgdir}/usr/lib" \
    install-pywrap
  make DESTDIR="${pkgdir}" PYTHON=python3 \
    LIBEXECDIR="${pkgdir}/usr/lib" \
    SHLIBDIR="${pkgdir}/usr/lib" \
    install-pywrap
  make DESTDIR="${pkgdir}" RUBY=/usr/bin/ruby \
    LIBEXECDIR="${pkgdir}/usr/lib" \
    SHLIBDIR="${pkgdir}/usr/lib" \
    install-rubywrap
  /usr/bin/python2 -m compileall "${pkgdir}/$(/usr/bin/python2 -c 'import site; print(site.getsitepackages()[0])')"
  /usr/bin/python3 -m compileall "${pkgdir}/$(/usr/bin/python3 -c 'import site; print(site.getsitepackages()[0])')"

  install -D -m0644 "${srcdir}/semanage.conf" "${pkgdir}/etc/selinux/semanage.conf"

  # Create /var/lib/selinux for the policy store
  mkdir -p "${pkgdir}/var/lib/selinux"
}
