# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="guppy3"
pkgname="python-${_pypiname}"
pkgver=3.1.7
pkgrel=1
pkgdesc="Programming environment providing object and heap memory sizing, profiling and analysis"
arch=(
  'aarch64'
  'armv7h'
  'powerpc64le'
  'x86_64'
)
url="https://zhuyifei1999.github.io/guppy3/"
_url="https://github.com/zhuyifei1999/${_pypiname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'python>=3.10'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'

  'python-setuptools'
)
# checkdepends=(
#   'python-pytest'
# )
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "python-${_pkgsrc}-release.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('4933cf325837f9401a855b6dfa773e4e0972ecaacafb5d378a3a787024a622b4')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

#   cd "${srcdir}/${_pkgsrc}"
#   PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
# }

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "ChangeLog" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
