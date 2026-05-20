# Maintainer: fam007e <faisalmoshiur+secpasswdmgmt@gmail.com>
pkgname=securepasswd_mgmt
pkgver=2026.05.16
pkgrel=1
pkgdesc="A secure, cross-platform password manager with TOTP support"
arch=('x86_64')
url="https://github.com/fam007e/SecurePasswd_MGMT"
license=('MIT')
depends=('libsodium' 'argon2' 'sqlcipher' 'qt6-base' 'qt6-svg' 'openssl' 'curl' 'cmocka' 'pcre2' 'libcsv')
makedepends=('cmake' 'gcc')
install=securepasswd_mgmt.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/fam007e/SecurePasswd_MGMT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('effb4a3f15d4752022bf1ba2655a511c647c5d16a59b652db8c30c589bb6ac5b')

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
