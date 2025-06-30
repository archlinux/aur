# Maintainer: Dominic Giebert <dominic.giebert@gmail.com>

pkgname=kwctl-bin
pkgdesc='kwctl is the go-to CLI tool for Kubewarden users'
pkgver=1.26.0
pkgrel=1
arch=('aarch64' 'x86_64')
license=('Apache')
url='https://www.kubewarden.io/'
makedepends=('cosign')
provides=('kwctl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubewarden/kwctl/releases/download/v${pkgver}/kwctl-linux-${CARCH}.zip")
sha256sums=('0876d06ffdb11e30f3a92d929433efa79f0a7fa7a882a7af28557cd1ce22e793')
options=(!debug)

package() {
  # Checking the signature
  cosign verify-blob \
    --signature kwctl-linux-${CARCH}.sig \
    --cert kwctl-linux-${CARCH}.pem kwctl-linux-${CARCH} \
    --certificate-identity-regexp 'https://github.com/kubewarden/*' \
    --certificate-oidc-issuer https://token.actions.githubusercontent.com

  # Copy the binary
  install -Dm755 "kwctl-linux-${CARCH}" "${pkgdir}/usr/bin/kwctl"
}
