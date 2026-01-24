# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
pkgname=terminal-rain-lightning
pkgver=0.1.0
pkgrel=2
pkgdesc="A terminal rain and lightning animation using Python and curses"
arch=('any')
url="https://github.com/rmaake1/terminal-rain-lightning"
license=('MIT')
depends=('python')
makedepends=('git' 'python-pip' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("git+https://github.com/rmaake1/terminal-rain-lightning.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/terminal-rain-lightning"
  # Extract version from pyproject.toml
  grep '^version' pyproject.toml | head -n1 | cut -d\" -f2
}

prepare() {
  cd "$srcdir/terminal-rain-lightning"
  # Ensure a clean build state if reusing a cache
  rm -rf build dist *.egg-info
  # Fix undefined 'unique_new' variable in lightning bolt logic
  sed -i 's/self.segments.extend(unique_new)/self.segments.extend(new_segments_this_step)/' terminal_rain_lightning.py
}

build() {
  cd "$srcdir/terminal-rain-lightning"
  # Build a wheel via PEP 517
  python -m build --wheel --outdir .
}

package() {
  cd "$srcdir/terminal-rain-lightning"
  # Install into $pkgdir using pip, without pulling external dependencies
  python -m pip install --root="$pkgdir" --no-deps --ignore-installed *.whl
  # Remove direct_url.json which contains $srcdir references
  find "$pkgdir" -name "direct_url.json" -delete
}
