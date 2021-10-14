# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
_pkgname=msquic
pkgname=$_pkgname-prerelease
pkgver=1.8.0
pkgrel=3
pkgdesc="Microsoft implementation of the IETF QUIC protocol."
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
sha512sums=('8d34612874c0454760c90d082932d4cde0c83c1b2829b5025e9550b2a47db7000ab34822dc1ae84d835d60f4d382381b14d2d0c70b8109447b756e20250776e2'
            '4eb7596bb7b35c17b1d713dfe62e8a4f470d6c9d41eae14955f534aa4527ec3f14532155b8111d7b390ae82888207247c5b205ce5648aceeb59d959e88a7d870'
            'd0854c3cbab909dc55d879a86870ad2c118fdb19521606de6c1294348e3c7bd9056d5a2f7ede36881a2632925d58665dfcefe4cfa1e2a35124efa1cf350dff74')
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
