# Maintainer: 0xIsho <0xIsho+aur@proton.me>
# Contributor: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/ValveSoftware/GameNetworkingSockets
# Upstream: https://github.com/ValveSoftware/GameNetworkingSockets

pkgname=gamenetworkingsockets-git
pkgver=1.4.1.157.g725e273
pkgrel=1
pkgdesc="Reliable & unreliable messages over UDP. Robust message fragmentation & reassembly. Encryption."
arch=('x86_64')
url='https://github.com/ValveSoftware/GameNetworkingSockets'
license=('BSD-3-Clause')
depends=('protobuf' 'openssl')
makedepends=('cmake' 'git')
provides=('gamenetworkingsockets')
source=("$pkgname::git+https://github.com/ValveSoftware/GameNetworkingSockets.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

prepare()
{
	cd "$srcdir/$pkgname"
	git submodule update --init

	# Remove the following after https://github.com/ValveSoftware/GameNetworkingSockets/pull/371 is merged
	git apply ../../fix-string_view-return.patch
}

build() {
  cd "$srcdir/$pkgname"
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  cmake --install build
}
