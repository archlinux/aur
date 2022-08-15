# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Edgar Luque <git@edgarluque.com>

pkgname=ddnet-git
pkgver=16.2.2.r108.gb0a44546d
pkgrel=1
pkgdesc="A Teeworlds modification with a unique cooperative gameplay."
arch=('x86_64')
url="https://ddnet.tw"
license=('custom:BSD' 'CCPL:by-nc-sa')
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
makedepends=('git' 'cmake' 'ninja' 'python' 'vulkan-headers' 'glslang' 'spirv-tools')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.')
provides=('ddnet')
conflicts=('ddnet')
backup=('usr/share/ddnet/data/autoexec_server.cfg')
source=("git+https://github.com/ddnet/ddnet"
        'ddnet-server.service' 'ddnet-sysusers.conf' 'ddnet-tmpfiles.conf')
sha256sums=('SKIP'
            '9377a9d7c87abae166c8fa98cd79a61c74482f80f80bc930ae043349e9a84965'
            '70034f237270b38bf312238a26cfd322e212ca5714bfea4ae91e80c639ce8738'
            '043452f4de3c86d903973009bb3e59b3492a6669b86d0b1410e59a1476a87369')

pkgver() {
    cd ddnet
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
    cmake ../ddnet                  \
        -DCMAKE_BUILD_TYPE=Release  \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAUTOUPDATE=OFF            \
        -DANTIBOT=ON                \
        -DVIDEORECORDER=ON          \
        -DUPNP=ON                   \
        -DMYSQL=ON                  \
        -GNinja
    ninja
}

check() {
    ninja run_tests -C build
}

package() {
    DESTDIR="$pkgdir" ninja install -C build
    install -vDm644 "$srcdir/ddnet/license.txt"    "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -vDm644 "$srcdir/ddnet-server.service" "$pkgdir/usr/lib/systemd/system/ddnet-server.service"
    install -vDm644 "$srcdir/ddnet-sysusers.conf"  "$pkgdir/usr/lib/sysusers.d/ddnet.conf"
    install -vDm644 "$srcdir/ddnet-tmpfiles.conf"  "$pkgdir/usr/lib/tmpfiles.d/ddnet.conf"
    sed -i "$pkgdir/usr/share/ddnet/data/autoexec_server.cfg" \
        -e '/sv_test_cmds/s/1/0/' \
        -e 's/myServerconfig.cfg/autoexec_server_maps.cfg/'
}
