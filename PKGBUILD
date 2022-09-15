# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
pkgname=msquic
pkgver=2.1.1
_clog_commit=a4f472c5fe2c8298c0ada2e24717458c45a17eb1
_googletest_commit=dd7a9d29a33de34836c345c3b753d4eba15c5f44
_openssl_commit=f105ac0bfdae1ce009b8fd86bc6d9f65e5576352
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
sha512sums=('b4478510a23cc767de376b15a937746dc2af1036ecfe1883619421e33801f135bd7ef8e933505a2ca324272c4a8cfc308cb54b666f0a69fac17a6486f08c6f5c'
            '593ebae4f2dd0f76c56b21b849cceaa9847bd2fc5eea511b3c6236c577e869134381e3d20a1511e7c649b4e305501f6689004880d8155fb0e3ce8cbe18e4f2c2'
            'ad897fa82f7b17c8ad59376e039b026b092973495a41b30527afd656714302bb05dd8564c77f18cf13a8e6f952df2e6483d79a25ee30cdfd9211078ecd1ee5cb'
            '97224db510d8e3a92f591484847a8e66280dcaa5305c9646715608c385dd7fea74e9cbd6e8f9663aa7f5b7e8d593e14cfcdbf3ea3f85f04030b9a62a2880a0c1')
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
