pkgname=rorqual-venv
_pkgname=rorqual
pkgver=7
pkgrel=1
pkgdesc="A TUI Subsonic client"
arch=(any)
url="https://github.com/janbuchar/rorqual"
makedepends=(git python-pip)
depends=(python mpv)
options=(!strip)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/janbuchar/rorqual/archive/refs/tags/release-7.tar.gz"
	"requirements.txt"
	"rorqual")

sha256sums=("8ad4d1e2452d9db43dae95f8d4d47ebd2c9d193c4a1d50c47209bdcf3f6797d4"
            "5250285c573a5b88300131ee3d955a426b5ca9b1617cab68fc3f592933aab046"
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
