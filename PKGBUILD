# Maintainer: erdii <me at erdii dot engineering>
pkgname=ocm-addons
pkgver=0.7.19
pkgrel=1
pkgdesc="A plug-in for the ocm-cli which provides commands for working with add-ons for managed OpenShift."
arch=("any")
provides=("ocm-addons")
conflicts=()
url="https://github.com/mt-sre/ocm-addons"
license=("Apache")
depends=()
makedepends=("go" "goreleaser" "go-yq" "ginkgo-git" "lichen")
source=("ocm-addons-${pkgver}::git+https://github.com/mt-sre/ocm-addons#tag=v${pkgver}")
sha256sums=('a800f5e6dc11857c3a32226a283dbb449a9960c7a588db307c349da0938f27da')

build() {
  cd "${srcdir}/ocm-addons-${pkgver}"

  # add goarch otherwise goreleaser --single-target can't find the build
  yq -i '.builds[].goarch = ["amd64", "arm64"]' .goreleaser.yaml
  git add .goreleaser.yaml
  git commit -m 'fix goreleaser'
  git tag -d "v${pkgver}"
  git tag -a "v${pkgver}" -m '${pkgver}'

  # use goreleaser instead of `go build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/ocm-addons-${pkgver}/ocm-addons" "${pkgdir}/usr/bin/ocm-addons"
}
