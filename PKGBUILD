# Maintainer: a821
# Contributor: Stephen Martin <stephensrmmartin at gmail dot com>

pkgname=shiny-server-git
_pkgname=${pkgname%-git}
pkgver=1.5.20.1002.r0.gd9e391b
pkgrel=1
epoch=1
pkgdesc="Host Shiny applications over the web"
arch=('x86_64')
url="https://rstudio.com/shiny/server"
license=('AGPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('r')
makedepends=('git' 'cmake' 'wget' 'python')
optdepends=(
    'r-shiny: build interactive web apps with R' # AUR
    'r-rmarkdown: convert R markdown docs to various formats' # AUR
)
source=("git+https://github.com/rstudio/shiny-server"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=("SKIP"
            "1dc3401a3d87ef27ae026dc45bc374c2763b2819384ef8f326b4b7a12201ef42"
            "e56bfe2b7bf85fdc72d1080ab2d08a54c52928a0dc25cdbeff1302981aa18e30"
            "27538c6961fdb70f168be6d7c5754c474dd221dff0dcf639181d5803d6646a54")
backup=('etc/shiny-server/shiny-server.conf')
 
pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed -e 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd "${_pkgname}"
    mkdir -p build tmp
}
 
build() {
    cd "${_pkgname}"/tmp

    # install and download bundled Node.js
    ../external/node/install-node.sh

    # add bin PATH to reference node
    PATH="${srcdir}/${_pkgname}/bin":$PATH

    cmake -DCMAKE_INSTALL_PREFIX=/usr/share ..
    make
    cd ..
    ./bin/npm install
    ./bin/node ./ext/node/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js rebuild
}

package() {
    cd "${_pkgname}"/tmp
    make DESTDIR="${pkgdir}" install
    install -Dm644 ../config/default.config "${pkgdir}/etc/shiny-server/shiny-server.conf"

    cd ../..
    install -Dm644 ${_pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 ${_pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 ${_pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /usr/share/shiny-server/bin/shiny-server "${pkgdir}/usr/bin/shiny-server"
}

# vim: set ts=4 sw=4 et:
