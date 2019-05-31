# $Id$
# Maintainer: Joe Julian

pkgname=mgmt
pkgver=0.0.19
pkgrel=1
epoch=1
pkgdesc='Next generation config management.'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
pkggopath='github.com/purpleidea/mgmt'
url="https://${pkggopath}"
license=('GPL3')
makedepends=('augeas' 'go' 'go-md2man' 'go-tools' 'libpcap' 'libvirt' 'mercurial' 'ruby')
depends=('augeas' 'libvirt')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
backup=("etc/${pkgname}/${pkgname}.conf")

source=("git+${url}.git"
        'mgmt.service')
sha1sums=('SKIP'
          'ef0ecdb4d1c4441b884c7084b93806b52ec567c6')

prepare() {
    # extract tarball to path expected by go
    mkdir -p "${srcdir}/src/${pkggopath}"
    cd "${srcdir}/${pkgname}"

    git submodule --quiet update --init --recursive
    git archive --prefix="${pkggopath}/" --format="tar" HEAD | tar xf - -C "${srcdir}/src"
    git submodule foreach 'git archive --prefix="${path}/" --format="tar" HEAD | tar xvf - -C "'${srcdir}'/src/'${pkggopath}'"'

    # fetch dependencies
    export GOPATH="${srcdir}"
    export PATH=${GOPATH}/bin:${PATH}
    cd "${srcdir}/src/${pkggopath}"
    msg2 'installing go dependencies'
    go get github.com/blynn/nex
    # This build depends on the non-canonical go-bindata
    go get github.com/tmthrgd/go-bindata/go-bindata
    make bindata
    make deps
}

build() {
    export GOPATH="${srcdir}"
    export PATH=${GOPATH}/bin:${PATH}
    msg2 'building misc'
    cd "${srcdir}/src/${pkggopath}"
    PATH=$PATH:/usr/lib/go/pkg/tool/linux_amd64 \
        make build VERSION="${pkgver}" SVERSION="${pkgver}" PROGRAM="${pkgname}"
}

package() {
    msg2 'installing files'
    install -Dm644 "mgmt.service" "${pkgdir}/usr/lib/systemd/system/mgmt.service"

    cd "${srcdir}/src/${pkggopath}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "misc/bashrc.sh" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "misc/example.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
}
