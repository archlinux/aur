# Maintainer: Chiller Dragon <chillerdragon@gmail.com>

pkgname=term-ux-git
pkgver=16.0.r421.g17c478731
pkgrel=1
pkgdesc="A custom Teeworlds curses client based on chillerbot-ux (ddnet based)."
arch=('x86_64')
url="chillerbot.github.io/"
license=('custom:BSD' 'CCPL:by-nc-sa')
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'pnglite' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs')
makedepends=('git' 'cmake' 'ninja' 'python')
checkdepends=('gmock')
provides=('term-ux')
conflicts=('term-ux')
source=('git+https://github.com/chillerbot/chillerbot-ux')
sha256sums=('SKIP')

pkgver() {
    cd chillerbot-ux
    v=$(echo '#include "src/game/version.h"
              #include <iostream>
              int main() {
                  std::cout << GAME_RELEASE_VERSION << std::endl;
              }' | g++ -xc++ - && ./a.out)
    _commit=$(git log --pretty=oneline | grep "Version $v" | cut -d' ' -f1)
    r=$(git log $_commit..HEAD --pretty=oneline | wc -l)
    h=$(git rev-parse --short HEAD)
    printf $v.r$r.g$h
}

build() {
    mkdir -p build
    cd build
    cmake ../chillerbot-ux          \
        -DCMAKE_BUILD_TYPE=Release  \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAUTOUPDATE=OFF            \
        -DHEADLESS_CLIENT=ON        \
        -DCURSES_CLIENT=ON          \
        -DVULKAN=OFF                \
        -DSERVER=OFF                \
        -DANTIBOT=OFF               \
        -DVIDEORECORDER=OFF         \
        -DUPNP=ON                   \
        -DMYSQL=OFF                 \
        -GNinja
    ninja
}

check() {
    ninja run_tests -C build
}

package() {
    DESTDIR="$pkgdir" ninja install -C build
}

