# Maintainer: David Birks <david@birks.dev>

pkgname=toad-ai
pkgver=0.5.8
pkgrel=1
pkgdesc='A unified interface for AI in your terminal'
arch=('any')
url='https://github.com/batrachianai/toad'
license=('AGPL-3.0-only')
depends=('uv' 'python')
provides=('toad')
conflicts=('toad' 'batrachian-toad')
options=('!debug')
source=("https://github.com/batrachianai/toad/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('36505ff364ff22a5a1509346b096c78e5c6dcd0cb1a7a6ea588ef2e2c61c4e29d6427ffe998d08d5cae20f25489f23778f18d4dbdc919349e16e259481d595b5')

build() {
  cd "toad-${pkgver}"
  uv build --wheel
}

package() {
  cd "toad-${pkgver}"

  # Create a virtual environment with Python 3.14 and install the wheel
  uv venv "$pkgdir/usr/lib/$pkgname/venv" --python 3.14
  uv pip install --python "$pkgdir/usr/lib/$pkgname/venv/bin/python" dist/*.whl

  # Create wrapper script
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/toad" << 'EOF'
#!/bin/sh
exec /usr/lib/toad-ai/venv/bin/toad "$@"
EOF
  chmod +x "$pkgdir/usr/bin/toad"
}
