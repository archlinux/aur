# Copy from https://gitlab.archlinux.org/archlinux/packaging/packages/python-xxhash/-/blob/3.2.0-2/PKGBUILD
# Maintainer: miryo <miryo@vcup.moe>

# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pyname=xxhash
pkgname="python-${_pyname}-git"
pkgver=v3.4.1.r0.g02791fe
pkgrel=1
pkgdesc='Python binding for xxHash'
arch=('x86_64')
url="https://github.com/ifduyue/${pkgname}"
depends=('python' 'xxhash')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
license=('BSD')
conflicts=('python-xxhash')
provides=('python-xxhash')
source=("${pkgname}::git+https://github.com/ifduyue/python-xxhash.git#tag=v3.4.1")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # link to xxHash
  export XXHASH_LINK_SO=1
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"
  # name clash is preventing import, rename source temporarily
  # don't forget to rename back after running tests
  mv xxhash _noxxhash
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" python -m unittest discover -vs tests
  mv _noxxhash xxhash
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
