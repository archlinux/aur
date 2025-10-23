# Maintainer: fam007e <faisalmoshiur+secpasswdmgmt@gmail.com>

pkgname=securepasswd_mgmt
pkgver=2025.10.24
pkgrel=1
pkgdesc="A secure, cross-platform password manager with TOTP support"
arch=('x86_64')
url="https://github.com/fam007e/SecurePasswd_MGMT"
license=('MIT')
depends=('libsodium' 'argon2' 'sqlcipher' 'qt6-base' 'openssl' 'curl' 'libcsv')
makedepends=('cmake' 'gcc')
install=securepasswd_mgmt.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/fam007e/SecurePasswd_MGMT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('80900a181a1e5f81550848dbdcbd9ae22ccaf987d180c553559abf82cf3ff25d')

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

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/securepasswd_mgmt.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=SecurePasswd MGMT
Comment=Password Manager with TOTP
Exec=securepasswd_gui
Icon=securepasswd_mgmt
Terminal=false
Categories=Utility;Security;
EOF

    # Install icon
    install -Dm644 "$srcdir/SecurePasswd_MGMT-${pkgver}/gui/icons/app_icon.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/securepasswd_mgmt.svg"
}
