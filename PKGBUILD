# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="img2unicode"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=0.1a11.r2.6a94265
_commit="3356b0cd46ddaa55e9ee1854d056f817d89b99f3"
pkgrel=1
pkgdesc="A tool to display images as Unicode in your terminal"
arch=('any')
url="https://github.com/matrach/${_name}"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
depends=('python>=3.7' 'python-numpy1>=1.19' 'python-scikit-image>=0.19'
         'python-pillow' 'python-scikit-learn' 'python-click' 'python-six'
         'python-matplotlib')
optdepends=('python-n2: for FastGammaRenderer'
            'python-urwid: for termview')
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

  cd "${srcdir}/${_pkgsrc}"
  local version=$(sed -n "s/.*version='\([^']*\)'.*/\1/p" "setup.py")

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

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver%%.r*}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
