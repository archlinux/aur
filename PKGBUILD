# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=par2deep
pkgver=1.10.1
pkgrel=2
pkgdesc="Create, verify and repair parity files in a file tree."
arch=('any')
url="https://github.com/brenthuisman/par2deep"
license=('LGPL3')
depends=('python')
makedepends=('gendesk' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/brenthuisman/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fdf0053479f8e7358c63948253187a97c329c71c215112a643344229cc4e2e7e')

_srcdir="${pkgname}-${pkgver}"

build() {
	gendesk -f -n --pkgname "${pkgname}" --categories 'Utility'

	cd "${_srcdir}"
	python -m build --wheel --no-isolation
}

package() {
	depends+=(
		'python-tqdm'
		'python-configargparse'
		'python-send2trash'
		'python-pyqt5'
		'par2cmdline')
	
	install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	
	cd "${_srcdir}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/${pkgname}"

	rm -f "$pkgdir/usr/lib/python"*"/site-packages/$pkgname/libpar2".*
}
