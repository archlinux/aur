# $Id$
# Maintainer: Joe Julian

pkgname=mgmt
pkgver=0.0.5
pkgrel=1
epoch=1
pkgdesc='Next generation config management.'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
pkggopath='github.com/purpleidea/mgmt'
url="https://${pkggopath}"
license=('AGPL3')
makedepends=('go' 'go-md2man' 'go-tools' 'mercurial')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
backup=("etc/${pkgname}/${pkgname}.conf")

source=("${url}/archive/${pkgver}.tar.gz"
        'mgmt.service')
sha1sums=('feec085db00e4727e37f8c69a35dcb732ebf6e46'
          'ef0ecdb4d1c4441b884c7084b93806b52ec567c6')
 noextract=("${pkgver}.tar.gz")

prepare() {
    # extract tarball to path expected by go
    mkdir -p "${srcdir}/src"
    cd "${srcdir}"
    tar xf "${pkgver}.tar.gz" --transform="s@^${pkgname}-${pkgver}@src/${pkggopath}@"

    # fetch dependencies
    export GOPATH="${srcdir}"
    cd "${srcdir}/src/${pkggopath}"
    msg2 'installing go dependencies'
    go get -d ./...
}

build() {
    export GOPATH="${srcdir}"
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
