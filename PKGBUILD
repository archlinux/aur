# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
pkgname=msquic-release-git
pkgver=1.1.8.r0.g794436f54
pkgrel=2
pkgdesc="MsQuic is a Microsoft implementation of the IETF QUIC protocol."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/microsoft/msquic"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'dotnet-sdk' 'git')
provides=('msquic' 'libmsquic.so')
conflicts=('msquic' 'libmsquic.so')
source=("$pkgname::git+https://github.com/microsoft/msquic.git#branch=release/1.1"
        'cmake_args.patch')
sha512sums=('SKIP'
            'f0eb23f885b9577f93101f9e68c6863dc896086068d3ed29e7b6924a1286ab8aa478feec42cf0fa3cfee2e5e2fb42e5be3f15451ff0954c4db2059de6ebe7c27')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
  git submodule update --init --recursive --depth=1
  patch -p1 -i "$srcdir/cmake_args.patch"
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

package() {
	make -C "$pkgname/build" DESTDIR="$pkgdir/" install
  install -D -m644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
