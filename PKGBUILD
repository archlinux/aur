# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Edgar Luque <git@edgarluque.com>

pkgname=ddnet-git
pkgver=18.0.1.r0.g4f18816b2
pkgrel=1
pkgdesc="A Teeworlds modification with a unique cooperative gameplay."
arch=('x86_64')
url="https://ddnet.org"
license=('CC-BY-SA-3.0' 'Zlib' 'OFL-1.1' 'Bitstream-Vera' 'LicenseRef-Arev')
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
makedepends=('git' 'cargo' 'cmake' 'ninja' 'python' 'vulkan-headers' 'glslang' 'spirv-tools' 'discord-game-sdk')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
            'discord-game-sdk: Enable rich presence in Discord desktop client.')
provides=('ddnet')
conflicts=('ddnet')
backup=('usr/share/ddnet/data/autoexec_server.cfg')
source=("git+https://github.com/ddnet/ddnet"
        'ddnet-server.service' 'ddnet-sysusers.conf' 'ddnet-tmpfiles.conf'
        # Licenses extracted from license.txt
        "Zlib.txt" "OFL-1.1.txt" "Bitstream-Vera.txt" "Arev.txt")
sha256sums=('SKIP'
            '9377a9d7c87abae166c8fa98cd79a61c74482f80f80bc930ae043349e9a84965'
            '70034f237270b38bf312238a26cfd322e212ca5714bfea4ae91e80c639ce8738'
            '043452f4de3c86d903973009bb3e59b3492a6669b86d0b1410e59a1476a87369'
            '813b73656256b588f955256cf3379d8a775b4a9c72783510982af04ff5d5796e'
            'cc97348511b4e9bf6e2f0ee6fbc329fb001e6f1049401026cf212d091390d900'
            'da8e7278deea5296b56374fd048f8bc975be069a526d0119c9d32aa555558b4c'
            '8acb2a0b769d9e0b3ae9f35c12110189c82790af3254419f86c46105bca70075')

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
        -DDISCORD=ON                \
        -DDISCORD_DYNAMIC=ON        \
        -DVIDEORECORDER=ON          \
        -DUPNP=ON                   \
        -DMYSQL=ON                  \
        -DTEST_MYSQL=OFF            \
        -GNinja
    ninja
}

check() {
    export GTEST_FILTER='-Net.Ipv4AndIpv6Work'
    ninja run_tests -C build
}

package() {
    DESTDIR="$pkgdir" ninja install -C build
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname/" 'Zlib.txt' 'OFL-1.1.txt' 'Bitstream-Vera.txt' 'Arev.txt'
    install -vDm644 "$srcdir/ddnet-server.service" "$pkgdir/usr/lib/systemd/system/ddnet-server.service"
    install -vDm644 "$srcdir/ddnet-sysusers.conf"  "$pkgdir/usr/lib/sysusers.d/ddnet.conf"
    install -vDm644 "$srcdir/ddnet-tmpfiles.conf"  "$pkgdir/usr/lib/tmpfiles.d/ddnet.conf"
    sed -i "$pkgdir/usr/share/ddnet/data/autoexec_server.cfg" \
        -e '/sv_test_cmds/s/1/0/' \
        -e 's/myServerconfig.cfg/autoexec_server_maps.cfg/'
}
