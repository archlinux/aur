# Maintainer: Deon Spengler <deon@spengler.co.za>

_name=audio-hotplug
pkgname=python-audio-hotplug
pkgver=0.1.0
pkgrel=1
pkgdesc="Cross-platform audio device hotplug detection with debouncing"
arch=('any')
url="https://github.com/LedFx/audio-hotplug"
license=('MIT')
depends=('python' 'python-pyudev')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('005f00f98162a59e7a9ac496da098cb2bfeeebe6e8175973385b5860470be2ab')

prepare() {
  cd "$_name-$pkgver"
  # Upstream pins uv_build to <0.10; relax it so the packaged uv-build works
  sed -i 's/"uv_build>=[^"]*"/"uv_build"/' pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$PWD/src" python -m pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
