# Maintainer: ZaViBiS <igordnepr27 at gmail dot com>

pkgname=gputaskman
pkgver=0.4.1
pkgrel=1
pkgdesc="A GPU task manager for Windows, Linux, and WSL: per-process VRAM, GPU activity, and LLM model/KV-cache insights (Windows AMD and NVIDIA)."
arch=('any')
url="https://github.com/shanselman/gputaskman"
license=('MIT')
depends=(
  'python'
  'python-nvidia-ml-py'
  'python-psutil'
  'python-textual'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-uv-build'
  'python-wheel'
)
optdepends=(
  'amdsmi: AMD SMI telemetry for AMD GPUs'
  'nvidia-utils: NVML telemetry for NVIDIA GPUs'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7986fe5e571dc5a68a94a4adb965dbadc5bb2891aff67564fb1cad9dc5a133d2')

prepare() {
  cd "$pkgname-$pkgver"
  # Relax pinned uv_build upper bound to allow building with newer system python-uv-build
  sed -i -E 's/,<[0-9.]+//' pyproject.toml
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
