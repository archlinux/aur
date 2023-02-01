# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
pkgname=msquic
pkgver=2.1.7
_clog_commit=a4f472c5fe2c8298c0ada2e24717458c45a17eb1
_googletest_commit=dd7a9d29a33de34836c345c3b753d4eba15c5f44
_openssl_commit=6d6e737a473eba179ea9b666a7bc2e3873c1c5c7
pkgrel=1
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
        "clog-$_clog_commit.tar.gz::https://github.com/microsoft/CLOG/archive/$_clog_commit.tar.gz"
        "googletest-$_googletest_commit.tar.gz::https://github.com/google/googletest/archive/$_googletest_commit.tar.gz"
        "openssl-$_openssl_commit.tar.gz::https://github.com/quictls/openssl/archive/$_openssl_commit.tar.gz")
sha512sums=('23ef4cc3794180b06d0ed138d6e96e37ef5f15ea0ccbf405f95f13c9fbd5aedc8a9c5c403b38b2381801796c50907ee36ebed1161da687bacd82cdea6880475a'
            '593ebae4f2dd0f76c56b21b849cceaa9847bd2fc5eea511b3c6236c577e869134381e3d20a1511e7c649b4e305501f6689004880d8155fb0e3ce8cbe18e4f2c2'
            'ad897fa82f7b17c8ad59376e039b026b092973495a41b30527afd656714302bb05dd8564c77f18cf13a8e6f952df2e6483d79a25ee30cdfd9211078ecd1ee5cb'
            'fd3ed9465b8ed260264df3b34aea38f4380ca3667142cd67e7e2641cb2e70d0b32d37e6d504ff8bac5b67fa876d18d3b4fd6bb5f77f43a04b96bf414781899b2')
noextract=("clog-$_clog_commit.tar.gz"
           "googletest-$_googletest_commit.tar.gz"
           "openssl-$_openssl_commit.tar.gz")

prepare() {
	cd "$pkgname-$pkgver"

  mkdir -p "submodules/openssl"
  tar xzf "$srcdir/clog-$_clog_commit.tar.gz" -C "submodules/clog" --strip-components=1
  tar xzf "$srcdir/googletest-$_googletest_commit.tar.gz" -C "submodules/googletest" --strip-components=1
  tar xzf "$srcdir/openssl-$_openssl_commit.tar.gz" -C "submodules/openssl" --strip-components=1
}

build() {
  cmake \
    -B "$pkgname-$pkgver/build" \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
    -Wno-dev
  make -C "$pkgname-$pkgver/build"
}

check() {
  make -C "$pkgname-$pkgver/build" test
}

package() {
	make -C "$pkgname-$pkgver/build" DESTDIR="$pkgdir/" install
  install -D -m644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
