# Maintainer: missing <liri_bucketful at slmail dot me>
pkgname=lbry-sdk
pkgver=0.110.0
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
sha256sums=('500af0ad225008dd11706deab95e4cfe665f84a28e8fe6e6e3f08c7607173c59'
            '698c9bda191eeed83890e5151a2d4e942de660153785ca6a9d5acaa370573ab2'
            '5ceda274f79f183507c1ab93a18e0df33ceadfa837857e033cb658b1b58eb123')

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
