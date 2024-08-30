# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: ftsell <aur@finn-thorben.me>

_name="exhale"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=0.3.8.dev.r0.c995925
pkgrel=1
pkgdesc="A sphinx extension which integrates breathe to enable parsing of doxygen documentation"
arch=('any')
url="https://github.com/svenevs/${_name}"
license=('BSD-3-Clause')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools>=42')
depends=('python>=3.8' 'python-breathe>=4.33.1' 'python-sphinx>=4.3.2'
         'python-beautifulsoup4' 'python-lxml' 'python-six' 'python-pygments')
optdepends=("${_pkgname}-docs: HTML documentation")
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_name}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  # git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}/${_name}"
  local version=$(sed -n 's/.*__version__ = "\([^"]*\)".*/\1/p' "__init__.py")

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  git -C "${srcdir}/${_pkgsrc}" clean -dfx
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver%%.r*}0.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
