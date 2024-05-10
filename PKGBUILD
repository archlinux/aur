pkgname=rorqual-venv
_pkgname=rorqual
pkgver=3
pkgrel=1
pkgdesc="A TUI Subsonic client"
arch=(any)
url="https://github.com/janbuchar/rorqual"
makedepends=(git python-pip)
depends=(python mpv)
options=(!strip)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/janbuchar/rorqual/archive/refs/tags/release-3.tar.gz"
	"requirements.txt"
	"rorqual")

sha256sums=("ed6c30a18e574a7e01ebd12415e519fc9a258dc74c9e6b6bb3b5c328e3f62e90"
            "44cbe11a38c56894f14b16ca9513cebe832829a9e6390a8f742557b1344901c8"
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
