# Maintainer: Your Name <lucyrandall@helltop.net>
pkgname=aee-anoraktrend-git
pkgver=2.2.22.r25.c77b92a
pkgrel=1
pkgdesc="Another Easy Editor - a simple, easy to use terminal-based screen oriented editor"
arch=('x86_64' 'i686' 'aarch64')
url="https://helltop.net/projects"
license=('custom:Artistic')
depends=('libncursesw.so')
makedepends=('git' 'cmake' 'make')
provides=('aee')
conflicts=('aee' 'aee-git')
source=("git+https://github.com/anoraktrend/aee.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/aee"
    printf "2.2.22.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/aee"
    
    # Create build directory
    mkdir -p build
    cd build
    
    # Configure with CMake, disabling format-security warnings
    CFLAGS="$CFLAGS -Wno-format-security -Wno-unused-result" \
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_FLAGS="-Wno-format-security -Wno-unused-result"
    
    # Build the project
    make
}

package() {
    cd "$srcdir/aee/build"
    
    # Install using CMake
    make DESTDIR="$pkgdir" install
    
    # Install license
    install -Dm644 "$srcdir/aee/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 "$srcdir/aee/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/aee/aee.i18n.guide" \
        "$pkgdir/usr/share/doc/$pkgname/aee.i18n.guide"
}
