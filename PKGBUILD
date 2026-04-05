pkgname=sioyek-dev
pkgver=2.0.0.r1086.g719e2070
pkgrel=1
pkgdesc="PDF viewer for research papers and technical books (development branch)"
arch=('x86_64')
license=('GPL3')
url="https://github.com/ahrm/sioyek"
depends=(
    'harfbuzz'
    'qt6-base'
    'qt6-3d'
    'qt6-declarative'
    'qt6-svg'
    'qt6-speech'
    'zlib'
)
makedepends=('git' 'unzip')
optdepends=('qt6-wayland: Native Wayland (currently broken, uses XWayland by default)')
provides=('sioyek')
conflicts=('sioyek' 'sioyek-git')
source=("git+https://github.com/ahrm/sioyek.git#branch=development")
sha256sums=('SKIP')

pkgver() {
    cd sioyek
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd sioyek
    git submodule update --init --recursive mupdf
    sed -i '/#define LINUX_STANDARD_PATHS/s/\/\///' pdf_viewer/main.cpp
}

build() {
    cd sioyek

    make -C mupdf -j$(nproc) USE_SYSTEM_HARFBUZZ=yes HAVE_GLUT=no

    qmake6 "CONFIG+=linux_app_image" pdf_viewer_build_config.pro
    make -j$(nproc)
}

package() {
    cd sioyek

    install -Dm755 sioyek "$pkgdir/usr/lib/sioyek/sioyek"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/sioyek" << 'END'
#!/bin/sh
[ -n "$WAYLAND_DISPLAY" ] && export QT_QPA_PLATFORM=xcb
exec /usr/lib/sioyek/sioyek "$@"
END
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 resources/sioyek-icon-linux.png "$pkgdir/usr/share/pixmaps/sioyek-icon-linux.png"
    install -Dm644 resources/sioyek.desktop -t "$pkgdir/usr/share/applications/"
    install -dm755 "$pkgdir/usr/share/sioyek/shaders"
    cp -r pdf_viewer/shaders/* "$pkgdir/usr/share/sioyek/shaders/"
    install -Dm644 pdf_viewer/keys.config -t "$pkgdir/etc/sioyek/"
    install -Dm644 pdf_viewer/prefs.config -t "$pkgdir/etc/sioyek/"
    install -Dm644 resources/sioyek.1 -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 tutorial.pdf -t "$pkgdir/usr/share/sioyek/"
}
