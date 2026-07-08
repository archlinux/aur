# Maintainer: Saim <saim20 at github dot com>
pkgname=willow
pkgver=3.0.0
pkgrel=2
pkgdesc="Simple offline configurable voice assistant for gnome"
arch=('x86_64')
url="https://github.com/Saim20/willow"
license=('MIT')
depends=(
    'gnome-shell>=45'
    'sdbus-cpp'
    'jsoncpp'
    'libpulse'
    'ydotool'
    'curl'
)
makedepends=(
    'cmake'
    'git'
    'gcc'
)
optdepends=(
    'speech-dispatcher: TTS feedback via spd-say'
    'espeak: TTS fallback when speech-dispatcher is unavailable'
)
options=('!debug')
install=willow.install
source=("willow::git+https://github.com/Saim20/willow.git#tag=v3.0.0")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname/service"

    rm -rf build
    mkdir -p build
    cd build

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
    make -j$(nproc)
}

check() {
    cd "$srcdir/$pkgname/service/build"

    if [ ! -x "willow-service" ]; then
        printf "ERROR: willow-service binary not found or not executable!\n"
        return 1
    fi

    printf "✓ Binary checks passed\n"
}

package() {
    cd "$srcdir/$pkgname"

    cd service/build
    DESTDIR="$pkgdir" cmake --install . --component willow

    cd "$srcdir/$pkgname"

    install -Dm644 systemd/willow.service \
        "$pkgdir/usr/lib/systemd/user/willow.service"

    local ext_dir="$pkgdir/usr/share/gnome-shell/extensions/willow@saim"
    mkdir -p "$ext_dir"
    cp -r gnome-extension/willow@saim/* "$ext_dir/"

    glib-compile-schemas "$ext_dir/schemas/" || true

    install -Dm644 config.json \
        "$pkgdir/usr/share/willow/config.json"

    install -Dm644 context.json \
        "$pkgdir/usr/share/willow/context.json"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 SMART_WORKFLOWS.md "$pkgdir/usr/share/doc/$pkgname/SMART_WORKFLOWS.md"
    install -Dm644 SMART_WORKFLOWS_QUICKSTART.md "$pkgdir/usr/share/doc/$pkgname/SMART_WORKFLOWS_QUICKSTART.md"

    install -Dm755 download-model.sh "$pkgdir/usr/bin/willow-download-model"
}
