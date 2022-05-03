# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
_pkgname=msquic
pkgname=$_pkgname-1.9
pkgver=1.9.0
pkgrel=1
pkgdesc="Microsoft implementation of the IETF QUIC protocol (prerelease)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/microsoft/msquic"
license=('MIT')
depends=('openssl>=1.1.1')
makedepends=('cmake>=3.16' 'dotnet-sdk>=3.1')
provides=('msquic' 'libmsquic.so')
conflicts=('msquic' 'libmsquic.so')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/microsoft/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
        'openssl-df92821.tar.gz::https://github.com/quictls/openssl/archive/df92821e310497f8664b30cff24da897996d3cce.tar.gz'
        'cmake_args.patch')
sha512sums=('616a114f943de2fcc51ace2d67ebb4dceabff318cfb4381aa99307b1eecfb6095da1f635714ee03d1b1c6ed25c26bef63a3501d30d141808b3cce2ffb0d9720a'
            '4eb7596bb7b35c17b1d713dfe62e8a4f470d6c9d41eae14955f534aa4527ec3f14532155b8111d7b390ae82888207247c5b205ce5648aceeb59d959e88a7d870'
            '9d18293f34d1d83574cdcfb544bf6c0ff5f98f90ea33335bf0c7bfff9f4101b60d18c176e81f8249065b30e643be691ee2800c26727da97b6a56d79da8cd0d7f')
noextract=('openssl-df92821.tar.gz')

prepare() {
	cd "$_pkgname-$pkgver"

  mkdir -p "submodules/openssl"
  tar xzf "$srcdir/openssl-df92821.tar.gz" -C "submodules/openssl" --strip-components=1

  patch -p1 -i "$srcdir/cmake_args.patch"
}

build() {
  cmake \
    -B "$_pkgname-$pkgver/build" \
    -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DQUIC_USE_SYSTEM_LIBCRYPTO:BOOL='YES' \
    -DQUIC_BUILD_TOOLS:BOOL='NO' \
    -DQUIC_BUILD_TEST:BOOL='NO' \
    -Wno-dev
  make -C "$_pkgname-$pkgver/build" all
}

package() {
	make -C "$_pkgname-$pkgver/build" DESTDIR="$pkgdir/" install
  install -D -m644 "$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
