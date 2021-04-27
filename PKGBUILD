# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Bram Swenson <bram at amplified dot work>
# Contributor: Marti Raudsepp <marti at juffo dot org>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname="concourse-fly"
pkgname=$_pkgname-git
pkgver=7.2.0.r78.g9c16b0934
pkgrel=1
pkgdesc="A command line interface that runs a build in a container with ATC."
arch=('x86_64')
url="https://concourse-ci.org/fly.html"
license=('Apache')
makedepends=('go' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
source=("git+https://github.com/concourse/concourse.git")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/concourse/
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p gopath/src/github.com/concourse
    ln -rTsf $srcdir/concourse/ gopath/src/github.com/concourse/concourse
    export GOPATH="$srcdir"/gopath
    cd $srcdir/concourse/fly
    go get ./...
}

build() {
    export GOPATH="$srcdir"/gopath
    cd $srcdir/concourse/fly
    go build \
        -trimpath \
        -ldflags "-extldflags ${LDFLAGS}" \
        .
}

check() {
    export GOPATH="$srcdir"/gopath
    cd $srcdir/concourse/fly
    go get github.com/onsi/ginkgo/ginkgo
    $GOPATH/bin/ginkgo -r -p
}

package() {
    cd $srcdir/concourse/fly
    install -m 755 -D fly $pkgdir/usr/bin/fly
}
