# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete at gmail dot com>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

_py="python"
_pkg="lvm"
pkgname="${_py}-${_pkg}"
pkgver=2.02.188
_pkgver="${pkgver}(2) (2021-05-07)"
pkgrel=1
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h)
url="http://sourceware.org/${_pkg}2/"
license=('LGPL2.1')
pkgdesc="Python 3 bindings for LVM"
depends=("${_py}" "${_pkg}2")
makedepends=("${_py}-build"
             "${_py}-installer")
_url="https://ftp.gwdg.de/pub/linux/sources.redhat.com"
source=("${_url}/${_pkg}2/LVM2.${pkgver}.tgz"{,.asc})
sha256sums=(
  '7101e8b0816ad77e4390fed9749a090214ba520061cd083437871e19e50cc9bd'
  'SKIP')
validpgpkeys=(
  '88437EF5C077BD113D3B7224228191C1567E2C17'  # Alasdair G Kergon <agk@redhat.com>
  'D501A478440AE2FD130A1BE8B9112431E509039F') # Marian Csontos <mcsontos@redhat.com>

prepare() {
  local _old_build_cmd="setup.py build" \
        _new_build_cmd="-m build --wheel --no-isolation" \
        _old_install_cmd='setup.py install --skip-build --prefix $(pythonprefix)' \
        _new_install_cmd='-m installer --destdir=$(DESTDIR) dist/*.whl' \
        _makefile="${srcdir}/LVM2.${pkgver}/${_py}/Makefile.in" \
        _version="${srcdir}/LVM2.${pkgver}/VERSION" 

  cd "LVM2.${pkgver}"

  sed -i "s%${_old_build_cmd}%${_new_build_cmd}%g" \
         "${_makefile}"
  sed -i "s%${_old_install_cmd}%${_new_install_cmd}%g" \
         "${_makefile}"
  sed -i "s%${_pkgver}%${pkgver}%g" \
         "${_version}"
}

build() {
  local _configure_opts=(
    '--prefix=/usr'
    '--sysconfdir=/etc'
    '--localstatedir=/var'
    '--sbindir=/usr/bin'
    '--with-udev-prefix=/usr'
    '--with-systemdsystemunitdir=/usr/lib/systemd/system'
    '--with-default-pid-dir=/run'
    '--with-default-dm-run-dir=/run'
    '--with-default-run-dir=/run/lvm'
    '--with-default-locking-dir=/run/lock/lvm'
    '--enable-applib'
    '--enable-python3_bindings')

  cd "LVM2.${pkgver}"

  ./configure "${_configure_opts[@]}"
  make "${_py}"
}

package() {
  local _get_site_packages="import site; print(site.getsitepackages())"
  local _site_packages="$("${_py}" -c "${_get_site_packages}")"

  cd "LVM2.${pkgver}"
 
  make -C "${_py}" DESTDIR="${pkgdir}" \
                   PYTHON_PATH="${_site_packages}" \
       install
}
