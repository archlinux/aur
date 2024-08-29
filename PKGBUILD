# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="teimpy"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=0.1.1.r4.gb91e7a3
pkgrel=1
pkgdesc="Python library for displaying image on terminal"
arch=('any')
url="https://github.com/ar90n/${_name}"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry>=0.12')
# checkdepends=('python-pytest>=5.3.4')
depends=('python>=3.7' 'python-numpy>=1.16' 'python-pillow>=6.0' 'libsixel'
         'python-setuptools')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_name}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgsrc}" clean -dfx

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

  install -d "${pkgdir}/${site_packages}/${_name}/libsixel"
  ln -s "/usr/lib/libsixel.so" \
    "${pkgdir}/${site_packages}/${_name}/libsixel/libsixel.so"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
