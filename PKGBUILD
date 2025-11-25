# Maintainer: Dominic Giebert <dominic.giebert@gmail.com>

pkgname=kwctl-bin
pkgdesc='kwctl is the go-to CLI tool for Kubewarden users'
pkgver=1.31.0
pkgrel=1
arch=('aarch64' 'x86_64')
license=('Apache')
url='https://www.kubewarden.io/'
makedepends=('cosign')
provides=('kwctl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubewarden/kwctl/releases/download/v${pkgver}/kwctl-linux-${CARCH}.zip")
sha256sums=('d21c09eda2183d9c0b9e08a8c16f5cec76ea6b38dc3e219a461c04f18cd60ac7')
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
