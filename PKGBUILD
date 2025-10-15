# Maintainer: Nazmul Alom Shanto <brilliantandcreative1@gmail.com> <https://github.com/Nazmul-alom-shanto>
# Contributor: Nazmul Alom Shanto <brilliantandcreative1@gmail.com>

pkgname=habit
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimalist, cross-platform CLI tool to track and build habits."
# Since PyInstaller creates a machine-specific binary, we use x86_64.
arch=('x86_64') 
url="https://github.com/nazmul-alom-shanto/habit-cli"
license=('MIT')

# Dependencies are usually empty for bundled PyInstaller binaries,
# as all Python dependencies are bundled inside.
depends=() 

makedepends=(
    'git'
    'python'
    'python-pip'
    'sqlite'
)

# Fetch source code tagged v1.0.0
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP') 

build() {
  cd "$pkgname-$pkgver"

  # Create a temporary virtual environment for building
  python -m venv build-venv
  source build-venv/bin/activate

  # Upgrade pip and install required Python packages locally
  pip install --upgrade pip
  pip install -r requirements.txt
  pip install pyinstaller

  # Build the standalone executable with PyInstaller
  python -m PyInstaller --name habit --onefile \
              --collect-all habit_tracker \
              --add-data "templates:templates" \
              --clean \
              --log-level=INFO \
              habit_tracker/__main__.py

  # Deactivate and remove the virtual environment
  deactivate
  rm -rf build-venv
}

package() {
  # Install the compiled binary to /usr/bin
  install -Dm755 "$pkgname-$pkgver/dist/habit" "$pkgdir/usr/bin/habit"
  
  # Install the LICENSE file
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
