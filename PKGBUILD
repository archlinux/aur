# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

_pkg="selinux"
_lib="lib${_pkg}"
pkgname="${_lib}-python2"
pkgver=3.4
pkgrel=1
pkgdesc="SELinux library and simple utilities (python 2.x bindings)"
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'armv7h' 'aarch64')
url="http://userspace.${_pkg}project.org"
license=('custom')
groups=("${_pkg}")
makedepends=(
  'python'
  'python2'
  'ruby'
  'xz'
  'swig')
depends=('libsepol>=3.0' 'pcre')
optdepends=(
  'python: python bindings'
  'python2: python 2.X bindings'
  'ruby: ruby bindings')
_repo_url="https://github.com/SELinuxProject/${_pkg}"
source=(
  "${_repo_url}/releases/download/${pkgver}/${_lib}-${pkgver}.tar.gz"
  "${_lib}.tmpfiles.d")
sha256sums=(
  '77c294a927e6795c2e98f74b5c3adde9c8839690e9255b767c5fca6acff9b779'
  'afe23890fb2e12e6756e5d81bad3c3da33f38a95d072731c0422fbeb0b1fa1fc')

build() {
  cd "${_lib}-${pkgver}"

  # Do not build deprecated rpm_execcon() interface. It is useless on Arch Linux anyway.
  export DISABLE_RPM=y

  make swigify
  make all
  make PYTHON=/usr/bin/python2 pywrap
  make PYTHON=/usr/bin/python pywrap
  make RUBY=/usr/bin/ruby rubywrap
}

package() {
  cd "${_lib}-${pkgver}"

  export DISABLE_RPM=y

  make DESTDIR="${pkgdir}" \
       PYTHON=/usr/bin/python2 \
       SBINDIR=/usr/bin \
       SHLIBDIR=/usr/lib \
       install-pywrap
  /usr/bin/python2 -m compileall \
      "${pkgdir}/$(/usr/bin/python2 -c 'from distutils.sysconfig import *; print(get_python_lib(plat_specific=1))')"
  /usr/bin/python2 -O -m compileall \
      "${pkgdir}/$(/usr/bin/python2 -c 'from distutils.sysconfig import *; print(get_python_lib(plat_specific=1))')"
}
