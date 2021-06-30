# Maintainer: Jacek Szafarkiewicz <szafar at linux dot pl>

pkgname=sunshine
pkgver=0.8.0
pkgrel=1
pkgdesc="Open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield"
url="https://github.com/loki-47-6F-64/sunshine"
arch=('x86_64' 'i686')
license=('GPL3')

depends=('boost-libs' 'ffmpeg' 'openssl' 'libpulse' 'opus' 'libxtst' 'libx11' 'libxfixes' 'libevdev' 'libxcb' 'udev')
makedepends=('git' 'cmake' 'boost' 'make')

source=("$pkgname::git+https://github.com/loki-47-6F-64/sunshine.git#tag=v$pkgver"
        "udev.rules")
sha256sums=('SKIP'
            '5ce01689247cb01d3f119cac32c731607d99bb875dcdd39c92b547f76d2befa0')
install=sunshine.install

prepare() {
    cd "$pkgname"
    git submodule update --recursive --init
}

build() {
    export CFLAGS="${CFLAGS/-Werror=format-security/}"
    export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

    cmake \
        -S "$pkgname" \
        -B build \
        -Wno-dev \
        -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/$pkgname \
        -D SUNSHINE_ASSETS_DIR=/usr/share/$pkgname \

    make -C build
}

package() {
    install -Dm644 "$pkgname/assets/sunshine.conf" "$pkgdir/usr/share/$pkgname/sunshine.conf"
    install -Dm644 "$pkgname/assets/apps_linux.json" "$pkgdir/usr/share/$pkgname/apps_linux.json"
 
    install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm755 build/sunshine.service "$pkgdir/usr/lib/systemd/user/sunshine.service"

    install -Dm644 udev.rules "$pkgdir/usr/lib/udev/rules.d/85-$pkgname.rules"
}

# vim: ts=2 sw=2 et:
