# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=glslviewer-git
pkgver=2.1.2.r77.g99a990a
pkgrel=1
pkgdesc="Console-based GLSL Sandbox for 2D/3D shaders"
arch=('i686' 'x86_64')
url="https://github.com/patriciogonzalezvivo/glslViewer"
license=('BSD-3-Clause')
depends=('glu' 'glfw-x11' 'ncurses' 'ffmpeg')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/patriciogonzalezvivo/glslViewer"
        "git+https://github.com/patriciogonzalezvivo/ada")
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule init
    git config submodule.deps/ada.url "$srcdir/ada"
    git submodule update
}

build() {
    cmake \
        -S "${pkgname%-git}" \
        -B build \
        -DCMAKE_INSTALL_PREFIX=/usr

    make -C build
}

package() {
    make install -C build DESTDIR="$pkgdir"

    install -D -m644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mkdir -p "$pkgdir/usr/share/$pkgname/examples/"
    cp -R "${pkgname%-git}"/examples/* "$pkgdir/usr/share/$pkgname/examples/"
    chmod -R 755 "$pkgdir/usr/share/$pkgname/examples/"
}
