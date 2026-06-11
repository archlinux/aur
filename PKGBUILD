# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
_pkgname=gdspy
pkgname=python-${_pkgname}
pkgver=1.6.13
pkgrel=2
pkgdesc="Gdspy is a Python module for creating GDSII stream files, usually CAD layouts."
url="https://github.com/heitzmann/gdspy"
arch=('x86_64' 'i686')
license=("BSL-1.0")
depends=(
  'python'
  'python-numpy'
  'glibc'
  'libstdc++'
  'libgcc'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
  'python-pytest'
)
install="${pkgname}.install"
conflicts=("${pkgname}-git")
source=("${_pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('69d819b63fc5eb5059c6e0aae59e0234a217196528887583a85e37e3e4fe9baf38c01aa9f7458b27e63f2bed93c0a29919f07b26801cd571b4474f75d9e8d80d')


build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}"

  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install license
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}

# vim: set ts=4 sw=4 et:
