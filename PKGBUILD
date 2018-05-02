# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Bram Swenson <bram at amplified dot work>
# Contributor: Marti Raudsepp <marti at juffo dot org>

_pkgname='concourse-fly'
pkgname="${_pkgname}-git"
pkgver=3.12.1.rc.8.r0.gbb37e22
pkgrel=1
pkgdesc='Command line interface to the Concourse continuous integration tool'
arch=('x86_64')
url='https://concourse.ci/fly-cli.html'
license=('Apache')
makedepends=('go')
checkdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_srcname='concourse'
source=("git+https://github.com/concourse/${_srcname}.git")
sha512sums=('SKIP')

prepare() {
    cd "${_srcname}"
    git submodule update --init --recursive
    export GOPATH="$PWD"
    go get github.com/onsi/ginkgo/ginkgo
}

pkgver() {
    cd "${_srcname}"
    cd src/github.com/concourse/fly
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_srcname}"
    export GOPATH="$PWD"
    cd src/github.com/concourse/fly
    go build
}

check() {
    cd "${_srcname}"
    export GOPATH="$PWD"
    cd src/github.com/concourse/fly
    "$GOPATH"/bin/ginkgo -r
}

package() {
    cd "${_srcname}"
    install -m 755 -D src/github.com/concourse/fly/fly "$pkgdir"/usr/bin/fly
}
