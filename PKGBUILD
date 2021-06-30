# Maintainer: Jacek Szafarkiewicz <szafar at linux dot pl>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=sunshine
pkgname=${_pkgname}-git
pkgver=0.8.0.488.545cca7
pkgrel=1
pkgdesc="Open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield"
url="https://github.com/loki-47-6F-64/sunshine"
arch=('x86_64' 'i686')
license=('GPL3')

depends=('boost-libs' 'ffmpeg' 'openssl' 'libpulse' 'opus' 'libxtst' 'libx11' 'libxfixes' 'libevdev' 'libxcb' 'udev')
makedepends=('git' 'cmake' 'boost' 'make')

provides=('sunshine')
conflicts=("sunshine")

source=("$_pkgname::git+https://github.com/loki-47-6F-64/sunshine.git"
        "udev.rules")
sha256sums=('SKIP'
            '5ce01689247cb01d3f119cac32c731607d99bb875dcdd39c92b547f76d2befa0')
install=sunshine.install

pkgver() {
    cd "$_pkgname"
    printf "%s.%s.%s" "$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git submodule update --recursive --init
}

build() {
    export CFLAGS="${CFLAGS/-Werror=format-security/}"
    export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

    cmake \
        -S "$_pkgname" \
        -B build \
        -Wno-dev \
        -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/$_pkgname \
        -D SUNSHINE_ASSETS_DIR=/usr/share/$_pkgname \

    make -C build
}

package() {
    install -Dm644 "$_pkgname/assets/sunshine.conf" "$pkgdir/usr/share/$_pkgname/sunshine.conf"
    install -Dm644 "$_pkgname/assets/apps_linux.json" "$pkgdir/usr/share/$_pkgname/apps_linux.json"
 
    install -Dm755 build/$_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm755 build/sunshine.service "$pkgdir/usr/lib/systemd/user/sunshine.service"

    install -Dm644 udev.rules "$pkgdir/usr/lib/udev/rules.d/85-$_pkgname.rules"
}

# vim: ts=2 sw=2 et: