# Maintainer: Zachary Kessler <zacksynack@gmail.com>
pkgname=doubletap-git
pkgver=r12.595b976
pkgrel=1
pkgdesc="SOCD-cleaning keyboard input daemon for rhythm games (osu!)"
arch=('x86_64' 'aarch64')
url="https://github.com/zakack/doubletap"
license=('MIT')
depends=('libevdev' 'libyaml' 'libpipewire')
makedepends=('git' 'cmake' 'pkgconf')
optdepends=('realtime-privileges: SCHED_FIFO realtime scheduling for the daemon'
            'pipewire: click sound playback')
provides=('doubletap')
conflicts=('doubletap')
install=doubletap.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S "$pkgname" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/LICENSE.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
