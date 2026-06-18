# Maintainer: livvy <liv@base.nu>
# Contributor: trojkat <tomasz@karbownicki.com>

_pkgname="jiratui"
pkgname="${_pkgname}-git"
pkgver=1.9.1.r0.gdb4a7e2
pkgrel=1
pkgdesc="A Textual User Interface for interacting with Atlassian Jira from your shell"
arch=('any')
url="https://github.com/whyisdifficult/${_pkgname}"
license=('MIT')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-uv-build>=0.9.2'
)
depends=(
  'python>=3.10'
  'python-click>=8.2.1'
  'python-gitpython>=3.1.45'
  'python-httpx>=0.28.1'
  'python-pydantic-settings>=2.11.0'
  'python-dateutil>=2.9.0'
  'python-json-logger>=3.3.0'
  'python-magic>=0.4.27'
  'python-mistune>=1:3.0.0'
  'python-puremagic>=2.0.0'
  'python-textual>=6.4.0'
  'python-textual-autocomplete>=4.0.0'
  'python-textual-image>=0.8.2'
  'python-xdg-base-dirs>=6.0.2'
  'python-marklas>=0.7.0'
)
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=(
  "${_pkgsrc}::git+${url}.git"
  "0001-remove-uv-build-upper-bound.patch"
)
sha256sums=(
  'SKIP'
  '74b6d14bf1af5ec39c24a5d119856c6aa2a7d5516a271349ca0da0bb2a20c93a'
)

pkgver() {
  cd "${_pkgsrc}" || return 1
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}" || return 1
  git clean -dfx
  git apply "${srcdir}/0001-remove-uv-build-upper-bound.patch"
}

build() {
  set -ex
  cd "${srcdir}/${_pkgsrc}" || exit
  python -m build --wheel --no-isolation
}

package() {
  local site_packages
  site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}" || exit
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${site_packages}/${_pkgname}-${pkgver%%.r*}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
