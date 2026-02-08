# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>
pkgname=fcitx5-hazkey
pkgver=0.2.1
pkgrel=1
pkgdesc="Japanese input method for fcitx5, powered by azooKey engine"
arch=('x86_64')
url="https://hazkey.hiira.dev/"
license=('MIT')
depends=('fcitx5>=5.0.4' 'qt6-base' 'libprotobuf-lite.so')
makedepends=('cmake' 'ninja' 'swift-language' 'vulkan-headers')
provides=('hazkey-server' 'hazkey-settings')
conflicts=('hazkey-server' 'hazkey-settings')
_dictionaryversion=3.0.1
_emojidictionaaryversion=08f82252fb90ef8f0949a7e3c554e9e1787ce121
_llamacppversion=10295c26a2a18c3c48863b179c5e6bf34a4057d1
source=("https://github.com/7ka-Hiira/fcitx5-hazkey/archive/refs/tags/0.2.1.tar.gz"
        "https://github.com/7ka-Hiira/llama.cpp/archive/$_llamacppversion.zip"
        "azooKey_dictionary_storage-v$_dictionaryversion.tar.gz::https://codeload.github.com/azooKey/azooKey_dictionary_storage/zip/refs/tags/v$_dictionaryversion"
        "azooKey_emoji_dictionary_storage-$_emojidictionaaryversion::https://codeload.github.com/azooKey/azooKey_emoji_dictionary_storage/zip/$_emojidictionaaryversion")
sha256sums=('bd257a9ab3b3f490e61c31b174b6396715445c11b93b04fcd30f96fd94d6f1dd'
            'e45841df148abf63123f3fa8c5d1299db5a1cae2a703b9f957a3fc163f3c3417'
            '9b941ef555ec95d6a6ff914e330e7598eb2fbf9a4f83e9acc58b422f8a35bfc1'
            '266620b56f8a0ebe674e41475c9cfd0a02da9f75bda942f3041da128dde8e97d')

build() {
    cd "hazkey-$pkgver"

    cp -r ../azooKey_dictionary_storage-$_dictionaryversion/Dictionary ./hazkey-server/azooKey_dictionary_storage/
    cp -r ../azooKey_emoji_dictionary_storage-$_emojidictionaaryversion/EmojiDictionary ./hazkey-server/azooKey_emoji_dictionary_storage/
    rmdir ./hazkey-server/llama.cpp
    cp -r ../llama.cpp-$_llamacppversion ./hazkey-server/llama.cpp

    mkdir -p build && cd build

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja ..
    ninja
}

package() {
	cd "hazkey-$pkgver/build"
	DESTDIR="$pkgdir" ninja install

	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
