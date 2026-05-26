# Maintainer: Kevin <info@borunsky.de>

pkgname=wowusky
pkgver=0.4.12
pkgrel=1
pkgdesc='Minimalist World of Warcraft addon manager for Linux'
arch=('any')
url='https://github.com/borunsky/wowusky'
license=('MIT')
depends=('python' 'tk')
makedepends=('python-build' 'python-installer' 'python-setuptools>=77' 'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# 'SKIP' is a placeholder. Before publishing to the AUR, tag and push
# the v0.4.9 release on GitHub, then run `updpkgsums` in this directory
# to replace SKIP with the real checksum of the release tarball.
sha256sums=('3a8bae18ec9f6c22d9d207cd6fa066c647603d560ba601ea2ba6486cf8b84b2b')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=. python -m pytest -q
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Desktop entry + scalable icon
  install -Dm644 packaging/wowusky.desktop \
                 "${pkgdir}/usr/share/applications/wowusky.desktop"
  install -Dm644 packaging/wowusky.svg \
                 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wowusky.svg"

  # Raster icons
  for sz in 32 64 128 256 512; do
    if [ -f "packaging/wowusky-${sz}.png" ]; then
      install -Dm644 "packaging/wowusky-${sz}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/wowusky.png"
    fi
  done
}
