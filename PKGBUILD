# Maintainer MatricalDefunkt <dev <at> matricaldefunkt <dot> me>
# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Zezadas
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=libselinux
pkgver=3.10
pkgrel=1
pkgdesc="SELinux library and simple utilities"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url='https://github.com/SELinuxProject/selinux'
license=('libselinux-1.0')
groups=('selinux')
makedepends=('pkgconf' 'python' 'python-build' 'python-pip' 'python-setuptools' 'ruby' 'xz' 'swig')
depends=('libsepol>=3.10' 'pcre2')
optdepends=('python: python bindings'
            'ruby: ruby bindings')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
validpgpkeys=(
  '63191CE94183098689CAB8DB7EF137EC935B0EAF'  # Jason Zaman <perfinion@gentoo.org>
  '68D21823342A13683AEB3E4EFB4C685B5DC1C13E'  # Petr Lautrbach <lautrbach@redhat.com>
)
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc}
        "libselinux.tmpfiles.d")
sha256sums=('1ef216c5b56fb7e0a51cd2909787a175a17ee391e0467894807873539ebe766b'
            'SKIP'
            'afe23890fb2e12e6756e5d81bad3c3da33f38a95d072731c0422fbeb0b1fa1fc')

prepare() {
  cd "${pkgname}-${pkgver}"

  # SWIG 4.5.0 dropped the PyString_* Python 2 compat macros from its
  # runtime header, breaking the Python bindings build. Fixed upstream
  # after the 3.11 tag:
  # https://github.com/SELinuxProject/selinux/commit/fb518ff492cd6a286f35b415cbd7fd0f6e3faedb
  # TODO: Remove this patch when updating to 3.12 or later.
  sed -i 's/PyString_FromString/PyUnicode_FromString/g' src/selinuxswig_python.i
}

build() {
  cd "${pkgname}-${pkgver}"

  # Do not build deprecated rpm_execcon() interface. It is useless on Arch Linux anyway.
  export DISABLE_RPM=y

  # Use pcre2 explicitely even though it is the default since
  # https://github.com/SELinuxProject/selinux/commit/e0da140d82c0ebebf1060ce87d0f11276c7fc59a
  export USE_PCRE2=y

  export CFLAGS="${CFLAGS} -fno-semantic-interposition"
  make swigify
  make all
  make PYTHON=/usr/bin/python3 pywrap
  make RUBY=/usr/bin/ruby rubywrap
}

package() {
  provides+=(
    libselinux.so
  )

  cd "${pkgname}-${pkgver}"

  export DISABLE_RPM=y

  make DESTDIR="${pkgdir}" SBINDIR=/usr/bin SHLIBDIR=/usr/lib install
  make DESTDIR="${pkgdir}" PYTHON=/usr/bin/python3 SBINDIR=/usr/bin SHLIBDIR=/usr/lib install-pywrap
  make DESTDIR="${pkgdir}" RUBY=/usr/bin/ruby SBINDIR=/usr/bin SHLIBDIR=/usr/lib install-rubywrap
  /usr/bin/python3 -m compileall "${pkgdir}/$(/usr/bin/python3 -c 'from distutils.sysconfig import *; print(get_python_lib(plat_specific=1))')"

  install -Dm 0644 "${srcdir}"/libselinux.tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/libselinux.conf

  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
