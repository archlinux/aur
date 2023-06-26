# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete at gmail dot com
# Contributor: Anatol Pomozov <anatol pomozov at gmail dot com>

_py="python2"
_pkg="rpm"
pkgname="${_py}-${_pkg}"
pkgver=4.15.1.3
pkgrel=1
pkgdesc="Python2 bindings for RPM Package Manager"
arch=('x86_64')
url="http://www.${_pkg}.org"
license=('GPL2')
depends=("${_py}")
makedepends=("${_py}" 'nss')
_repo_url="https://github.com/${_pkg}-software-management/${_pkg}"
source=(
  "${_repo_url}/archive/refs/tags/${_pkg}-${pkgver}.tar.gz")
sha256sums=(
  '2c4f4f93bfd833c62bf9fa07398b6f7c707297254e259bdb72b9f7b3ec6a1c88')

_project_dir="${_pkg}-${_pkg}-${pkgver}"

prepare() {
  cd "${_project_dir}"
  
  autoreconf -i
}

build() {
  cd "${_project_dir}"
  local _configure_opts=(
          --prefix=/usr
          --sysconfdir=/etc
          --localstatedir=/var
          --enable-python
          --without-lua )
  
  ./configure "${_configure_opts[@]}" \
              CPPFLAGS="`pkg-config --cflags nss`" \
              PYTHON="${_py}"
  make
}

package() {
  cd "${_project_dir}/python"
  "${_py}" setup.py install --root="${pkgdir}" \
                            --optimize=1
}
