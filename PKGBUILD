# Maintainer: Dominic Giebert <dominic.giebert@gmail.com>

pkgname=kwctl-bin
pkgdesc='kwctl is the go-to CLI tool for Kubewarden users'
pkgver=1.32.1
pkgrel=1
arch=('aarch64' 'x86_64')
license=('Apache')
url='https://www.kubewarden.io/'
makedepends=('cosign')
provides=('kwctl')
source=("$pkgname-$pkgver.zip::https://github.com/kubewarden/kubewarden-controller/releases/download/v${pkgver}/kwctl-linux-${CARCH}.zip")
sha256sums=('4897584e891938553215f9d507e1495163331181965159dbea4adccb781486f3')
options=(!debug)

package() {
  # Checking the signature
  cosign verify-blob \
    --bundle kwctl-linux-${CARCH}.bundle.sigstore \
    kwctl-linux-${CARCH} \
    --certificate-identity-regexp 'https://github.com/kubewarden/*' \
    --certificate-oidc-issuer https://token.actions.githubusercontent.com

  # Copy the binary
  install -Dm755 "kwctl-linux-${CARCH}" "${pkgdir}/usr/bin/kwctl"
}
