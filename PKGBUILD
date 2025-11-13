pkgname=rorqual-venv
_pkgname=rorqual
pkgver=6
pkgrel=1
pkgdesc="A TUI Subsonic client"
arch=(any)
url="https://github.com/janbuchar/rorqual"
makedepends=(git python-pip)
depends=(python mpv)
options=(!strip)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/janbuchar/rorqual/archive/refs/tags/release-6.tar.gz"
	"requirements.txt"
	"rorqual")

sha256sums=("b93f8c0c1d2a7966fa668fca6efa945fc91030d887269514249921617fc94ca0"
            "091fe858703ea38eb88daefaa194680dadb6785351f7acbcefda5912c03033d5"
            "216924f61c4b550a85ccaead34a353ea828d5a5182495aec91e20d2c18dcafdf")

package() {
	# Create virtualenv
	export PIP_DISABLE_PIP_VERSION_CHECK=1
	export PYTHONDONTWRITEBYTECODE=1
	python -m venv "$pkgdir"/opt/rorqual/virtualenv
	source "$pkgdir"/opt/rorqual/virtualenv/bin/activate

	# Install dependencies
	pip install --upgrade pip wheel
	pip install -r requirements.txt

	# Install rorqual
	pushd $srcdir/${_pkgname}-release-${pkgver}
	pip install .
	popd

	# Deactivate virtualenv
	deactivate

	# Install launcher script
	install -Dm755 rorqual "$pkgdir"/usr/bin/rorqual
}
