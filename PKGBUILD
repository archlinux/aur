# Maintainer: Matt Moyles <matt@mattmoyles.com>
pkgname=jotmail
pkgver=0.1.1
pkgrel=1
_ftxui=7.0.3
_toml=3.4.0
_stb=2c980bb59875b0d32144a71867fbdebb2f77cd20
_vmime=63ddb3b378487e7209ec3390cb33c6cde9bdec0a
pkgdesc='Notes from your IMAP mailbox (Apple Notes, Fastmail) in a terminal, with images in kitty and Ghostty'
arch=('x86_64' 'aarch64')
url='https://github.com/mmoyles87/jotmail'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib' 'libwebp')
makedepends=('cmake' 'ninja' 'gtest')
optdepends=('wl-clipboard: paste images on Wayland'
            'xclip: paste images on X11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "ftxui-$_ftxui.tar.gz::https://github.com/ArthurSonzogni/FTXUI/archive/refs/tags/v$_ftxui.tar.gz"
        "tomlplusplus-$_toml.tar.gz::https://github.com/marzer/tomlplusplus/archive/refs/tags/v$_toml.tar.gz"
        "stb-$_stb.tar.gz::https://github.com/nothings/stb/archive/$_stb.tar.gz"
        "vmime-$_vmime.tar.gz::https://github.com/kisli/vmime/archive/$_vmime.tar.gz")
sha256sums=('8543f87563ffb6ea19d30956baecfc4736d14f5d7a9a5d737270356a0a2c3609'
            'e7c62ffe19009759821b4f0f8df7f2a6fb83784c3a9f1477d81f56d3ee723c88'
            '8517f65938a4faae9ccf8ebb36631a38c1cadfb5efa85d9a72e15b9e97d25155'
            '9a955b1b49a4410088a2e0ee2a9c057c3c907d0c1d75454144cb980aca0ba515'
            '1ddaeef647ad2919e1a901f4aa2427c722515d66c66e7ca9d704a91d46c3e30b')

build() {
  # the dependencies' headers carry their paths in assertions
  CFLAGS+=" -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"
  CXXFLAGS+=" -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_SOURCE_DIR_FTXUI="$srcdir/FTXUI-$_ftxui" \
    -DFETCHCONTENT_SOURCE_DIR_TOMLPLUSPLUS="$srcdir/tomlplusplus-$_toml" \
    -DFETCHCONTENT_SOURCE_DIR_STB="$srcdir/stb-$_stb" \
    -DFETCHCONTENT_SOURCE_DIR_VMIME="$srcdir/vmime-$_vmime"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
