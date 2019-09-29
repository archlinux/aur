# Maintainer: Agorgianitis Loukas <agorglouk@gmail.com>
pkgname=glslviewer-git
pkgver=r753.8a4f4d7
pkgrel=1
pkgdesc="Live GLSL coding render for MacOS and Linux"
arch=('i686' 'x86_64')
url="https://github.com/patriciogonzalezvivo/glslViewer"
license=('BSD-3-Clause')
depends=('glfw')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=("$pkgname::git+https://github.com/patriciogonzalezvivo/glslViewer"
        'floating_wm_workaround.patch')
md5sums=('SKIP'
         '20c838d28b2390c9dd6fa3491c920edc')

pkgver() {
    cd "$srcdir/${pkgname%-VCS}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-VCS}"
    patch -p1 -i "$srcdir/floating_wm_workaround.patch"
}

build() {
    cd "$srcdir/${pkgname%-VCS}"
    make
}

package() {
    cd "$srcdir/${pkgname%-VCS}"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 bin/glslViewer "$pkgdir/usr/bin/glslviewer"
    install -D -m755 bin/glslLoader "$pkgdir/usr/bin/glslloader"
    mkdir -p "$pkgdir/usr/share/$pkgname/examples/"
    cp -R examples/* "$pkgdir/usr/share/$pkgname/examples/"
    chmod -R 755 "$pkgdir/usr/share/$pkgname/examples/"
}
