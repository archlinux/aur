# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=rocketchat-server-standalone
pkgver=7.12.1
pkgrel=1
pkgdesc="The Ultimate Open Source WebChat Platform"
arch=("any")
url="https://github.com/RocketChat/Rocket.Chat"
license=("MIT")
depends=("mongodb" "graphicsmagick" "curl" "python3")
provides=(rocketchat-server)
conflicts=(rocketchat-server)
makedepends=("nvm")
backup=("etc/rocketchat-server.conf")
install="${pkgname}.install"
source=("rocketchat-${pkgver}.tar::https://releases.rocket.chat/${pkgver}/download"
    "rocketchat-server-standalone.install"
    "rocketchat-server.conf"
    "rocketchat-user.conf"
"rocketchat.service")
sha512sums=('75c8e86df08e31a3db768684fe13ee4278927a2df13e9f28932869337151e94fd0e09eda5072f1edef04e257be3044a19c8a8c9d5d6bfaf835bbda0764106371'
            '5a981ef5f4a0ecb3e21a62c368c4086c683e9eefda94b195d01d0c64c03f3b10a960ef41b1fc0d55d20848aa4fcd6e8c774118ac2d6d53e3e5b3772fe872a1c2'
            '4ff8899a47612a81f73c1c6449fb30a7ddfb0b199756db7f73e0a3078cf818b88e481fd828296b148a348d137ae529ce591d6c2bd6b57ae9278188e715086b59'
            '0086f72f16a594116586d4b6783b104f7bba779e4f8e31e5988c7fa67e1c7d9fc95215d0a04c4f24c72b4183774a9768a29b05c828990125dd4a3379a69aa648'
            'e3eedb9d4949f9498bd3a1710983ce91b811f0907946d43b93eff3fda88bfd831097355b40e7ebe4db3c44e01525e81b317e339a82ffc1611ea141516a09ccb7')
_node=20

prepare() {
source /usr/share/nvm/init-nvm.sh
nvm install $_node
nvm use $_node
}
package() {
install -dm755 "${pkgdir}/usr/share/webapps/rocketchat-server"
cp -dr --preserve=mode --no-preserve=ownership ${srcdir}/bundle/* "${pkgdir}/usr/share/webapps/rocketchat-server"
pushd "${pkgdir}/usr/share/webapps/rocketchat-server/programs/server"
npm install --cache "${srcdir}/npm-cache"
popd
install -dm755 "${pkgdir}/usr/share/webapps/rocketchat-server/node"
cp -dr $(find ~/.nvm/versions/node/ -maxdepth 1 -type d -name "v${_node}.*" | sort -V | tail -n 1)/* "${pkgdir}/usr/share/webapps/rocketchat-server/node/"
install -Dm644 rocketchat-server.conf "${pkgdir}/etc/rocketchat-server.conf"
install -Dm644 rocketchat.service "${pkgdir}/usr/lib/systemd/system/rocketchat.service"
install -Dm644 rocketchat-user.conf "${pkgdir}/usr/lib/sysusers.d/rocketchat.conf"
}
