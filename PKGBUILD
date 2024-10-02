# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>
pkgname=fcitx5-hazkey
pkgver=0.0.8
pkgrel=1
pkgdesc="Japanese input method for fcitx5, powered by azooKey engine"
arch=('x86_64' 'aarch64')
url="https://github.com/7ka-Hiira/fcitx5-hazkey"
license=('MIT')
depends=('fcitx5>=5.0.4')
optdepends=('vulkan-driver: Zenzai neural conversion support')
makedepends=('cmake' 'swift-language' 'vulkan-headers')
source=("https://github.com/7ka-Hiira/fcitx5-hazkey/archive/refs/tags/0.0.8.tar.gz"
        "https://codeload.github.com/ensan-hcl/azooKey_dictionary_storage/zip/b05798b43679c385ce2179fb746512d7643dfe12")
sha256sums=('d42e99d578ae9b2b67a3d72048192b9ecabcc1b24c420f99c4b2c795c706c983'
            '94153f10f87f2fd754d32f3892d7dacc0f2c6fbb309630ab83d22377a3fffed8')

build() {
	cd "$pkgname-$pkgver"

	cp -r ../azooKey_dictionary_storage-b05798b43679c385ce2179fb746512d7643dfe12/Dictionary azooKey_dictionary_storage/

	mkdir -p build
	cd build

	# First run fails for unknown reason, so run it twice
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr || true
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install

	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
