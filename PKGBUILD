# Contributor: pancho horrillo <pancho at pancho dot name>
# Contributor: Bram Swenson <bram at amplified dot work>
# Contributor: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname="concourse-fly"
pkgver=5.5.8
pkgrel=2
pkgdesc="A command line interface that runs a build in a container with ATC."
arch=('x86_64')
url="https://concourse-ci.org/fly.html"
license=('Apache')
makedepends=('go-pie' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-bin" "${pkgname}-git")
source=("git+https://github.com/concourse/concourse.git#tag=v${pkgver}")
sha512sums=('SKIP')

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
