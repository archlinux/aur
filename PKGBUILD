# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname="snapdrop"
pkgver=2021.03.10
pkgrel=2
_githash="fad4632eb903ea6de9ecbec90df0ac6bd7410e68"
pkgdesc="A Progressive Web App for local file sharing"
url="https://github.com/RobinLinus/snapdrop"
license=("GPL3" "MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=(
    "https://github.com/RobinLinus/snapdrop/archive/${_githash}.tar.gz"
    "example-nginx.conf"
    "customise-server-host-addr.patch"
)
sha256sums=(
    "8886ae45aa5910606c8125e27cc589ae26fe162eedc11a396ca864f4788f2c2a"
    "a20b5daf7e2b49d0dc54e93911e22b2fea244ecf2ef3ee58960e3c2aacde586a"
    "c91545d65af2bfd6f09e05c7263b00340a98870ee9f3ded7447891e56b296fb6"
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
}
