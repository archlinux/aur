# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-amazon-cloud-player
pkgdesc='Amazon Cloud Player integration for Nuvola Player 3.0'
pkgver=5.3
pkgrel=1

license=('BSD')

arch=('any')
conflicts=('nuvola-app-amazon-cloud-player-git')
depends=('nuvolaplayer>=3' 'nuvolaplayer<4')
makedepends=('lasem' 'scour' 'python-virtualenv')
sha256sums=('c831951d6b1ce45d957f6823e2fef79b05e38ffa7cc506fe40a9bfe62a4eb0eb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz")
url="https://github.com/tiliado/${pkgname}"

prepare() {
	cd "${pkgname}-${pkgver}"

	virtualenv ve
	source ve/bin/activate
	pip install nuvolasdk

	# Generate Makefile
	./configure
}

build() {
	cd "${pkgname}-${pkgver}"

	# Optimize SVG icons (scour), generate PNG icons (lasem)
	make
}

package() {
	cd "${pkgname}-${pkgver}"

	make install DESTDIR="${pkgdir}/usr/share/nuvolaplayer3/web_apps"

	# Install all available licenses.
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE*
}
