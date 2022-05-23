# Maintainer: missing <liri_bucketful at slmail dot me>
pkgname=lbry-sdk
pkgver=0.108.0
pkgrel=1
pkgdesc="The LBRY SDK for building decentralized, censorship resistant, monetized, digital content apps."
arch=('x86_64')
url="https://github.com/lbryio/lbry-sdk"
license=('MIT')
makedepends=('git' 'cmake' 'openssl' 'python-pip' 'python-protobuf')
provides=('lbrynet')
conflicts=('lbrynet')
options=('!buildflags')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lbryio/lbry-sdk/archive/refs/tags/v${pkgver}.tar.gz"
        'git+https://github.com/lbryio/lbry-rocksdb')
sha256sums=('410f92741d87f2ca13df3748d2e593e8dc70f7b5a1420fe6f4f1013b4b03f35d'
            'SKIP')

prepare() {
	cp ../*.patch "$srcdir"	

	cd lbry-rocksdb
	git submodule update --init --recursive
	git pull --recurse-submodules
}

build() {
	python -m venv lbry-venv
	source lbry-venv/bin/activate

	patch --strip=0 --input=lbry-rocksdb.patch
	cd lbry-rocksdb
	make
	pip install -e .

	cd ../
	patch --strip=0 --input="lbry-sdk-${pkgver}.patch"
	cd "lbry-sdk-${pkgver}"
	make install

	cd ..
	patch --strip=0 --input=lbry-venv.patch

	mkdir build
	cd build
	pip install pyinstaller
	pyinstaller --onefile --name lbrynet "../lbry-sdk-${pkgver}/lbry/extras/cli.py"
}

package() {
	install -Dm755 "${srcdir}/build/dist/lbrynet" "${pkgdir}/usr/bin/lbrynet"
	install -Dm644 "${srcdir}/lbry-sdk-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
