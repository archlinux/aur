# Maintainer: DexterHaxxor <fox@dexterhaxxor.dev>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Peter Hatina <phatina AT gmail.com>
pkgname=glm-git
pkgver=1.0.0.r26.gf8df2f3e
pkgrel=1
pkgdesc="C++ mathematics library for 3D software based on the OpenGL Shading Language (GLSL) specification"
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
url="https://github.com/g-truc/glm"
makedepends=('cmake' 'git')
conflicts=('glm')
provides=('glm')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/glm"
    git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${srcdir}/glm" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -Wno-unsafe-buffer-usage"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    mkdir -p "$pkgdir/usr/share/doc"
    cp -vr "${srcdir}/glm/doc" "$pkgdir/usr/share/doc/glm"

    find $pkgdir -type f -exec chmod 644 {} \;
    find $pkgdir -type d -exec chmod 755 {} \;
    install -Dm644 "$srcdir/glm/copying.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
