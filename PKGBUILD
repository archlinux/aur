pkgname=rorqual-venv
_pkgname=rorqual
pkgver=2
pkgrel=1
pkgdesc="A TUI Subsonic client"
arch=(any)
url="https://github.com/janbuchar/rorqual"
makedepends=(git python-pip)
depends=(python mpv)
options=(!strip)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/janbuchar/rorqual/archive/refs/tags/release-2.tar.gz"
	"requirements.txt"
	"rorqual")

sha256sums=("31341369bc2d1839721118adc4d984a3a0723fe38ae3f20ad27c64ad9d27c789"
            "0827cc9892691742886b7f589d4447ba2e3377911ef7e975cb193cf0981c0614"
            "ff4455d4d8880e143a593f9c55d16bf24387fa2f20a2fa6ea3233e618af44c5c")

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
