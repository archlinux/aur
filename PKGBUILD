# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>
pkgname=tiddl
pkgver=3.4.3
pkgrel=1
pkgdesc="Download tracks and videos from Tidal with max quality!"
arch=('any')
url="https://github.com/oskvr37/tiddl"
license=('Apache-2.0')
depends=('python' 'ffmpeg' "python-requests" "python-typer" "python-aiofiles" "python-mutagen" "python-m3u8"
  "python-pydantic" "python-rich" "python-aiohttp" "python-requests-cache" "python-typing_extensions")
makedepends=('python-build'
  'python-installer'
  'python-wheel')
checkdepends=("python-pytest" "python-pytest-mock")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c25606542d3feb4446e94673f515a0e7343c7980b0b0c67411f34c68438a807f')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 docs/templating.md "$pkgdir/usr/share/doc/$pkgname/templating.md"
}
