# Maintainer: Jacek Szafarkiewicz <szafar at linux dot pl>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=sunshine-git
pkgver=0.11.1.751.e4c9c29
pkgrel=1
pkgdesc="Open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield"
url="https://github.com/loki-47-6F-64/sunshine"
arch=('x86_64' 'i686')
license=('GPL3')

depends=('boost-libs' 'ffmpeg' 'openssl' 'libpulse' 'opus' 'libxtst' 'libx11' 'libxfixes' 'libevdev' 'libxcb' 'libxrandr' 'udev')
makedepends=('git' 'cmake' 'boost' 'make')

provides=('sunshine')
conflicts=("sunshine")

source=("$pkgname::git+https://github.com/loki-47-6F-64/sunshine.git"
        "udev.rules")
sha256sums=('SKIP'
            '5ce01689247cb01d3f119cac32c731607d99bb875dcdd39c92b547f76d2befa0')
install=sunshine.install

_assets_path=/usr/share/sunshine

pkgver() {
    cd "$pkgname"
    printf "%s.%s.%s" "$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
        -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/sunshine \
        -D SUNSHINE_ASSETS_DIR="$_assets_path"

    make -C build
}

package() {
    pushd "$pkgname/assets"
        install -Dvm644 sunshine.conf "$pkgdir/$_assets_path/sunshine.conf"
        install -Dvm644 apps_linux.json "$pkgdir/$_assets_path/apps_linux.json"

        find web shaders/opengl -type f -print0 | xargs -0 -I {} install -Dvm644 {} "$pkgdir/$_assets_path/{}"
    popd

    pushd build
        install -Dvm755 sunshine "$pkgdir/usr/bin/sunshine"
        install -Dvm644 sunshine.service "$pkgdir/usr/lib/systemd/user/sunshine.service"
    popd

    install -Dvm644 udev.rules "$pkgdir/usr/lib/udev/rules.d/85-sunshine.rules"
}

# vim: ts=2 sw=2 et:
