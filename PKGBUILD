# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154
pkgname=audio-share
pkgver=0.3.4
pkgrel=1
pkgdesc="Audio Share can share computer's audio to Android phone over network, so your phone becomes the speaker of computer"
arch=('x86_64')
url='https://github.com/mkckr0/audio-share'
license=('Apache-2.0')
depends=('libpipewire')
makedepends=('vcpkg' 'cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkckr0/audio-share/archive/refs/tags/v${pkgver}.tar.gz"
        "git+https://github.com/microsoft/vcpkg")
b2sums=('07a59c00f23c135e2cc660c89193a338bdc842a4aef91894ce6f5581e49947c3308db374a10f094e4ad60de572ff193ad664f814bcaa185dc23f8fe64b01eb0a'
        'SKIP')

build() {
  export VCPKG_ROOT="$PWD/vcpkg"
  vcpkg install --downloads-root="$PWD/cache" --vcpkg-root="$VCPKG_ROOT" --binarysource=clear asio protobuf spdlog cxxopts
  cd "$pkgname-$pkgver/server-core"
  cmake --preset linux-Release
  cmake --build --preset linux-Release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/server-core/out/install/linux-Release/bin/as-cmd" "$pkgdir/usr/bin/as-cmd"
}

# vim: ts=2 sw=2 et
