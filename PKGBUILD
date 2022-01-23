# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname="snapdrop"
pkgver=2022.1.6
pkgrel=3
_githash="bd3d13d48a754121b53aa91034579466937ff2e3"
pkgdesc="A Progressive Web App for local file sharing"
url="https://github.com/RobinLinus/snapdrop"
license=("GPL3" "MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=(
    "https://github.com/RobinLinus/snapdrop/archive/${_githash}.tar.gz"
    "customise-server-host-addr.patch"
    "example-nginx.conf"
    "snapdrop.service"
)
sha256sums=(
    "a447d1071a2f9e094af95534522b9dae354e8f0bf842817b32165ca062c01ba5"
    "c91545d65af2bfd6f09e05c7263b00340a98870ee9f3ded7447891e56b296fb6"
    "9bd2e544a4c3ac7e3d865881c02bb5c829aef5f34302f7a082c9724d85145930"
    "5d7f5efe54122221785ceeaa0b92873ce618a7d4160abf14b41c196bed2953db"
)

prepare() {
    cd "snapdrop-${_githash}"
    patch -p1 < "${srcdir}/customise-server-host-addr.patch"

    cd "server"
    npm ci
}

package() {
    cd "snapdrop-${_githash}"

    install -dm755 "${pkgdir}/usr/share/snapdrop"
    cp -r client server "${pkgdir}/usr/share/snapdrop/"

    install -dm755 "${pkgdir}/usr/share/doc"
    cp -r docs "${pkgdir}/usr/share/doc/snapdrop"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/snapdrop/README.md"
    install -Dm644 "${srcdir}/example-nginx.conf" "${pkgdir}/usr/share/doc/snapdrop/example-nginx.conf"

    chmod -R 0000 "${pkgdir}/usr/share"
    chmod -R u+rwX,g+rX,o+rX "${pkgdir}/usr/share"

    install -Dm644 "${srcdir}/snapdrop.service" "${pkgdir}/usr/lib/systemd/system/snapdrop.service"
}
