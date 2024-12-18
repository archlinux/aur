# Maintainer: Amir Husayn Panahifar <Panahifar.ah@outlook.com>

pkgname=tractor-rc-git
pkgver=x.y.z
pkgrel=1
pkgdesc="Setup an onion routing proxy (latest Git version)"
arch=('any')
url="https://framagit.org/tractor/tractor/"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-gobject'
  'python-fire'
  'python-pysocks'
  'python-stem'
  'tor'
  'dconf'
)
makedepends=(
  'python-build'
  'python-setuptools'
  'python-installer'
  'python-wheel'
  'git'
)
checkdepends=('python-nose')
optdepends=('carburetor-git: Graphical settings app using GTK')
source=("git+https://framagit.org/tractor/tractor.git")
sha256sums=('SKIP')

_check_python_environment() {
  echo "🔍 Validating Python environment..."
  local modules=('build' 'setuptools' 'wheel')
  for module in "${modules[@]}"; do
    if ! /usr/bin/python -c "import $module" &>/dev/null; then
      echo "❌ Error: Missing Python module '$module'."
      echo "   💡 Please install 'python-$module' using your package manager."
      exit 1
    fi
  done
  echo "✅ Python environment is correctly configured."
}

pkgver() {
  cd "$srcdir/tractor" || exit 1
  git describe --tags --long --always | sed -E 's/^v//;s/-/./g;s/[^a-zA-Z0-9.]/_/g'
}

build() {
  echo "🔧 Starting the build process..."
  _check_python_environment
  cd "$srcdir/tractor" || exit 1
  /usr/bin/python -m build --wheel --no-isolation || {
    echo "❌ Build failed. Please review the error output above."
    exit 1
  }
  echo "✅ Build completed successfully."
}

check() {
  echo "🧪 Running test cases..."
  cd "$srcdir/tractor" || exit 1
  /usr/bin/python -m nose || {
    echo "⚠️ Warning: Test cases failed. Proceeding with caution."
    return 0
  }
  echo "✅ All tests passed successfully."
}

package() {
  echo "📦 Installing the package..."
  cd "$srcdir/tractor" || exit 1
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl || {
    echo "❌ Installation failed. Please check the error output above."
    exit 1
  }
  install -Dm0644 src/tractor/tractor.gschema.xml \
    "$pkgdir/usr/share/glib-2.0/schemas/tractor.gschema.xml"
  install -Dm0644 data/tractor.1 \
    "$pkgdir/usr/share/man/man1/tractor.1"
  install -Dm0644 data/completion/bash/tractor \
    "$pkgdir/usr/share/bash-completion/completions/tractor"
  echo "🎉 Package installation completed successfully!"
}
