# Maintainer: Matt Moyles <matt@mattmoyles.com>
pkgname=jotdo
pkgver=0.1.0
pkgrel=1
_ftxui=7.0.3
_toml=3.4.0
pkgdesc='Reminders from your CalDAV server (Nextcloud, Apple Reminders lists) in a terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/mmoyles87/jotdo'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'curl' 'libical' 'pugixml')
makedepends=('cmake' 'ninja' 'gtest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "ftxui-$_ftxui.tar.gz::https://github.com/ArthurSonzogni/FTXUI/archive/refs/tags/v$_ftxui.tar.gz"
        "tomlplusplus-$_toml.tar.gz::https://github.com/marzer/tomlplusplus/archive/refs/tags/v$_toml.tar.gz")
sha256sums=('f695bb71f57e5e654b683d01bd3699f394a408fee8b22c81842ba85eb4217826'
            'e7c62ffe19009759821b4f0f8df7f2a6fb83784c3a9f1477d81f56d3ee723c88'
            '8517f65938a4faae9ccf8ebb36631a38c1cadfb5efa85d9a72e15b9e97d25155')

build() {
  # the dependencies' headers carry their paths in assertions
  CFLAGS+=" -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"
  CXXFLAGS+=" -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_SOURCE_DIR_FTXUI="$srcdir/FTXUI-$_ftxui" \
    -DFETCHCONTENT_SOURCE_DIR_TOMLPLUSPLUS="$srcdir/tomlplusplus-$_toml"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
