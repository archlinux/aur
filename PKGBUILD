# Maintainer: Dionicio3 <dionicio3@dionicio3.com>
pkgname=cc3dsfs-git
pkgver=r294.5d0c49a
pkgrel=1
epoch=
pkgdesc="A multi-platform capture and display program for the https://3dscapture.com/ N3DSXL, 3DS and DS Capture Cards written in C++. Also supports IS Nitro devices."
arch=('x86_64')
url="https://github.com/Lorenzooone/cc3dsfs"
license=('MIT')
makedepends=('cmake' 'gcc' 'git' 'sfml')
conflicts=('libftd3xx' 'cc3dsfs' 'cc3dsfs-bin')
source=('git+https://github.com/Lorenzooone/cc3dsfs'
        'cc3dsfs.desktop')
sha256sums=('SKIP'
            'd8d1cc113946b1e2c0263dfed7543f0b2498c8685515550cc9ee8fba755536d0')

pkgver() {
    cd "$srcdir"/cc3dsfs
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/cc3dsfs"
    LC_ALL=C.UTF-8 cmake -B build -DCMAKE_BUILD_TYPE=Release ; LC_ALL=C.UTF-8 cmake --build build --config Release
}

package() {
    install -Dm755 "$srcdir"/cc3dsfs/build/bin/cc3dsfs "$pkgdir"/usr/bin/cc3dsfs

    # Desktop file
    install -Dm644 "$srcdir"/cc3dsfs.desktop "$pkgdir"/usr/share/applications/cc3dsfs.desktop

    # install udev rules
    cd "$srcdir"/cc3dsfs/usb_rules/
    for f in *.rules; do \
        install -Dm755 ${f} "${pkgdir}"/usr/lib/udev/rules.d/${f}; \
    done
}
