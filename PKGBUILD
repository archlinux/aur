# Maintainer: David Birks <david@birks.dev>

pkgname=toad-ai
pkgver=0.5.5
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
b2sums=('df4d9c1c0ef7b1401e6b9c3f613ac2241e4261a16a0148c55b9badea4253eae413ffb3badc3a4e5c6bfa110a5ff8e5ee1dd93dda91b9f0293aade64f1ca009bb')

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
