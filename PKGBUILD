# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
pkgname=msquic-git
pkgver=1.9.0
pkgrel=1
pkgdesc="Microsoft implementation of the IETF QUIC protocol (git)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/microsoft/msquic"
license=('MIT')
depends=('openssl>=1.1.1')
makedepends=('cmake>=3.16' 'dotnet-sdk>=3.1' 'git')
provides=('msquic' 'libmsquic.so')
conflicts=('msquic' 'libmsquic.so')
source=("$pkgname::git+https://github.com/microsoft/msquic.git"
        'cmake_args.patch')
sha512sums=('SKIP'
            '9d18293f34d1d83574cdcfb544bf6c0ff5f98f90ea33335bf0c7bfff9f4101b60d18c176e81f8249065b30e643be691ee2800c26727da97b6a56d79da8cd0d7f')

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
