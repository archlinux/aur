# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Max Falk <gmdfalk at gmail dot com>

pkgname=rocketchat-server
pkgver=6.1.3
pkgrel=1
pkgdesc="The Ultimate Open Source WebChat Platform"
arch=("any")
url="https://rocket.chat"
license=("MIT")
depends=("npm" "nodejs-lts-fermium" "mongodb" "graphicsmagick" "curl" "python3" "gcc")
makedepends=()
optdepends=()
backup=("etc/rocketchat/${pkgname}.conf")
CFLAGS=-std=gnu11
options=("!strip")

install="${pkgname}.install"
source=("rocketchat-${pkgver}.tar::https://releases.rocket.chat/${pkgver}/download"
    "rocketchat-server.install"
    "rocketchat-server.conf"
    "rocketchat-user.conf"
"rocketchat.service")
sha512sums=('44eeadba03700d41dabce0df1d08b3ba49ea61fc8fd76f82f4a405cf6c95d430fe8873109e9908f8932fb1e775b1b7bd3cb1ca240c1a538be3fe8f97f99a7e47'
            '6700fae043f59881c0c8821db176a8d9cbbf7f047bd48750dbcd7abd7c531831436f910a28745b40d4d2fcbb7d2081b5512a5ee23ea6355bb065fde3b0672edc'
            '4ff8899a47612a81f73c1c6449fb30a7ddfb0b199756db7f73e0a3078cf818b88e481fd828296b148a348d137ae529ce591d6c2bd6b57ae9278188e715086b59'
            '0086f72f16a594116586d4b6783b104f7bba779e4f8e31e5988c7fa67e1c7d9fc95215d0a04c4f24c72b4183774a9768a29b05c828990125dd4a3379a69aa648'
            'cc34ec625da591c2fc1cbee70e936484025071608530fddd554e72b94405b957cdf5d39b1b6614cac2d631c6cf644054b1b88997b792e95368a4b2fd43711d29')

package() {
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -dr --preserve=mode --no-preserve=ownership ${srcdir}/bundle/* "${pkgdir}/usr/share/${pkgname}"

    pushd "${pkgdir}/usr/share/${pkgname}/programs/server"
    npm install --cache "${srcdir}/npm-cache"
    popd

    install -Dm644 ${pkgname}.conf "${pkgdir}/etc/rocketchat/${pkgname}.conf"
    install -Dm644 rocketchat.service "${pkgdir}/usr/lib/systemd/system/rocketchat.service"
    install -Dm644 rocketchat-user.conf "${pkgdir}/usr/lib/sysusers.d/rocketchat.conf"
}
