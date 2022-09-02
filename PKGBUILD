# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
pkgname=msquic-release-git
pkgver=2.1.0.r3.g94bd8187d
pkgrel=1
pkgdesc="Microsoft implementation of the IETF QUIC protocol (release, git)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/microsoft/msquic"
license=('MIT')
depends=('glibc')
makedepends=('cmake>=3.16' 'dotnet-sdk>=3.1' 'git')
provides=('msquic' 'libmsquic.so')
conflicts=('msquic' 'libmsquic.so')
source=("$pkgname::git+https://github.com/microsoft/msquic.git#branch=release/2.1")
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
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
    -DQUIC_BUILD_TOOLS:BOOL='NO' \
    -DQUIC_BUILD_TEST:BOOL='NO' \
    -Wno-dev
  make -C "$pkgname/build" all
}

check() {
  make -C "$pkgname/build" test
}

package() {
	make -C "$pkgname/build" DESTDIR="$pkgdir/" install
  install -D -m644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
