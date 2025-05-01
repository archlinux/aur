# Maintainer: nazdridoy <nazdridoy399@gmail.com>
pkgname=ngpt
pkgver=3.4.2
pkgrel=1
pkgdesc="Swiss army knife for LLMs: powerful CLI, interactive chatbot, and flexible Python library. Works with OpenAI, Ollama, Groq, Claude, Gemini, and any OpenAI-compatible API."
arch=('any')
url="https://github.com/nazdridoy/ngpt"
license=('MIT')
depends=('python' 'python-requests>=2.31.0' 'python-rich>=10.0.0' 'python-prompt_toolkit>=3.0.0' 'python-pyperclip>=1.8.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-pip')
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nazdridoy/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3d7e736ee5315b4a6ee061bd8b7dcae11a287b7865a31a0202b9c33fbb691c4b')

prepare() {
  cd "$pkgname-$pkgver"
  # Install dependencies using pip since they're not in main Arch repos
  mkdir -p vendor
  pip install --target=vendor duckduckgo-search>=3.0.0 trafilatura>=1.6.0
  
  # Add an __init__.py file to modify sys.path to include our bundled dependencies
  cat > ngpt/bundled_deps.py << 'EOF'
import os
import sys

def setup_bundled_deps():
    # Add the bundled dependencies to the path
    bundled_path = os.path.join(os.path.dirname(__file__), 'vendor')
    if os.path.exists(bundled_path) and bundled_path not in sys.path:
        sys.path.insert(0, bundled_path)
EOF

  # Modify __init__.py to include the bundled deps setup
  # First check if it already imports bundled_deps
  if ! grep -q "bundled_deps" ngpt/__init__.py; then
    # Make a backup of the original file
    cp ngpt/__init__.py ngpt/__init__.py.bak
    
    # Add the import at the top of the file
    echo 'from .bundled_deps import setup_bundled_deps' > ngpt/__init__.py.new
    echo 'setup_bundled_deps()' >> ngpt/__init__.py.new
    cat ngpt/__init__.py.bak >> ngpt/__init__.py.new
    mv ngpt/__init__.py.new ngpt/__init__.py
  fi
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Install the bundled dependencies in the ngpt package directory
  if [ -d "vendor" ]; then
    # Get the ngpt package directory
    ngpt_pkg_dir=$(python -c "import site; print(site.getsitepackages()[0])")/ngpt
    mkdir -p "$pkgdir$ngpt_pkg_dir/vendor"
    cp -r vendor/* "$pkgdir$ngpt_pkg_dir/vendor/"
  fi
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
