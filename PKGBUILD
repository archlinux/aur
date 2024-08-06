# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="bertini_real"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=r1517.58a8faa
pkgrel=1
pkgdesc="Python interface for Bertini_real"
arch=('any')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/${_name}"
license=('custom:Bertini license')
makedepends=('git' 'python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
depends=('bertini_real' 'python' 'python-numpy' 'python-scipy' 'python-sympy'
         'python-matplotlib' 'python-algopy' 'python-trimesh' 'python-dill'
         'python-setuptools')
optdepends=('python-glumpy: for OpenGL-accelerated rendering of surfaces')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_name}"
source=("${_pkgsrc}::git+${_url}.git"
        "${_pkgname}_fix_package_data.patch")
sha256sums=('SKIP'
            '430df15631ef29160638976cbd9339a16321875eeee3c5bd7ba790575d41f4f4')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}/python"
  patch -p1 -i "${srcdir}/${_pkgname}_fix_package_data.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}/python"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${_pkgname}/AUTHORS"

  cd "python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  rm -rf "${pkgdir}${site_packages}/build"
  rm -rf "${pkgdir}${site_packages}/docs"
  rm -rf "${pkgdir}${site_packages}/example"
}
