# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>
# Contributor: Bram Swenson <bram@amplified.work>

pkgbase='concourse-git'
pkgname=('concourse-git' 'concourse-fly-cli-git')
pkgver=v7.5.0.r331.gf138a7a9a
pkgrel=2
arch=('x86_64')
url='https://concourse-ci.org'
license=('Apache-2.0')
source=("git+https://github.com/concourse/concourse.git")
makedepends=('go-pie' 'yarn')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgbase%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgbase%-git}"
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
  cd "${pkgbase%-git}"
  export GOPATH="${srcdir}/go"
  export PATH=$PATH:"$GOPATH/bin"
  ldflags="-X github.com/concourse/concourse.Version=${pkgver}"
  yarn build
  go build -o concourse -trimpath -ldflags "${ldflags}" ./cmd/concourse
  go build -o fly -trimpath -ldflags "${ldflags}" ./fly
  gcc -O2 -static cmd/init/init.c -o init
}

package_concourse-git() {
  pkgname=concourse-git
  pkgdesc="Concourse is a container-based continuous thing-doer written in Go and Elm"
  optdepends=('cni-plugins' 'containerd' 'postgresql' 'concourse-resource-types')
  conflicts=('concourse-bin' 'concourse')

  cd "${pkgbase%-git}"

  install -Dm755 concourse "${pkgdir}/usr/bin/concourse"
  install -Dm755 init "${pkgdir}/usr/lib/concourse/bin/init"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/common/Apache/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_concourse-fly-cli-git() {
  pkgname=concourse-fly-cli-git
  pkgdesc="A command line interface that runs a build in a container with ATC"
  conflicts=('concourse-fly' 'concourse-fly-bin' 'concourse-fly-git' 'fly-cli' 'concourse-fly-cli')

  cd "${pkgbase%-git}"
  install -Dm755 "fly/fly" "${pkgdir}/usr/bin/fly"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/common/Apache/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
