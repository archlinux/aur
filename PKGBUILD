# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="markdown_strings"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=3.4.0.r1.6c87ffb
_commit="4267a6c3ecec53705fb2ae091113a409b73a13b8"
pkgrel=2
pkgdesc="Create markdown formatted text"
arch=('any')
url="https://github.com/awesmubarak/${_name}"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
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
  local version=$(sed -n 's/.*version="\([^"]*\)".*/\1/p' "setup.py")

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  git -C "${srcdir}/${_pkgsrc}" clean -dfx
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  python test.py
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${site_packages}/${_name}-${pkgver%%.r*}.dist-info/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
