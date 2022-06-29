# Maintainer: missing <liri_bucketful at slmail dot me>
pkgname=lbry-sdk
pkgver=0.109.0
pkgrel=2
pkgdesc="The LBRY SDK for building decentralized, censorship resistant, monetized, digital content apps."
arch=('x86_64')
url="https://github.com/lbryio/lbry-sdk"
license=('MIT')
makedepends=('git' 'cmake' 'python')
provides=('lbrynet')
conflicts=('lbrynet')
options=('!buildflags')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lbryio/lbry-sdk/archive/refs/tags/v${pkgver}.tar.gz"
        'git+https://github.com/lbryio/lbry-rocksdb'
        'lbry-rocksdb.patch'
        "lbry-sdk-${pkgver}.patch"
        'lbry-venv.patch')
sha256sums=('e82fcfeb9bf1cc8f64a99f2d9aab8e3bd468ac68b152d7c89b38c1c98281666f'
            'SKIP'
            'ba653adbdd6001080e5963929a733af0ac287b5022e16444c2848fac898c420a'
            'e370a5e9875e9f10cf5b4481545e0c35982539310226de70c0c34b7dfb6baf27'
            '7061749daacd7ab1db2b10383aaedfc12b47de2cc72c57e0c533b63e9302c881')

prepare() {
	cd lbry-rocksdb
	git submodule update --init --recursive
	git pull --recurse-submodules
}

build() {
	python -m venv lbry-venv
	source lbry-venv/bin/activate

	patch --strip=0 --input=lbry-rocksdb.patch || true
	cd lbry-rocksdb
	make
	pip install -e .

	cd ../
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
