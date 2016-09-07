# $Id$
# Maintainer: Joe Julian

pkgname=mgmt
pkgver=0.0.4
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

source=("https://github.com/purpleidea/mgmt/archive/${pkgver}.tar.gz"
        'mgmt.service')
sha1sums=('8dd7837e39bb738ffe5bc50f8f534ea9c56936ad'
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
    go get github.com/coreos/etcd
    go get github.com/godbus/dbus
    go get github.com/howeyc/gopass
    go get github.com/kardianos/osext
    go get github.com/pkg/sftp
    go get github.com/urfave/cli
    go get gopkg.in/fsnotify.v1
    go get gopkg.in/yaml.v2
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
