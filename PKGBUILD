# Maintainer: XZRAY <ardiansyahfahri024@gmail.com>
# Contributor: AliaCan Community

pkgname=alia-can
pkgver=RELEASE.r17.g4f9a1bc
pkgrel=2
pkgdesc="User-friendly shell alias manager with automatic backups, cross-shell support, and modern Qt6 GUI"
arch=('x86_64')
url="https://github.com/alia-can/alia-can"
license=('MIT')
depends=('qt6-base' 'gcc-libs' 'glibc')
makedepends=('cmake' 'clang' 'qt6-base' 'base-devel' 'git')
optdepends=(
  'bash: for bash shell support'
  'zsh: for zsh shell support'
  'fish: for fish shell support'
)
source=("git+https://github.com/alia-can/alia-can.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/alia-can"
    git describe --long --tags 2>/dev/null \
        | sed 's/^v//;s/-/.r/;s/-/./' \
        || printf "0.0.1.r%s.g%s" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "${srcdir}/alia-can"
}

build() {
    cd "${srcdir}/alia-can"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_COMPILER=clang
    cmake --build build --parallel
}
check() {
    cd "${srcdir}/alia-can/build"
    ctest --output-on-failure || true
}
package() {
    cd "${srcdir}/alia-can/build"
    DESTDIR="${pkgdir}" cmake --install .

    install -Dm644 "${srcdir}/alia-can/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/alia-can/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/alia-can.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=AliaCan
Comment=Shell Alias Manager with Auto-Backup
Exec=alia-can
Icon=alia-can
Categories=Utility;System;
Terminal=false
Keywords=alias;shell;bash;zsh;fish;manager;
EOF
}
