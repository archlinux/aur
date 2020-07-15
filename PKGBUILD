# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

pkgname=terragrunt
pkgver=0.23.31
pkgrel=4
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
sha256sums=('7bb9859fd968220bcae1908079448834a789fca03d644d405a61441cd4a655a2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Set GOPATH to a path within $srcdir so that we don't pollute user's $GOPATH
  # (default of $HOME/go) when building this package
  export GOPATH="${srcdir}/.go"

  # Build the executable
  # Use `-trimpath` to avoid including file system paths in the executable
  go build \
    -trimpath \
    -ldflags "-X github.com/gruntwork-io/terragrunt.VERSION=${pkgver}" \
    -o "${pkgname}-${pkgver}" \
    main.go

  # Change the file mode of modules to allow them to be removed via `--clean`
  # and `--cleanbuild` options to makepkg, as well as other file-level
  # operations which attempt to delete the files. This is a hacky way to
  # accomplish this; the other option being to invoke `go clean`.
  #
  # Invoking `go clean` has the downside of removing all modules at call time,
  # which prevent re-using the module cache between builds of this package.
  chmod u+w -R "${GOPATH}/pkg/mod"
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
