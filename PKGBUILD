# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>
# Contributor: Bram Swenson <bram@amplified.work>

pkgbase='concourse'
pkgname=('concourse' 'concourse-fly-cli' 'concourse-resource-types')
pkgver=7.9.0
pkgrel=2
arch=('x86_64')
url='https://concourse-ci.org'
license=('custom:Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/concourse/concourse/archive/v${pkgver}.tar.gz"
        "https://github.com/concourse/concourse/releases/download/v${pkgver}/concourse-${pkgver}-linux-amd64.tgz")
makedepends=('go' 'yarn')
sha256sums=('c0ecf07892975c039fc1c0af1d6afb62e7bca8a764251f6ec0202b982bd2b7ce'
            '12d6005990dad14496d5a4949ad6c18217589cd8a4bbaf36bf1f45740dba0c56')
prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${srcdir}/go"
  export GOPATH="${srcdir}/go"
  export PATH=$PATH:"$GOPATH/bin"

  # Change binary asset directory
  sed -e 's#binariesDir = "/usr/local/concourse/bin"#binariesDir = "/usr/lib/cni"#' -i worker/runtime/cni_network.go
  sed -e 's#"cni-plugins-dir" default:"/usr/local/concourse/bin"#"cni-plugins-dir" default:"/usr/lib/cni"#' -i worker/workercmd/worker_linux.go
  sed -e 's#/usr/local/concourse/bin/init#/usr/lib/concourse/bin/init#' -i worker/runtime/spec/mounts.go
  sed -e 's#"init-bin"   default:"/usr/local/concourse/bin/init"#"init-bin"   default:"/usr/lib/concourse/bin/init"#' -i worker/workercmd/worker_linux.go

  go get -d ./...
  yarn
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/go"
  export PATH=$PATH:"$GOPATH/bin"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -ldflags=-X=github.com/concourse/concourse.Version=${pkgver} -mod=readonly -modcacherw"

  yarn build
  go build -o concourse ./cmd/concourse
  go build -o fly ./fly
  gcc -O2 -static cmd/init/init.c -o init
}

package_concourse() {
  pkgname=concourse
  pkgdesc="Concourse is a container-based continuous thing-doer written in Go and Elm"
  optdepends=('cni-plugins' 'containerd' 'postgresql' 'concourse-resource-types')
  conflicts=('concourse-bin')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/concourse"
  install -Dm755 init "${pkgdir}/usr/lib/concourse/bin/init"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_concourse-fly-cli() {
  pkgname=concourse-fly-cli
  pkgdesc="A command line interface that runs a build in a container with ATC"
  conflicts=('concourse-fly' 'concourse-fly-bin' 'concourse-fly-git' 'fly-cli')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "fly/fly" "${pkgdir}/usr/bin/fly"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_concourse-resource-types() {
  pkgname=concourse-resource-types
  pkgdesc="Concourse basic resource types"

  cd "${srcdir}/${pkgbase}/resource-types"

  install -dm755 "${pkgdir}/usr/lib/${pkgbase}/resource-types"
  cp -r * "${pkgdir}/usr/lib/${pkgbase}/resource-types/"
}
