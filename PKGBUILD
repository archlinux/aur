# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
pkgname=msquic
pkgver=1.1.8
pkgrel=3
epoch=1
pkgdesc="Microsoft implementation of the IETF QUIC protocol (release)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/microsoft/msquic"
license=('MIT')
depends=('glibc')
makedepends=('cmake>=3.16' 'dotnet-sdk>=3.1')
provides=('libmsquic.so')
conflicts=('libmsquic.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/microsoft/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        'openssl-484fcc7.tar.gz::https://github.com/akamai/openssl/archive/484fcc7392f3d7f4c257448f9aa70ad4f788ed33.tar.gz'
        'cmake_args.patch')
sha512sums=('246f5f42ddd2b8449a8add694902e43ea426fd43e3a851989ba1050f35ee1397e94251a5f9d04115280d31a3b9aa9fed302546393a7c9ee724670af4e8a457cf'
            '5ab9ceffb2d7a09360dd4ceeb66b868f6e2a073d8a5b649d5812652a57f3dd3290c1115b6b2a4848fee18d4c523b3d081ae24ab308ae9432959f21eb67c27b26'
            'f0eb23f885b9577f93101f9e68c6863dc896086068d3ed29e7b6924a1286ab8aa478feec42cf0fa3cfee2e5e2fb42e5be3f15451ff0954c4db2059de6ebe7c27')
noextract=('openssl-484fcc7.tar.gz')

prepare() {
	cd "$pkgname-$pkgver"

  mkdir -p "submodules/openssl"
  tar xzf "$srcdir/openssl-484fcc7.tar.gz" -C "submodules/openssl" --strip-components=1

  patch -p1 -i "$srcdir/cmake_args.patch"
}

build() {
  cmake \
    -B "$pkgname-$pkgver/build" \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
    -DQUIC_BUILD_TOOLS:BOOL='NO' \
    -DQUIC_BUILD_TEST:BOOL='NO' \
    -Wno-dev
  make -C "$pkgname-$pkgver/build" all
}

package() {
	make -C "$pkgname-$pkgver/build" DESTDIR="$pkgdir/" install
  install -D -m644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
