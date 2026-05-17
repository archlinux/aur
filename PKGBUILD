# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=free-claude-code-bin
pkgver=2.0.0.r618.fc3ef0b
pkgrel=1
pkgdesc="Proxy to use Claude Code CLI with free alternative providers (NVIDIA NIM, OpenRouter, DeepSeek, etc.)"
arch=('x86_64')
url="https://github.com/Alishahryar1/free-claude-code"
license=('MIT')
depends=('python>=3.14')
makedepends=('git' 'uv')
provides=('free-claude-code')
conflicts=('free-claude-code')
install="$pkgname.install"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/free-claude-code"
  local ver
  ver=$(grep '^version =' pyproject.toml | sed 's/version = "\(.*\)"/\1/')
  printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/free-claude-code"
  uv venv --python /usr/bin/python3 --python-preference only-system "$srcdir/venv"
  source "$srcdir/venv/bin/activate"
  uv pip install .
  deactivate
}

package() {
  local venv_dir="/opt/free-claude-code"

  install -dm755 "$pkgdir$venv_dir"
  cp -a "$srcdir/venv/." "$pkgdir$venv_dir/"

  sed -i "s|$srcdir/venv|$venv_dir|g" "$pkgdir$venv_dir/pyvenv.cfg"
  find "$pkgdir$venv_dir/bin" -type f -exec sed -i "s|$srcdir/venv|$venv_dir|g" {} +
  find "$pkgdir$venv_dir/lib" -name '*.pth' -exec sed -i "s|$srcdir/venv|$venv_dir|g" {} +
  find "$pkgdir$venv_dir/lib" -name 'direct_url.json' -delete

  install -dm755 "$pkgdir/usr/bin"
  for cmd in fcc-server free-claude-code fcc-init fcc-claude; do
    if [ -f "$pkgdir$venv_dir/bin/$cmd" ]; then
      ln -sf "$venv_dir/bin/$cmd" "$pkgdir/usr/bin/$cmd"
    fi
  done

  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
MIT License

Copyright (c) 2026 Ali Khokhar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
