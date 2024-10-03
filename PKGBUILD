# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Maxim Baz <${reponame} at maximbaz dot com>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>
# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=skaffold-git
reponame=skaffold
provides=('skaffold')
conflicts=('skaffold')

pkgver=2.13.2
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/GoogleContainerTools/skaffold"
license=("Apache-2.0")
depends=(
  "docker"
  "glibc"
  "kompose"
)
makedepends=(
  "git"
  "go"
  "go-licenses"
  "python"
)
optdepends=(
  "kubectl: For Kubernetes support"
  "minikube: To use Minikube"
)
options=(!lto)
source=("$reponame::git+$url.git#tag=v$pkgver")
sha512sums=('126b9a3c82b4df3a1ab4c4f12b8dd8ad89aca344190089bf7f7d44d0d8dd233cd70a91b2cfbeac14670e3b2ad75a51ebc3d8effc2ddd4d5003f7e4d6cbcd0112')
b2sums=('7ae0ff553404bcaf4337253ca1a7bd5f358f187f42529d26fc58bebab9b0e955ae2a4d380ae368a230edac91b67c9f027fbbf19e8a4c10eeeea4293f40a89089')

prepare() {
  cd "${reponame}"
  GOFLAGS="-mod=readonly" go mod vendor -v
  # Remove check that requires running Docker.
  sed -i "/test-generated-proto/d" hack/checks.sh
}

build() {
  cd "${reponame}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw"
  export GOPATH="${srcdir}"

  local tags="timetzdata osusergo netgo release"
  local version_package="github.com/GoogleContainerTools/skaffold/v2/pkg/skaffold/version"
  local ld_flags=" \
    -X ${version_package}.gitCommit=$(git rev-parse HEAD) \
    -X ${version_package}.version=${pkgver} \
    -compressdwarf=false \
    -linkmode=external \
  "
  go build -v -ldflags "${ld_flags}" -tags "${tags}" ./cmd/skaffold/skaffold.go
}

check() {
  cd "${reponame}"
  # Skip integration tests, requires Java, a running Docker daemon and
  # connection to a Kubernetes cluster.
  local tests=$(
    go list ./... \
      | grep -v github.com/GoogleContainerTools/skaffold/v2/integration
  )
  export PATH="${PWD}:${PATH}"
  # shellcheck disable=SC2086
  go test -v -short -timeout=90s $tests
  #./hack/checks.sh
}

package() {
  cd "${reponame}"
  install -vDm755 -t "${pkgdir}/usr/bin" skaffold
  ./skaffold completion bash \
    | install -vDm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/skaffold"
  ./skaffold completion zsh \
    | install -vDm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_skaffold"
  ./skaffold completion fish \
    | install -vDm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/skaffold.fish"
}
