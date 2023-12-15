# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Edgar Luque <git@edgarluque.com>

pkgname=ddnet
pkgver=17.4.1
pkgrel=1
pkgdesc="A Teeworlds modification with a unique cooperative gameplay."
arch=('x86_64')
url="https://ddnet.org"
license=('custom:BSD' 'CCPL:by-nc-sa')
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
makedepends=('cargo' 'cmake' 'ninja' 'python' 'vulkan-headers' 'glslang' 'spirv-tools' 'discord-game-sdk')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
            'discord-game-sdk: Enable rich presence in Discord desktop client.')
backup=('usr/share/ddnet/data/autoexec_server.cfg')
source=("https://ddnet.org/downloads/DDNet-$pkgver.tar.xz"
        "ddnet-server.service" "ddnet-sysusers.conf" "ddnet-tmpfiles.conf")
sha256sums=('72629573e2cccf8eb5e80eb4fb5828222d5a28607fe1b3ae33a804569c7fe1e2'
            '9377a9d7c87abae166c8fa98cd79a61c74482f80f80bc930ae043349e9a84965'
            '70034f237270b38bf312238a26cfd322e212ca5714bfea4ae91e80c639ce8738'
            '043452f4de3c86d903973009bb3e59b3492a6669b86d0b1410e59a1476a87369')

build() {
    mkdir -p build
    cd build
    cmake ../DDNet-$pkgver          \
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

# Net.Ipv4AndIpv6Work fails when building in clean chroot, hence disabled
check() {
    export GTEST_FILTER='-Net.Ipv4AndIpv6Work'
    ninja run_tests -C build
}

package() {
    DESTDIR="$pkgdir" ninja install -C build
    install -vDm644 DDNet-$pkgver/license.txt      "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -vDm644 "$srcdir/ddnet-server.service" "$pkgdir/usr/lib/systemd/system/ddnet-server.service"
    install -vDm644 "$srcdir/ddnet-sysusers.conf"  "$pkgdir/usr/lib/sysusers.d/ddnet.conf"
    install -vDm644 "$srcdir/ddnet-tmpfiles.conf"  "$pkgdir/usr/lib/tmpfiles.d/ddnet.conf"
    sed -i "$pkgdir/usr/share/ddnet/data/autoexec_server.cfg" \
        -e '/sv_test_cmds/s/1/0/' \
        -e 's/myServerconfig.cfg/autoexec_server_maps.cfg/'
}
