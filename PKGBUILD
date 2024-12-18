# Maintainer: Dominic Giebert <dominic.giebert@gmail.com>

pkgname=kwctl-bin
pkgdesc='kwctl is the go-to CLI tool for Kubewarden users'
pkgver=1.20.0
pkgrel=1
arch=('aarch64' 'x86_64')
license=('Apache')
url='https://www.kubewarden.io/'
makedepends=('cosign')
provides=('kwctl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubewarden/kwctl/releases/download/v${pkgver}/kwctl-linux-${CARCH}.zip")
sha256sums=('50d3d20306f65ed3a7429d59a49731dc884aaf4029b36ef3b714dcb8de91a52e')
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
