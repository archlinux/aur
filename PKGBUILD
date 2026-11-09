# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="guppy3"
pkgname="python-${_pypiname}"
pkgver=3.2.0
pkgrel=1
pkgdesc="Programming environment providing object and heap memory sizing, profiling and analysis"
arch=(
  'aarch64'
  'armv7h'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://zhuyifei1999.github.io/guppy3/"
_url="https://github.com/zhuyifei1999/${_pypiname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'python>=3.11'
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
sha256sums=('306d69a4335d8e9fa08fa1f5728a5488a6ea81960cda20c46bd3fa0eaad95c1f')

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

  install -vd "${pkgdir}/usr/share/licenses"
  ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses" \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}
