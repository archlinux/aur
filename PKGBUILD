# Maintainer: Kevin <info@borunsky.de>

pkgname=wowusky
pkgver=0.8.2
pkgrel=1
pkgdesc='Minimalist World of Warcraft addon manager for Linux'
arch=('any')
url='https://github.com/borunsky/wowusky'
license=('MIT')
depends=('python' 'tk')
makedepends=('python-build' 'python-installer' 'python-setuptools>=77' 'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# The real checksum is computed automatically by the `Publish to AUR`
# GitHub Action (it runs `updpkgsums` against the published release
# tarball before pushing). 'SKIP' is the in-repo placeholder; for a
# manual local build run `updpkgsums` here first.
sha256sums=('c2a5e57049dd26c439d985910190bad8b01a499015c1a527be8c0fdb62cabb45')

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
