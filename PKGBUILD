# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="bertini_real"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=1.7.1.r1517.58a8faa
pkgrel=1
pkgdesc="Python interface for Bertini_real"
arch=('any')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/${_name}"
license=('custom:Bertini license')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
depends=('bertini_real' 'python' 'python-numpy' 'python-scipy' 'python-sympy'
         'python-matplotlib' 'python-algopy' 'python-trimesh' 'python-dill'
         'python-setuptools')
optdepends=('python-glumpy: for OpenGL-accelerated rendering of surfaces'
            'python-bertini_real-docs: HTML documentation')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_name}"
source=("${_pkgsrc}::git+${_url}.git"
        "${_pkgname}_fix_package_data.patch")
sha256sums=('SKIP'
            '430df15631ef29160638976cbd9339a16321875eeee3c5bd7ba790575d41f4f4')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(git rev-list --count HEAD)
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}/python/${_name}"
  local version=$(sed -n "s/^__version_info__ = (\(.*\))/\1/p" "__about__.py" | sed "s/, /./g")

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
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

  cd "${srcdir}/${_pkgsrc}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  rm -rf "${pkgdir}${site_packages}/build"
  rm -rf "${pkgdir}${site_packages}/docs"
  rm -rf "${pkgdir}${site_packages}/example"
}
