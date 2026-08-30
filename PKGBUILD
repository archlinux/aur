# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=headroom-ai-bin
_pyname=headroom_ai
pkgver=0.37.0
pkgrel=1
pkgdesc="Context optimization layer for LLM applications - cut token costs by 50-90% (binary wheel, Python 3.12)"
arch=('x86_64')
url="https://github.com/chopratejas/headroom"
license=('Apache-2.0')
depends=('python312' 'ast-grep')
provides=("headroom-ai=$pkgver")
conflicts=('headroom-ai')
# Prebuilt wheel + vendored .so's: don't strip them or extract a -debug package
# (avoids dangling build-id debug symlinks for the bundled binaries).
options=('!strip' '!debug')

# Upstream switched from pure-Python (hatchling) to Rust+maturin in 0.21.x.
# 0.32.1 ships a stable-ABI cp310-abi3 wheel for x86_64 Linux. We install it into
# a python3.12 venv: abi3 wheels run on any Python >=3.10, and pinning python3.12
# (a fixed-version package) keeps the vendored venv stable across Arch's rolling
# /usr/bin/python bumps.
#
# Arch's python-* ecosystem (tiktoken/pydantic/litellm/...) is built against
# /usr/bin/python (3.14) and is invisible to /usr/bin/python3.12, so we can't
# satisfy headroom's Python deps via regular Arch packages. We vendor them
# into /usr/lib/python3.12/site-packages/ via pip in a transient venv.
#
# The wheel declares fastapi/uvicorn/openai/mcp/onnxruntime/transformers/etc.
# as the `proxy` extra, but headroom.cli imports headroom.proxy unconditionally
# so the [proxy] set is effectively required just for `headroom --help` to load.
_pytag=cp310-abi3-manylinux_2_28_x86_64
_wheel="$_pyname-$pkgver-$_pytag.whl"
source=("$_wheel::https://files.pythonhosted.org/packages/72/b8/16878cf4fe6fc390a0d22025b671468619db690ff14c1b103ace4b5e35f9/$_wheel")
noextract=("$_wheel")
sha256sums=('2efc5cdf681a10c5fc7a2a271a471179c409074537045f682b10e4d724976f46')

build() {
  rm -rf venv
  /usr/bin/python3.12 -m venv venv
  ./venv/bin/python -m pip install --quiet --no-cache-dir --upgrade pip
  ./venv/bin/python -m pip install --no-cache-dir --no-compile "$srcdir/$_wheel[proxy]"
}

package() {
  local sitepkg="$pkgdir/usr/lib/python3.12/site-packages"
  install -dm755 "$sitepkg"

  # Copy the venv's vendored deps, then strip bootstrap + bytecode noise.
  cp -a venv/lib/python3.12/site-packages/. "$sitepkg/"
  rm -rf \
    "$sitepkg"/pip "$sitepkg"/pip-*.dist-info \
    "$sitepkg"/setuptools "$sitepkg"/setuptools-*.dist-info \
    "$sitepkg"/wheel "$sitepkg"/wheel-*.dist-info \
    "$sitepkg"/_distutils_hack "$sitepkg"/pkg_resources \
    "$sitepkg"/distutils-precedence.pth
  find "$sitepkg" -depth -type d -name __pycache__ -exec rm -rf {} +

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/headroom" <<'EOF'
#!/usr/bin/python3.12
import sys
from headroom.cli import main
if __name__ == '__main__':
    sys.exit(main())
EOF
  chmod 755 "$pkgdir/usr/bin/headroom"
}
