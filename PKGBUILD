# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
pkgname=msquic-git
pkgver=1.9.0.r1244.ga11b58bc6
pkgrel=2
pkgdesc="Microsoft implementation of the IETF QUIC protocol (git)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/microsoft/msquic"
license=('MIT')
depends=('openssl>=3.0.0')
makedepends=('cmake>=3.16' 'dotnet-sdk>=3.1' 'git')
provides=('msquic' 'libmsquic.so')
conflicts=('msquic' 'libmsquic.so')
source=("$pkgname::git+https://github.com/microsoft/msquic.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
  git submodule update --init --recursive --depth=1
}

build() {
  cmake \
    -B "$pkgname/build" \
    -S "$pkgname" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_SKIP_INSTALL_RPATH='YES' \
    -DQUIC_BUILD_TOOLS='NO' \
    -DQUIC_BUILD_TEST='NO' \
    -DQUIC_TLS='openssl3' \
    -Wno-dev
  make -C "$pkgname/build" all
}

package() {
	make -C "$pkgname/build" DESTDIR="$pkgdir/" install
  install -D -m644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
