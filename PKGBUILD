# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=libsemanage
pkgver=3.5
pkgrel=1
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/SELinuxProject/selinux'
license=('LGPL2.1')
groups=('selinux')
makedepends=('flex' 'pkgconf' 'python' 'ruby' 'swig')
depends=('libselinux>=3.5' 'audit')
optdepends=('python: python bindings'
            'ruby: ruby bindings')
options=(!emptydirs) # For /var/lib/selinux
install=libsemanage.install
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
validpgpkeys=(
  '63191CE94183098689CAB8DB7EF137EC935B0EAF'  # Jason Zaman <perfinion@gentoo.org>
  'E853C1848B0185CF42864DF363A8AD4B982C4373'  # Petr Lautrbach <plautrba@redhat.com>
)
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc}
        "semanage.conf")
sha256sums=('f53534e50247538280ed0d76c6ce81d8fb3939bd64cadb89da10dba42e40dd9c'
            'SKIP'
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
