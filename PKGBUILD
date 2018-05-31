# Maintainer: Gergely Imreh <imrehg@gmailcom>
# Contributor: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=ipget
pkgver=0.3.0
pkgrel=4
pkgdesc="wget for IPFS: retrieve files over IPFS and save them locally."
arch=('x86_64')
url="https://github.com/ipfs/ipget"
license=('MIT')
makedepends=('go' 'gx' 'gx-go' 'git')
optdepends=('go-ipfs: to use full potential of IPFS network'
            'go-pie: PIE enabled compilation (makedepend)')
# The versions of preloaded dependencies to install a fixed version
# while ipget is not able to pull them itself
_ver_go_floodsub="4e84ab6c81c4093552130a69fecfc5afe7c8dbf3"
_ver_go_libp2p_peer="aa0e03e559bde9d4749ad8e38595e15a6fe808fa"
_ver_go_multiaddr="123a717755e0559ec8fda308019cd24e0a37bb07"
_ver_go_multiaddr_net="97d80565f68c5df715e6ba59c2f6a03d1fc33aaf"
_ver_go_multipart_files="3be93d9f6b618f2b8564bfb1d22f1e744eabbae2"
_ver_tar_utils="8c6c8ba81d5c71fd69c0f48dbde4b2fb422b6dfc"
source=("https://github.com/ipfs/ipget/archive/v${pkgver}.tar.gz"
        "ipget_aur.patch"
        "go-floodsub.tar.gz::https://github.com/libp2p/go-floodsub/archive/${_ver_go_floodsub}.tar.gz"
        "go-libp2p-peer.tar.gz::https://github.com/libp2p/go-libp2p-peer/archive/${_ver_go_libp2p_peer}.tar.gz"
        "go-multiaddr.tar.gz::https://github.com/multiformats/go-multiaddr/archive/${_ver_go_multiaddr}.tar.gz"
        "go-multiaddr-net.tar.gz::https://github.com/multiformats/go-multiaddr-net/archive/${_ver_go_multiaddr_net}.tar.gz"
        "go-multipart-files.tar.gz::https://github.com/whyrusleeping/go-multipart-files/archive/${_ver_go_multipart_files}.tar.gz"
        "tar-utils.tar.gz::https://github.com/whyrusleeping/tar-utils/archive/${_ver_tar_utils}.tar.gz")
sha256sums=('19fcea7a4328133bdb7c263e27df4eef6a08365d21991e2344c28345d1f078f0'
            'dc7e1b74f786d1d13461635cc269a1a00acd13dbb530b07823ed82bd31bd8bd8'
            'd1433452e002367f4edd2b631dd66f7db4b80a8e5e8632a432d469646bffa587'
            '116f5f6a0e3e5694c862bfa7b3f500e22839ca043bb6622e5d202e36905c88e1'
            'dc7821f8b749e46f8bb8c08faf36e7079866ad7d0f9de711ed3dab5ad38118f4'
            '6f4f5989fac82b8bf25a0a5efa6dc36fba7904c8746fb8679205a8f0c73dbb7e'
            'a702f4481aab593650dd5fb4dd11709c7bc536fb57f392925ed22a154ebd5b10'
            '07373f1fa402af88ee1bcc461694a9fc96f29bd0619d54410f32e5fb783a6ff4')

prepare() {
    export GOPATH="${srcdir}"

    # Patching
    (cd "ipget-${pkgver}" ; patch -N < ../ipget_aur.patch)

    # Link the source to the right place for go
    mkdir -p "${srcdir}/src/github.com/ipfs/"
    if [ ! -e "${srcdir}/src/github.com/ipfs/ipget" ]; then
        ln -s "${srcdir}/ipget-${pkgver}" "${srcdir}/src/github.com/ipfs/ipget"
    fi

    msg "Getting dependencies"
    # Workaround for missing dependencies that block build in v0.3.0
    mkdir -p "src/github.com/libp2p"
    echo "> libp2p/go-floodsub"
    ln -sf "${srcdir}/go-floodsub-${_ver_go_floodsub}" "src/github.com/libp2p/go-floodsub"
    (cd src/github.com/libp2p/go-floodsub ; go get)
    echo "> libp2p/go-libp2p-peer"
    ln -sf "${srcdir}/go-libp2p-peer-${_ver_go_libp2p_peer}" "src/github.com/libp2p/go-libp2p-peer"
    (cd src/github.com/libp2p/go-libp2p-peer ; go get)
    mkdir -p "src/github.com/multiformats"
    echo "> multiformats/go-multiaddr"
    ln -sf "${srcdir}/go-multiaddr-${_ver_go_multiaddr}" "src/github.com/multiformats/go-multiaddr"
    (cd src/github.com/multiformats/go-multiaddr ; go get)
    echo "> multiformats/go-multiaddr-net"
    ln -sf "${srcdir}/go-multiaddr-net-${_ver_go_multiaddr_net}" "src/github.com/multiformats/go-multiaddr-net"
    (cd src/github.com/multiformats/go-multiaddr-net ; go get)
    mkdir -p "src/github.com/whyrusleeping"
    echo "> whyrusleeping/go-multipart-files"
    ln -sf "${srcdir}/go-multipart-files-${_ver_go_multipart_files}" "src/github.com/whyrusleeping/go-multipart-files"
    (cd src/github.com/whyrusleeping/go-multipart-files; go get)
    echo "> whyrusleeping/tar-utils"
    ln -sf "${srcdir}/tar-utils-${_ver_tar_utils}" "src/github.com/whyrusleeping/tar-utils"
    (cd src/github.com/whyrusleeping/tar-utils ; go get)

    # Getting all the other dependencies, that the code knows about anyways
    cd "${srcdir}/src/github.com/ipfs/ipget"
    gx --verbose install --global
}

build() {
    cd "${srcdir}/src/github.com/ipfs/ipget" || exit
    go build
}

package() {
  install -D "${srcdir}/ipget-${pkgver}/ipget" "${pkgdir}/usr/bin/ipget"
}
