pkgname=rorqual-venv
_pkgname=rorqual
pkgver=5
pkgrel=1
pkgdesc="A TUI Subsonic client"
arch=(any)
url="https://github.com/janbuchar/rorqual"
makedepends=(git python-pip)
depends=(python mpv)
options=(!strip)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/janbuchar/rorqual/archive/refs/tags/release-5.tar.gz"
	"requirements.txt"
	"rorqual")

sha256sums=("9358b7d45170acf28ea0e8fb183b7d112e7f088b6149ab6b53aad2f9435b91f8"
            "c8ec3d5a10fc084d8157fe341a20a41f8eead3cd33c08ae830fb9745ba619123"
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
