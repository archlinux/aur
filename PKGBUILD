# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="pycodec2"
pkgname="python-${_name}"
pkgver=4.1.0
pkgrel=1
pkgdesc="Python's interface to codec 2"
arch=('aarch64' 'x86_64')
url="https://github.com/gregorias/${_name}"
license=('BSD-3-Clause')
depends=('codec2>=1.2' 'glibc' 'python>=3.10' 'python-numpy>=2')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools>=79')
# checkdepends=('python-pytest')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('46a491f4c8e2328cb633b40ef6dccbd2ea08da51f6b76e795c4d7a439f8d355b')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i 's/numpy==2.1.\*/numpy==2.\*/g' 'pyproject.toml'
}

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   local python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
# 
#   cd "${srcdir}/${_pkgsrc}"
#   PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
# }

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
