# Maintainer: thankarezos
pkgname=libfprint-chipsailing-cs9711-git
pkgver=r1867.ec3ad6e
pkgrel=1
pkgdesc='Chipsailing CS9711 fingerprint driver based on libfprint'
arch=('x86_64')
url='https://github.com/thankarezos/libfprint-CS9711'
license=('LGPL-2.1-or-later')
depends=('glibc' 'gcc-libs' 'glib2' 'libgusb' 'opencv')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'doctest' 'gobject-introspection')
optdepends=('fprintd: fingerprint enrollment and verification')
provides=('libfprint' 'libfprint-2.so')
conflicts=('libfprint' 'cs9711-fingerprint-git')
source=('libfprint-CS9711::git+https://github.com/thankarezos/libfprint-CS9711.git#branch=cs9711-rebase')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/libfprint-CS9711"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Adapt only the build copy to Arch's OpenCV 5 pkg-config name.
    # Do not reapply the retry-delay patch: it is committed in the driver fork.
    if ! pkg-config --exists opencv4 && pkg-config --exists opencv5; then
        sed -i "s/dependency('opencv4', required: true)/dependency('opencv5', required: true)/" \
            "$srcdir/libfprint-CS9711/libfprint/sigfm/meson.build"
    fi
}

build() {
    arch-meson "$srcdir/libfprint-CS9711" "$srcdir/build" \
        -Ddrivers=cs9711 \
        -Dudev_rules=disabled -Dudev_hwdb=disabled \
        -Ddoc=false -Dinstalled-tests=false -Dgtk-examples=false
    meson compile -C "$srcdir/build"
}

check() {
    "$srcdir/build/libfprint/sigfm/sigfm-tests"
    meson test -C "$srcdir/build" --no-rebuild --print-errorlogs \
        fpi-device fpi-ssm fpi-assembling
}

package() {
    DESTDIR="$pkgdir" meson install -C "$srcdir/build" --no-rebuild
}
