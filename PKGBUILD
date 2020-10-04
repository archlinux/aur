# Maintainer: arshlinux
pkgname=react-deluge-git
pkgver=r9.77417a8
pkgrel=3
pkgdesc="The very first React Front-end for the Deluge BitTorrent client"
url="https://github.com/varyoo/react-deluge"
license=(GPL3)
arch=(x86_64)
depends=()
makedepends=(git npm electron)
optdepends=()
backup=()
source=("git+https://github.com/varyoo/react-deluge")
sha256sums=("SKIP")
options=(!strip)

pkgver() {
    cd "react-deluge"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/react-deluge"
    git submodule init
    git submodule update
    cd "${srcdir}/react-deluge/node-deluge-rpc"
    npm install
    cd "${srcdir}/react-deluge"
    npm install
    npm run package
}

package() {
    cd "${srcdir}/react-deluge"

    install -d ${pkgdir}/{opt/react-deluge,usr/bin}
    
    cd "${srcdir}/react-deluge/builds/react-deluge-linux-x64"
    cp -a * "${pkgdir}/opt/react-deluge"

    ln -s /opt/react-deluge/react-deluge "${pkgdir}/usr/bin"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}