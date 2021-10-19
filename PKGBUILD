# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
pkgname=msquic-prerelease-git
pkgver=1.8.0.r0.g0b0e8b952
pkgrel=1
pkgdesc="MsQuic is a Microsoft implementation of the IETF QUIC protocol."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/microsoft/msquic"
license=('MIT')
depends=('openssl>=1.1.1')
makedepends=('cmake>=3.16' 'dotnet-sdk>=3.1' 'git')
provides=('msquic' 'libmsquic.so')
conflicts=('msquic' 'libmsquic.so')
source=("$pkgname::git+https://github.com/microsoft/msquic.git#branch=prerelease/1.8"
        'cmake_args.patch')
sha512sums=('SKIP'
            'd0854c3cbab909dc55d879a86870ad2c118fdb19521606de6c1294348e3c7bd9056d5a2f7ede36881a2632925d58665dfcefe4cfa1e2a35124efa1cf350dff74')

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
