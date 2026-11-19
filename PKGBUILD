# Maintainer: robertfoster
pkgname=kerf
# renovate: datasource=github-tags depName=multikernel/kerf
pkgver=0.5.0
pkgrel=1
pkgdesc="Orchestrate and manage multiple kernel instances on a single host (Multikernel Linux)"
arch=(x86_64 aarch64 riscv64)
url="https://multikernel.io"
license=('Apache-2.0')
depends=(
  'dtc'
  'python'
  'python-click'
  'python-cryptography'
  'python-pyudev'
  'python-yaml'
)
makedepends=(
  'musl'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
optdepends=(
  'docker: boot instances from container images (kerf load --image)'
  'python-zstandard: load zstd-compressed kernel images'
)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/multikernel/kerf/archive/refs/tags/v$pkgver.tar.gz")

build() {
  # Upstream's build.py shadows the 'build' module when run from the source dir
  python -m build --wheel --no-isolation --outdir "$pkgname-$pkgver/dist" "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Static musl binary injected into spawned kernels; makepkg leaves it unstripped
  local _site=$(python -c 'import site; print(site.getsitepackages()[0])')
  strip "$pkgdir$_site/kerf/data/kerf-init"
}
sha256sums=('0e29fe9bb09df99b38849b3c796fe620db8bd656f711cab4ba6378cfb73ca948')
