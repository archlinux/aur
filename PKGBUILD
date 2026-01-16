# Maintainer: trojkat <tomasz@karbownicki.com>

_pkgname="jiratui"
pkgname="${_pkgname}-git"
pkgver=1.6.2.r0.gfc97e1d
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
	'python-uv-build<0.10.0'
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
	'python-textual>=6.4.0' 
	'python-textual-image>=0.8.2'
	'python-xdg-base-dirs>=6.0.2'
)
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${site_packages}/${_pkgname}-${pkgver%%.r*}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
