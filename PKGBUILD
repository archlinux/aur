# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="mtable"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=0.1.22.r1.b893750
_commit="97f59245683a1a20fc19595298485535bc1bc9ec"
pkgrel=1
pkgdesc="Format data to reStructedText and Markup Table"
arch=('any')
url="https://github.com/liuyug/${_name}"
license=('custom:BSD-?-Clause')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
# testdepends=('python-chardet')
depends=('python' 'python-wcwidth' 'python-beautifulsoup4' 'python-pandas')
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
  local version=$(sed -n "s/.*VERSION = '\([^']*\)'.*/\1/p" "${_name}.py")

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
  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -Dm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
