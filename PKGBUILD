# Maintainer: Dominic Giebert <dominic.giebert@gmail.com>

pkgname=kwctl-bin
pkgdesc='kwctl is the go-to CLI tool for Kubewarden users'
pkgver=1.30.0
pkgrel=1
arch=('aarch64' 'x86_64')
license=('Apache')
url='https://www.kubewarden.io/'
makedepends=('cosign')
provides=('kwctl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubewarden/kwctl/releases/download/v${pkgver}/kwctl-linux-${CARCH}.zip")
sha256sums=('9f58954eb6b52b5fa56e3e1f2777d20796576d2238813905bc664b635b8a4f1c')
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
