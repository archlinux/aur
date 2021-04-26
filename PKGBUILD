# Maintainer: Jacek Szafarkiewicz <szafar at linux dot pl>

pkgname=sunshine
pkgver=0.4.0
pkgrel=1
pkgdesc="Open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield"
url="https://github.com/loki-47-6F-64/sunshine"
arch=('x86_64' 'i686')
license=('GPL3')

depends=('boost-libs' 'ffmpeg' 'openssl' 'libpulse' 'opus' 'libxtst' 'libx11' 'libxfixes' 'libevdev' 'libxcb')
makedepends=('git' 'cmake' 'boost')

source=($pkgname::git+https://github.com/loki-47-6F-64/sunshine.git#tag=v$pkgver
        systemd-cleanup.patch::https://github.com/loki-47-6F-64/sunshine/pull/42.patch)
sha256sums=('SKIP'
            'f785ab0ac13f4d3bcd61cc20de1422d8006bb3eee444b9b2e38705d45eb7c28d')

prepare() {
    cd "$pkgname"
    git rm -f pre-compiled
    git submodule update --recursive --init
    
    patch -p1 -i ../systemd-cleanup.patch
}

build() {
    cmake \
        -S "$pkgname" \
        -B build \
        -Wno-dev \
        -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/$pkgname \
        -D SUNSHINE_ASSETS_DIR=/usr/share/$pkgname \

    make -C build
}

package() {
    install -Dm755 "$pkgname/assets/sunshine.conf" "$pkgdir/usr/share/$pkgname/sunshine.conf"
    install -Dm755 "$pkgname/assets/apps_linux.json" "$pkgdir/usr/share/$pkgname/apps_linux.json"
 
    install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm755 build/sunshine.service "$pkgdir/usr/lib/systemd/user/sunshine.service"
}

# vim: ts=2 sw=2 et:
