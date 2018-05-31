# Maintainer: Gergely Imreh <imrehg@gmailcom>
# Contributor: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=ipget
pkgver=0.3.0
pkgrel=3
pkgdesc="wget for IPFS: retrieve files over IPFS and save them locally."
arch=('x86_64')
license=('MIT')
optdepends=('go-ipfs: to use full potential of IPFS network')
makedepends=('go>=2:1.7.0' 'gx>=0.6.0' 'gx-go>=1.1.0')
url="https://github.com/ipfs/ipget"
source=("https://github.com/ipfs/ipget/archive/v${pkgver}.tar.gz"
        "ipget_aur.patch")
sha256sums=('19fcea7a4328133bdb7c263e27df4eef6a08365d21991e2344c28345d1f078f0'
            'd1cc386ee0d8936f56ac7674749c9011af1d359c8cd4b1eb2bd44d0b5f82ec3d')

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
    msg "Patching"
    cd "ipget-${pkgver}" || exit
    patch -N < ../ipget_aur.patch
    ln -s "$(which gx)" "bin/gx"
    ln -s "$(which gx-go)" "bin/gx-go"

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
  install -D "${srcdir}/ipget-${pkgver}/ipget" "${pkgdir}/usr/bin/ipget"
}
