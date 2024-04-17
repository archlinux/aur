pkgname=rorqual-venv
_pkgname=rorqual
pkgver=1
pkgrel=1
pkgdesc="A TUI Subsonic client"
arch=(any)
url="https://github.com/janbuchar/rorqual"
makedepends=(git python-pip)
depends=(python mpv)
options=(!strip)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/janbuchar/rorqual/archive/refs/tags/release-1.tar.gz"
	"requirements.txt"
	"rorqual")

sha256sums=("c7014adf9c2223435cfa04429fc4e0c930eb8203148e6dd6a70c7c8734211c3d"
            "4406a5c36530d108f96d4f8c307ccab6aa7213a3b383024699e7cc7f019bad66"
            "ed4bc69a4bee85703312fdc55d59caf657a0ee383e10756d46cbc9fd62c133e2")

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
