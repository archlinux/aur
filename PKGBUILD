# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="teimpy"
pkgname="python-${_name}"
pkgver=0.1.1
pkgrel=2
pkgdesc="Python library for displaying image on terminal"
arch=('any')
url="https://github.com/ar90n/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-poetry')
# checkdepends=('python-pytest>=5.3.4')
depends=('python>=3.6' 'python-numpy>=1.16' 'python-pillow>=6.0' 'libsixel'
         'python-setuptools')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('4f1000b394ce34a9d731ccce5e7d3dc19b727906798409d89ab15e8e05e6b09d')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  cp "/usr/lib/libsixel.so" "src/${_name}/libsixel/libsixel.so"
  sed -i '/build = "build\.py"/d' pyproject.toml
  rm -f "build.py" "pytest.ini"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   pytest
# }

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # install -d "${pkgdir}/${site_packages}/${_name}/libsixel"
  rm -f "${pkgdir}/${site_packages}/${_name}/libsixel/libsixel.so"
  ln -s "/usr/lib/libsixel.so" \
    "${pkgdir}/${site_packages}/${_name}/libsixel/libsixel.so"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
