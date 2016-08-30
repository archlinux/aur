# $Id$
# Maintainer: Joe Julian

pkgname=mgmt
pkgver=0.0.3
pkgrel=1
epoch=1
pkgdesc='Next generation config management.'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://github.com/purpleidea/mgmt'
license=('AGPL3')
makedepends=('go' 'go-md2man' 'go-tools' 'mercurial')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
backup=("etc/${pkgname}/${pkgname}.conf")

source=('https://github.com/purpleidea/mgmt/archive/0.0.3.tar.gz'
        'mgmt.service')
sha1sums=('8f8788683a04653a704725ec5e63b126c33bb409'
          'ef0ecdb4d1c4441b884c7084b93806b52ec567c6')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # This version uses the non-existent "arch" command. Fixed in master. Remove after 0.0.3.
    sed -i 's/^ARCH = .*/ARCH = $(uname -m)/' Makefile

    # This version uses git to determine the tagged version which does not work with the tarball.
    # This is fixed in master, remove after 0.0.3
    sed -i "s/VERSION := .*/VERSION = ${pkgver}/" Makefile

    export GOPATH="$srcdir"
    msg2 'installing go dependencies'
    go get github.com/coreos/etcd/client
    go get gopkg.in/yaml.v2
    go get gopkg.in/fsnotify.v1
    go get github.com/codegangsta/cli
    go get github.com/coreos/go-systemd/dbus
    go get github.com/coreos/go-systemd/util
    go get github.com/coreos/pkg/capnslog
}

build() {
    export GOPATH="$srcdir"
    msg2 'building misc'
    cd "${srcdir}/${pkgname}-${pkgver}"
    PATH=$PATH:/usr/lib/go/pkg/tool/linux_amd64 \
        make build VERSION="${pkgver}" SVERSION="${pkgver}" PROGRAM="${pkgname}"
}

package() {
    msg2 'installing files'
    install -Dm644 "mgmt.service" "${pkgdir}/usr/lib/systemd/system/mgmt.service"

    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "misc/bashrc.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
    install -Dm644 "misc/example.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
}
