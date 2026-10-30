# Maintainer Szymon Januszek <szymon_j at tutanota dot com>

pkgname=python-cheby-git
_name=${pkgname#python-%-git}
pkgver=1.7.2
pkgrel=1
pkgdesc="The Cheby project aims at defining a file format to describe the HW/SW interface (the memory map), and a set of tools to generate HDL, drivers, documentation... from these files."
arch=('any')
url="https://gitlab.cern.ch/be-cem-edl/common/cheby"
license=('GPL-3.0-or-later')
depends=(
	'python'
	'python-pyaml'
)
makedepends=(python-build python-installer python-wheel)
source=("${_name}-${pkgver}::git+https://gitlab.cern.ch/be-cem-edl/common/cheby#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	git -C "${srcdir}/${_name}-${pkgver}" clean -dfx

	#Remove the license line, keep the file. See: https://peps.python.org/pep-0639/#term-license-expression
	sed -i 's/"License :: OSI Approved :: GPL-3.0-or-later",//g' "${_name}-${pkgver}/pyproject.toml"
	sed -i 's/license = {file = "LICENSES\/GPL-3.0-or-later.txt"}/license = "GPL-3.0-or-later"/g' "${_name}-${pkgver}/pyproject.toml"
	#Fix the linux specifier format
    sed -i 's/Operating System :: Linux/Operating System :: POSIX :: Linux/g' "${_name}-${pkgver}/pyproject.toml"
}

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
