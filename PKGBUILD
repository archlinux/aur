# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

pkgname=terragrunt
pkgver=0.23.32
pkgrel=1
pkgdesc="A thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules"
url="https://github.com/gruntwork-io/terragrunt"
arch=('x86_64')
makedepends=(
  'git'
  'go-pie'
)
depends=('terraform')
conflicts=('terragrunt')
provides=('terragrunt')
license=('MIT')
source=("terragrunt-${pkgver}.tar.gz::https://github.com/gruntwork-io/terragrunt/archive/v${pkgver}.tar.gz")
sha256sums=('78954aa8b4007e482a5493ca8d64e6254395dd12af5dee95d05b958133f6eb69')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Set GOPATH to a path within $srcdir so that we don't pollute user's $GOPATH
  # (default of $HOME/go) when building this package
  export GOPATH="${srcdir}/.go"

  # Build the executable
  # Use `-trimpath` to avoid including file system paths in the executable
  go build \
    -modcacherw \
    -trimpath \
    -ldflags "-X github.com/gruntwork-io/terragrunt.VERSION=${pkgver}" \
    -o "${pkgname}-${pkgver}" \
    main.go
}

package() {
  # Install the license file
  install -D -m 0644 \
    "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install the executable
  install -D -m 0755 \
    "${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}" \
    "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
