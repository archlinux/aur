# Maintainer: erdii <me at erdii dot engineering>
pkgname=ocm-addons
pkgver=0.7.17
pkgrel=1
pkgdesc="A plug-in for the ocm-cli which provides commands for working with add-ons for managed OpenShift."
arch=("any")
provides=("ocm-addons")
conflicts=()
url="https://github.com/mt-sre/ocm-addons"
license=("Apache")
depends=()
makedepends=("go" "goreleaser" "go-yq")
source=("ocm-addons-${pkgver}::git+https://github.com/mt-sre/ocm-addons#tag=v${pkgver}")
sha256sums=('86e8da5ca4258a80a191aeee703f3ac0aa245679e9b18b5864a0d07afedbf83b')

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
