# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=libsemanage
pkgver=3.3
pkgrel=2
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/SELinuxProject/selinux'
license=('LGPL2.1')
groups=('selinux')
makedepends=('flex' 'pkgconf' 'python' 'ruby' 'swig')
depends=('libselinux>=3.3' 'audit')
optdepends=('python: python bindings'
            'ruby: ruby bindings')
options=(!emptydirs) # For /var/lib/selinux
install=libsemanage.install
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "semanage.conf")
sha256sums=('84d0ec5afa34bbbb471f602d8c1bf317d12443d07852a34b60741d428d597ce8'
            '5b0e6929428e095b561701ccdfa9c8b0c3d70dad3fc46e667eb46a85b246a4a0')

build() {
  cd "${pkgname}-${pkgver}"

  export CFLAGS="${CFLAGS} -fno-semantic-interposition"
  make swigify
  make all
  make PYTHON=/usr/bin/python3 pywrap
  make RUBY=/usr/bin/ruby rubywrap
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" LIBEXECDIR=/usr/lib SHLIBDIR=/usr/lib install
  make DESTDIR="${pkgdir}" PYTHON=/usr/bin/python3 LIBEXECDIR=/usr/lib SHLIBDIR=/usr/lib install-pywrap
  make DESTDIR="${pkgdir}" RUBY=/usr/bin/ruby LIBEXECDIR=/usr/lib SHLIBDIR=/usr/lib install-rubywrap
  /usr/bin/python3 -m compileall "${pkgdir}/$(/usr/bin/python3 -c 'from distutils.sysconfig import *; print(get_python_lib(plat_specific=1))')"

  install -D -m0644 "${srcdir}/semanage.conf" "${pkgdir}/etc/selinux/semanage.conf"

  # Create /var/lib/selinux for the policy store
  mkdir -p "${pkgdir}/var/lib/selinux"
}
