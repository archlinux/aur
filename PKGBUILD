# Maintainer: thankarezos
# Based on packaging by Mahmud Farooque <farooque7@gmail.com>.
# Driver source remains archeYR's fork; url tracks the packaging project.
pkgname=cs9711-fingerprint-git
pkgver=r1866.02b285c
pkgrel=1
pkgdesc="Chipsailing CS9711 USB fingerprint scanner driver with 1500ms retry patch"
arch=('x86_64' 'aarch64')
url="https://github.com/thankarezos/chipsailing-cs9711-fingerprint-linux"
license=('LGPL-2.1-or-later')
depends=('glib2' 'libgusb' 'opencv')

provides=('libfprint' 'libfprint-2.so=2-64')

conflicts=('libfprint' 'libfprint-cs9711-rebase-git' 'cs9711-fingerprint')

optdepends=('fprintd: fingerprint enrollment and verification')
makedepends=('git' 'meson' 'ninja' 'pixman' 'cairo' 'openssl'
             'doctest' 'gobject-introspection' 'cmake')
source=("git+https://github.com/archeYR/libfprint-CS9711.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/libfprint-CS9711"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/libfprint-CS9711"
    # Apply 1500ms retry delay patch
    sed -i 's/#define CS9711_DEFAULT_RESET_SLEEP.*/#define CS9711_DEFAULT_RESET_SLEEP  1500/' \
        libfprint/drivers/cs9711/cs9711.c
    # Make doctest optional (only needed for tests)
    sed -i "s/dependency('doctest', required: true)/dependency('doctest', required: false)/" \
        libfprint/sigfm/meson.build
    sed -i '/^sigfm_tests/i if doctest.found()' libfprint/sigfm/meson.build
    echo "endif" >> libfprint/sigfm/meson.build
    # OpenCV version-resilient (issue #2) — inline copy of helpers/opencv-flex.sh:
    # opencv4 -> opencv5 -> opencv pkg-config names, then CMake's OpenCV, so a
    # distro OpenCV 4 -> 5 bump (CachyOS 2026-07) doesn't fail the build.
    if ! grep -q "method: 'cmake'" libfprint/sigfm/meson.build; then
        sed -i "s|opencv = dependency('opencv4', required: true)|opencv = dependency('opencv4', required: false)\nif not opencv.found()\n  opencv = dependency('opencv5', required: false)\nendif\nif not opencv.found()\n  opencv = dependency('opencv', required: false)\nendif\nif not opencv.found()\n  opencv = dependency('OpenCV', method: 'cmake', required: true)\nendif|" \
            libfprint/sigfm/meson.build
    fi
}

build() {
    cd "$srcdir/libfprint-CS9711"
    meson setup builddir \
        --prefix=/usr \
        -Ddrivers=cs9711 \
        -Dudev_rules=disabled \
        -Dudev_hwdb=disabled \
        -Ddoc=false \
        -Dinstalled-tests=false \
        -Dgtk-examples=false
    meson compile -C builddir
}

package() {
    cd "$srcdir/libfprint-CS9711"
    DESTDIR="$pkgdir" meson install -C builddir
}
