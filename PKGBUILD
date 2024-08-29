# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="picotui"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=1.2.1.r2.64a58be
_commit="eea5113fcf95f4340cd6139bf63697baefc7b17b"
pkgrel=1
pkgdesc="Lightweight, pure-Python Text User Interface (TUI) widget toolkit"
arch=('any')
url="https://github.com/pfalcon/${_name}"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
# checkdepends=('python-pytest')
depends=('python')
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

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check () {
#   cd "${srcdir}/${_pkgsrc}"
#   pytest
# }

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver%%.r*}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
