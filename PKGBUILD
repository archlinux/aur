# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>
# Contributor: Bram Swenson <bram@amplified.work>

pkgbase='concourse'
pkgname=('concourse' 'concourse-fly-cli' 'concourse-resource-types')
pkgver=7.4.0
pkgrel=1
arch=('x86_64')
url='https://concourse-ci.org'
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/concourse/concourse/archive/v${pkgver}.tar.gz"
        "https://github.com/concourse/concourse/releases/download/v${pkgver}/concourse-${pkgver}-linux-amd64.tgz")
makedepends=('go-pie' 'yarn')
sha256sums=('46560614555feca2c65faff142e8a110c39c993af2c958e991bea824782f2047'
            'b11c225469b8f25feeea66d76f7be2b7de7f32307f977a08056f4ca1892fd366')

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
  ldflags="-X github.com/concourse/concourse.Version=${pkgver}"
  yarn build
  go build -o concourse -trimpath -ldflags "${ldflags}" ./cmd/concourse
  go build -o fly -trimpath -ldflags "${ldflags}" ./fly
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
  ln -s /usr/share/licenses/common/Apache/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_concourse-fly-cli() {
  pkgname=concourse-fly-cli
  pkgdesc="A command line interface that runs a build in a container with ATC"
  conflicts=('concourse-fly' 'concourse-fly-bin' 'concourse-fly-git' 'fly-cli')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "fly/fly" "${pkgdir}/usr/bin/fly"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/common/Apache/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_concourse-resource-types() {
  pkgname=concourse-resource-types
  pkgdesc="Concourse basic resource types"

  cd "${srcdir}/${pkgbase}/resource-types"

  install -dm755 "${pkgdir}/usr/lib/${pkgbase}/resource-types"
  cp -r * "${pkgdir}/usr/lib/${pkgbase}/resource-types/"
}
