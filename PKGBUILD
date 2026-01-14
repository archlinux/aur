# Maintainer: kidpixo <kidpixo at gmail dot com>
pkgname=arch-check
pkgver=0.3.0
# upstream repository name (GitHub) — note underscore vs package name
upstream_name=arch_check
pkgrel=1
pkgdesc="Python stdlib Arch Linux health checker: disks, kernel, services, SMART. Output to terminal or JSON."
arch=('any')
url="https://github.com/kidpixo/arch_check"
license=('0BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
# Use the GitHub tag release (use upstream_name for the archive filename)
source=("$upstream_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "LICENSE")
sha256sums=('85d62596bcb27463c3ab4238039b6808d8d75bb747911245527e8fc725b90eba'
            '7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3')

build() {
  cd "$upstream_name-$pkgver"
  python -m build --wheel --no-isolation 
}

package() {
  cd "$upstream_name-$pkgver"
  # Find the built wheel file in dist/ and pass it to the installer
  wheel_file=$(ls dist/*.whl 2>/dev/null | head -n1)
  if [ -z "$wheel_file" ]; then
    echo "No wheel found in dist/, aborting"
    return 1
  fi
  python -m installer --destdir="$pkgdir" "$wheel_file"

  # Install the license file (required for 0BSD as it's not in common-licenses)
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
