# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
pkgname=msquic
pkgver=2.0.3
_clog_commit=9cbba2eea80d11faba83266c7f0f5e3b72a1f266
_googletest_commit=ae1b7ad4308249bfa928e65d1a33be117fc0992c
_openssl_commit=c3d4eb57dc74ba18ce70acee68b9a086ccc806aa
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
sha512sums=('c434111cb01eeae5e58901d15bfec3a544a07f38507f6676908c7804ec419ab6edc99ce33ea05c4565e6c2482acda73a5b95a51d3c9819a426f22f868dbe061b'
            'b4f69af2e3676570179590cd752ccb5b9d771b6221369214c16ab6d03763c498350474722fdfdc0b3937f689c4c8dd057ae46c58787a6277bf06f9dca592f270'
            '4a921ee7fdcb508ea1b59fad2bf20405a6f1dbd754ffd1dea4d1845805a14e8c67614dd3082f97a0da9c138751ca082fe55812f6f38b480b074bfe4c76d074bd'
            '69ddbe18961b563f2b6d045d8046ec875080e526d5615cda2c3b374b50ba72e0b7b36132bcd5cdda8bbcb7f8ee5ac43160cd2988740f8df4492435e5879d3266')
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
