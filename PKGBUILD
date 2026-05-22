# Maintainer: NemlAI <aur@nemlai.milops.org>
pkgname=nemlai
pkgver=0.7.1
pkgrel=1
pkgdesc="CLI and Python SDK for automated grocery replenishment on Nemlig.com (Denmark). Built for OpenClaw and other agents."
arch=('any')
url="https://nemlai.milops.org"
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/n/nemlai/nemlai-${pkgver}.tar.gz")
sha256sums=('a42fe43deae41c4925dac149d03c123db86f7dbfa8b8d22b8596c75082b1b3f1')

build() {
  cd "nemlai-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "nemlai-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Wrap entry point to set install-channel attribution
  mv "${pkgdir}/usr/bin/nemlai" "${pkgdir}/usr/bin/.nemlai-real"
  printf '#!/bin/sh
export NEMLAI_CLIENT_CHANNEL=aur
exec /usr/bin/.nemlai-real "$@"
' > "${pkgdir}/usr/bin/nemlai"
  chmod +x "${pkgdir}/usr/bin/nemlai"
}
