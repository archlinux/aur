# Maintainer: SZanko, szanko at protonmail dot com

_pkgname=samloader
pkgname=${_pkgname}-git
pkgver=r46.b20e1b1
pkgrel=2
pkgdesc="Download firmware for Samsung devices"
arch=('any')
url="https://github.com/martinetd/samloader"
license=('GPL3')
conflicts=('samloader')
depends=(
	'python'
	'python-tqdm'
	'python-pycryptodomex'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
)
source=(git+"${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	sed -E -i "s/cloud-neofussvr.sslcs.cdngc.net/cloud-neofussvr.samsungmobile.com/g" samloader/fusclient.py
	python3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    cd "$srcdir/$_pkgname"
    python3 -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
