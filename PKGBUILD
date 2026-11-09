# Maintainer: NemlAI <aur@nemlai.milops.org>
pkgname=nemlai
pkgver=0.13.2
pkgrel=1
pkgdesc="CLI and Python SDK for automated grocery replenishment on Nemlig.com (Denmark). Built for OpenClaw and other agents."
arch=('any')
url="https://nemlai.milops.org"
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/n/nemlai/nemlai-${pkgver}.tar.gz")
sha256sums=('d09faa7af0e6f08e9f61a1a9f176bd39a0e1bee96141491710193126d1ab24aa')

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
