# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: Bram Swenson <bram at amplified dot work>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname='concourse-fly'
pkgver=4.2.2
pkgrel=1
pkgdesc="A command line interface that runs a build in a container with ATC."
arch=(x86_64)
url="https://concourse-ci.org/fly.html"
license=('Apache')
makedepends=('go-pie')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("git+https://github.com/concourse/concourse.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/concourse"
    git submodule update --init --recursive --jobs $(nproc) --recommend-shallow
    export GOPATH="$PWD"
    go get github.com/onsi/ginkgo/ginkgo
}

build() {
    cd "${srcdir}/concourse"
    export GOPATH="$PWD"
    cd src/github.com/concourse/fly
    go build -gcflags "all=-trimpath=${PWD}" \
             -asmflags "all=-trimpath=${PWD}" \
             -ldflags "-extldflags ${LDFLAGS}"
}

check() {
    cd "${srcdir}/concourse"
    export GOPATH="$PWD"
    cd src/github.com/concourse/fly
    "$GOPATH"/bin/ginkgo -r
}

package() {
    cd "${srcdir}/concourse"
    install -m 755 -D src/github.com/concourse/fly/fly "$pkgdir"/usr/bin/fly
}
