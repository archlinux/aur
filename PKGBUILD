# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154
pkgname=audio-share
pkgver=0.0.17
pkgrel=1
pkgdesc="Audio Share can share computer's audio to Android phone over network, so your phone becomes the speaker of computer"
arch=('x86_64')
url='https://github.com/mkckr0/audio-share'
license=('Apache-2.0')
depends=('libpipewire')
makedepends=('vcpkg' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkckr0/audio-share/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b65f99dc9b78812936057978e910f135625c3c5e9a76e86b7b9c96636b14ead768faff156eeed64cd53f0fc7052393754a4723f25107c40371eecc1e62af566d')

prepare() {
  cp -pr '/opt/vcpkg' .
}

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
