# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: Bram Swenson <bram at craniumisajar dot com>
# Contributor: Marti Raudsepp <marti at juffo dot org>

pkgname='concourse-fly-git'
_pkgname='concourse'
pkgver=3.4.1.rc.34.r0.g5416da9
pkgrel=3
pkgdesc='Command line interface to the Concourse continuous integration tool'
arch=('x86_64')
url='https://concourse.ci/fly-cli.html'
license=('Apache')
makedepends=('go')
checkdepends=()
source=('git+https://github.com/concourse/concourse.git')
sha512sums=('SKIP')


prepare () {
    cd "${_pkgname}"
    git submodule update --init --recursive
    export GOPATH="$PWD"
    go get github.com/onsi/ginkgo/ginkgo
}

pkgver () {
    cd "${_pkgname}"
    cd src/github.com/concourse/fly
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
    cd "${_pkgname}"
    export GOPATH="$PWD"
    cd src/github.com/concourse/fly
    go build
}

check () {
    cd "${_pkgname}"
    export GOPATH="$PWD"
    cd src/github.com/concourse/fly
    "$GOPATH"/bin/ginkgo -r
}

package () {
    cd "${_pkgname}"
    install -m 755 -D src/github.com/concourse/fly/fly "$pkgdir"/usr/bin/fly
}
