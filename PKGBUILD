# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Bram Swenson <bram at amplified dot work>
# Contributor: Marti Raudsepp <marti at juffo dot org>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse-fly'
pkgname="${_pkgname}-git"
pkgver=4.2.1.r9287.gee3b4cf8b
pkgrel=1
pkgdesc='Command line interface to the Concourse continuous integration tool'
arch=('x86_64')
url='https://concourse-ci.org/fly.html'
license=('Apache')
makedepends=('go')
checkdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_srcname='concourse'
source=("git+https://github.com/concourse/${_srcname}.git")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/${_srcname}"
    git submodule update --init --recursive --jobs $(nproc) --recommend-shallow
}

pkgver() {
    cd "${srcdir}/${_srcname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_srcname}/fly"
    export GOPATH="$PWD"
    go build
}

check() {
    cd "${srcdir}/${_srcname}/fly"
    export GOPATH="$PWD"
    go get github.com/onsi/ginkgo/ginkgo
    "$GOPATH"/bin/ginkgo -r
}

package() {
    cd "${srcdir}/${_srcname}/fly"
    install -m 755 -D fly "$pkgdir"/usr/bin/fly
}
