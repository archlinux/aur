# Maintainer: missing <liri_bucketful at slmail dot me>
pkgname=lbry-sdk
pkgver=0.112.0
pkgrel=1
pkgdesc="The LBRY SDK for building decentralized, censorship resistant, monetized, digital content apps."
arch=('x86_64')
url="https://github.com/lbryio/lbry-sdk"
license=('MIT')
makedepends=('git' 'cmake' 'python')
provides=('lbrynet')
conflicts=('lbrynet')
options=('!buildflags')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lbryio/lbry-sdk/archive/refs/tags/v${pkgver}.tar.gz"
        "lbry-sdk-${pkgver}.patch"
        'lbry-venv.patch')
sha256sums=('bc1466b1ef99ffacbb7ee1ef5df301a6c9ce86c2df505de714ba5db69839c2ce'
            '6d7ae523b05dab708f7bcb6fe0ea6d0008512cc1d895202204dfacfccb27d83d'
            '053e7f128eb0ab4e5637f94a3a08af3a80c851b57f4eab26710ec1c85bcce6e7')

build() {
	python -m venv lbry-venv
	source lbry-venv/bin/activate

	patch --strip=0 --input="lbry-sdk-${pkgver}.patch" || true
	cd "lbry-sdk-${pkgver}"
	make install

	cd ..
	patch --strip=0 --input=lbry-venv.patch || true

	mkdir build
	cd build
	pip install pyinstaller
	pyinstaller --onefile --name lbrynet "../lbry-sdk-${pkgver}/lbry/extras/cli.py"
}

package() {
	install -Dm755 "${srcdir}/build/dist/lbrynet" "${pkgdir}/usr/bin/lbrynet"
	install -Dm644 "${srcdir}/lbry-sdk-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
