# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
pkgname=msquic
pkgver=2.2.2
_clog_commit=ca6e640fbf7f53ec9de915f1f4d852c10d874d13
_googletest_commit=12a5852e451baabc79c63a86c634912c563d57bc
_openssl_commit=c3f5f36f5dadfa334119e940b7576a4abfa428c8
_openssl3_commit=be9e773e8926fc76166a45cfe5a19362372db90c
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
        "openssl-$_openssl_commit.tar.gz::https://github.com/quictls/openssl/archive/$_openssl_commit.tar.gz"
        "openssl3-$_openssl3_commit.tar.gz::https://github.com/quictls/openssl/archive/$_openssl3_commit.tar.gz")
sha512sums=('6fe01aa2f09e036d9ca6f8c1ff15a624c666bf45689cb532aedf08ea19898a59732aec2b8423e152e38fc5e6bfadebfc96b5b3d21c22df94cd0ade09308667d8'
            'd7c4190174d8c4690ec50bfe010a0d557f911d2a17802d8caf9f0b4e13d5e06ef0ae828fc4c355157ff860929f5f4bab42e248665c5d9678891b286ee9eaeaef'
            '3f1fe26d8bf3bfa7c7be8ad5e9a80239cf88066cd5ca234be574d1d4a243ceb3e4991cf7d15ccb159312735416fefa905e4e1ef1ff6defc39b3c14248ac62b86'
            '04197a62a2e5ae8e280f45dae5a72d039d5c139f775b9f91e54985949e07ce13e347b5f46463bb68b3e8e2d78314c10311a7c11e5b606bbb1ba7ef60bedd7c74'
            'a615090d5adce86f6333ac29d948680695ceaab4be18fdf9fbb4cd2390f20acf0aefdee1de42f0f4b2994327a668d3c0ecd9a85b04204616ea8f114e933d96fa')
noextract=("clog-$_clog_commit.tar.gz"
           "googletest-$_googletest_commit.tar.gz"
           "openssl-$_openssl_commit.tar.gz"
           "openssl3-$_openssl3_commit.tar.gz")

prepare() {
	cd "$pkgname-$pkgver"

  mkdir -p "submodules/openssl"
  tar xzf "$srcdir/clog-$_clog_commit.tar.gz" -C "submodules/clog" --strip-components=1
  tar xzf "$srcdir/googletest-$_googletest_commit.tar.gz" -C "submodules/googletest" --strip-components=1
  tar xzf "$srcdir/openssl-$_openssl_commit.tar.gz" -C "submodules/openssl" --strip-components=1
  tar xzf "$srcdir/openssl3-$_openssl3_commit.tar.gz" -C "submodules/openssl3" --strip-components=1
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
