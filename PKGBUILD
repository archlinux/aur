# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=headroom-ai-bin
_pyname=headroom_ai
pkgver=0.22.3
pkgrel=1
pkgdesc="Context optimization layer for LLM applications - cut token costs by 50-90% (binary wheel, Python 3.12)"
arch=('x86_64')
url="https://github.com/chopratejas/headroom"
license=('Apache-2.0')
depends=('python312')
provides=("headroom-ai=$pkgver")
conflicts=('headroom-ai')

# Upstream switched from pure-Python (hatchling) to Rust+maturin in 0.21.x.
# 0.22.3 ships only platform-specific wheels (no sdist); the highest cp* wheel
# available for x86_64 Linux is cp312, so this package targets python312.
_pytag=cp312-cp312-manylinux_2_28_x86_64
_wheel="$_pyname-$pkgver-$_pytag.whl"
source=("$_wheel::https://files.pythonhosted.org/packages/ab/c6/7e224ca5b3de2cb54eb2117d1d0b1160687eff6e13ef19fbb81b10b527ae/$_wheel")
noextract=("$_wheel")
sha256sums=('dc5fff2cd99380f9229477cc5957e97661cb5a71bfbbe25a6ae225acfd97cddb')
install="$pkgname.install"

package() {
  local sitepkg="$pkgdir/usr/lib/python3.12/site-packages"
  install -dm755 "$sitepkg"
  bsdtar -xf "$srcdir/$_wheel" -C "$sitepkg"

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
