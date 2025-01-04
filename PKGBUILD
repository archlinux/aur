# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-usfm2osis-cw-git
_pypiname=usfm2osis
pkgver=r139.a861a53
pkgrel=5
_branch=module-tools-sync
pkgdesc='Tools for converting Bibles from USFM to OSIS XML (CrossWire Development Fork)'
arch=(any)
url=https://github.com/JohnAustinDev/Module-tools/
license=(GPL-2.0-only)
depends=(python)
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools)
options=(!emptydirs)
provides=("${pkgname%-cw-git}")
conflicts=("${pkgname%-cw-git}")
source=("git+https://github.com/alerque/$_pypiname.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
	cd "$_pypiname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pypiname"
	mv usfm2osis/scripts/*py usfm2osis/
	sed -i -e 's/usfm2osis.scripts/usfm2osis/g' setup.py
	sed -i -e '/__main__/s/^.*$/def main(args=None):/g' usfm2osis/usfm2osis.py
	sed -i -e '/^scriptVersion/a DEBUG = False' usfm2osis/usfm2osis.py
	python -m build
}

package() {
	cd "$_pypiname"
	python -m installer -d "$pkgdir" dist/*.whl
}
