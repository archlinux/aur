# Maintainer: Gergely Imreh <imrehg@gmailcom>
# Contributor: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=ipget
pkgver=0.3.0
pkgrel=2
pkgdesc="wget for IPFS: retrieve files over IPFS and save them locally."
arch=('x86_64')
license=('MIT')
optdepends=('go-ipfs: to use full potential of IPFS network')
makedepends=('go')
url="https://github.com/ipfs/ipget"
source=("https://github.com/ipfs/ipget/archive/v${pkgver}.tar.gz"
        "ipget_version.patch")
sha256sums=('19fcea7a4328133bdb7c263e27df4eef6a08365d21991e2344c28345d1f078f0'
            'dc7e1b74f786d1d13461635cc269a1a00acd13dbb530b07823ed82bd31bd8bd8')

build() {
    # Workaround for missing dependencies that block build in v0.3.0
    msg "Installing extra dependencies"
    _deps=('github.com/libp2p/go-floodsub'
           'github.com/libp2p/go-libp2p-peer'
           'github.com/multiformats/go-multiaddr'
           'github.com/multiformats/go-multiaddr-net'
           'github.com/whyrusleeping/go-multipart-files'
           'github.com/whyrusleeping/tar-utils')
    for dep in ${_deps[@]}; do
        echo "> $dep"
        GOPATH="${srcdir}" go get "${dep}"
    done
    # Patching versio
    msg "Patching"
    cd "ipget-${pkgver}" || exit
    patch -N < ../ipget_version.patch
    # Set up build
    mkdir -p "${srcdir}/src/github.com/ipfs/"
    if [ ! -e "${srcdir}/src/github.com/ipfs/ipget" ]; then
        ln -s "${srcdir}/ipget-${pkgver}" "${srcdir}/src/github.com/ipfs/ipget"
    fi
    cd "${srcdir}/src/github.com/ipfs/ipget" || exit
    msg "Building"
    GOPATH="${srcdir}" make build
}

package() {
  install -Dm755 "${srcdir}/ipget-${pkgver}/ipget" "${pkgdir}/usr/bin/ipget"
}
