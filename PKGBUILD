# Maintainer: erdii <me at erdii dot engineering>
pkgname=ocm-addons
pkgver=0.8.0
pkgrel=0
pkgdesc="A plug-in for the ocm-cli which provides commands for working with add-ons for managed OpenShift."
arch=("any")
provides=("ocm-addons")
conflicts=()
url="https://github.com/mt-sre/ocm-addons"
license=("Apache")
depends=()
makedepends=("go" "goreleaser" "go-yq" "ginkgo-git" "lichen")
source=("ocm-addons-${pkgver}::git+https://github.com/mt-sre/ocm-addons#tag=v${pkgver}")
sha256sums=('58d29c8f614c0c39c4943e6c0285e878d50af00f3755e8a4f40c57e944626e82')

build() {
  cd "${srcdir}/ocm-addons-${pkgver}"

  # fix git config
  git config user.name local
  git config user.email local@local.local

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
