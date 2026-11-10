pkgname=rorqual-venv
_pkgname=rorqual
pkgver=12
pkgrel=1
pkgdesc="A TUI Subsonic client"
arch=(any)
url="https://github.com/janbuchar/rorqual"
makedepends=(git python-pip)
depends=(python mpv)
options=(!strip)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/janbuchar/rorqual/archive/refs/tags/release-12.tar.gz"
	"requirements.txt"
	"rorqual")

sha256sums=("a00873b0a9615e77b0458ec0b11f5fea7bce782403ad3d3583449794428ca85a"
            "5250285c573a5b88300131ee3d955a426b5ca9b1617cab68fc3f592933aab046"
            "dafe97dbf17b6c3c2a3ec54476971ea6d3f96230412279756b5d0185c34b37cd")

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
