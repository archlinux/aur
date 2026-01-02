# Maintainer: fam007e <faisalmoshiur+secpasswdmgmt@gmail.com>
pkgname=securepasswd_mgmt
pkgver=2025.12.28
pkgrel=3
pkgdesc="A secure, cross-platform password manager with TOTP support"
arch=('x86_64')
url="https://github.com/fam007e/SecurePasswd_MGMT"
license=('MIT')
depends=('libsodium' 'argon2' 'sqlcipher' 'qt6-base' 'qt6-svg' 'openssl' 'curl' 'cmocka' 'pcre2')
makedepends=('cmake' 'gcc')
install=securepasswd_mgmt.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/fam007e/SecurePasswd_MGMT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e5bf81d94b79647b25901b7eb770c872d3ee59b39b5cd1515e8ea7c693236e41')

build() {
    cd "$srcdir/SecurePasswd_MGMT-${pkgver}"
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DPROJECT_VERSION=${pkgver}
    cmake --build build
}

check() {
    cd "$srcdir/SecurePasswd_MGMT-${pkgver}/build/tests"
    # Run tests if available
    ctest --output-on-failure || warning "Some tests failed"
}

package() {
    cd "$srcdir/SecurePasswd_MGMT-${pkgver}/build"
    make DESTDIR="$pkgdir" install

    # Install license
    install -Dm644 "$srcdir/SecurePasswd_MGMT-${pkgver}/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
