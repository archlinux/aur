# Maintainer: redfish <redfish@galactica.pw>
# Contributor: Gergely Imreh <imrehg@gmailcom>
# Contributor: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=ipget
pkgver=0.6.0
pkgrel=1
pkgdesc="wget for IPFS: retrieve files over IPFS and save them locally."
arch=('x86_64')
url="https://github.com/ipfs/ipget"
license=('MIT')
makedepends=('go' 'gx' 'gx-go' 'git')
optdepends=('go-ipfs: to use full potential of IPFS network'
            'go-pie: PIE enabled compilation (makedepend)')
source=("https://github.com/ipfs/ipget/archive/v${pkgver}.tar.gz")

prepare() {
    export GOPATH="${srcdir}"

    # Link the source to the right place for go
    mkdir -p "${srcdir}/src/github.com/ipfs/"
    if [ ! -e "${srcdir}/src/github.com/ipfs/ipget" ]; then
        ln -s "${srcdir}/ipget-${pkgver}" "${srcdir}/src/github.com/ipfs/ipget"
    fi
}

build() {
    cd "${srcdir}/src/github.com/ipfs/ipget"
    go build

    # For some reason file creation mode in Go lacks write permission,
    # which breaks package re-builds (even with -C)
    chmod -R o+w "${srcdir}"
}

package() {
  install -D "${srcdir}/${pkgname}-${pkgver}/ipget" "${pkgdir}/usr/bin/ipget"
}

sha256sums=('ffa3a532f7aad74cb442376590e60bdcceba0cfc115ad72d11400a96f768b11f')
