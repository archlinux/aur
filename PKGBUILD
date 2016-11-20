# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=libsemanage
pkgver=2.6
pkgrel=1
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
makedepends=('flex' 'python2' 'python' 'swig')
depends=('ustr-selinux' 'libselinux>=2.6' 'audit')
optdepends=('python2: python2 bindings'
            'python: python bindings')
options=(!emptydirs)
install=libsemanage.install
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014/${pkgname}-${pkgver}.tar.gz"
        "semanage.conf"
        '0001-libsemanage-genhomedircon-only-set-MLS-level-if-MLS-.patch'
        '0002-libsemanage-fix-kernel-pathname-in-semanage_verify_k.patch'
        '0003-libsemanage-semanage_seuser_key_create-copy-name.patch')
sha256sums=('4f81541047290b751f2ffb926fcd381c186f22db18d9fe671b0b4a6a54e8cfce'
            '5b0e6929428e095b561701ccdfa9c8b0c3d70dad3fc46e667eb46a85b246a4a0'
            '035aefa177493f61a3f5744cd82dabef4779a9b6c8954439c802bed0f2f21de2'
            '08a62dcfcb263355d6ec0d83a00ce27442ada70c7471838ca9c54c5648f55d9f'
            '78cc14c549b3ce92e53b27d68beb95b4b3478f0bcd1c6c7c06f19afb6cbddd81')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np2 -i '../0001-libsemanage-genhomedircon-only-set-MLS-level-if-MLS-.patch'
  patch -Np2 -i '../0002-libsemanage-fix-kernel-pathname-in-semanage_verify_k.patch'
  patch -Np2 -i '../0003-libsemanage-semanage_seuser_key_create-copy-name.patch'
}

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
  python2 -m compileall "${pkgdir}/$(python2 -c 'import site; print(site.getsitepackages()[0])')"
  python3 -m compileall "${pkgdir}/$(python3 -c 'import site; print(site.getsitepackages()[0])')"

  install -D -m0644 "${srcdir}/semanage.conf" "${pkgdir}/etc/selinux/semanage.conf"

  # Create /var/lib/selinux for the policy store
  mkdir -p "${pkgdir}/var/lib/selinux"
}
