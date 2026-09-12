# Maintainer: aura-deak <https://github.com/aura-deak>
pkgname=mmlang
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Mobius Machine toolchain - assembler, VM and debugger for an esoteric language"
arch=('any')
url="https://github.com/aura-deak/MMLang"
license=('Apache-2.0')
depends=('python' 'python-bitarray')
provides=('mmlang')
conflicts=('mmlang-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aura-deak/MMLang/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3bcfdd0278ba67cc92113d405b7bc8b4e6f06f0a67ca5cc56027b8c79ca31184')

package() {
  cd "MMLang-$pkgver"

  install -d "$pkgdir/usr/share/mmlang"
  install -Dm644 common.py          "$pkgdir/usr/share/mmlang/common.py"
  install -Dm644 asm_core.py        "$pkgdir/usr/share/mmlang/asm_core.py"
  install -Dm644 vm_core.py         "$pkgdir/usr/share/mmlang/vm_core.py"
  install -Dm644 data_tape_maker.py "$pkgdir/usr/share/mmlang/data_tape_maker.py"
  install -Dm644 asm.py             "$pkgdir/usr/share/mmlang/asm.py"
  install -Dm644 run.py             "$pkgdir/usr/share/mmlang/run.py"
  install -Dm644 debug.py           "$pkgdir/usr/share/mmlang/debug.py"
  [ -f requirements.txt ] && install -Dm644 requirements.txt "$pkgdir/usr/share/mmlang/requirements.txt"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/mmlang-asm" <<'WRAPPER'
#!/bin/sh
exec python /usr/share/mmlang/asm.py "$@"
WRAPPER
  chmod 755 "$pkgdir/usr/bin/mmlang-asm"

  cat > "$pkgdir/usr/bin/mmlang-run" <<'WRAPPER'
#!/bin/sh
exec python /usr/share/mmlang/run.py "$@"
WRAPPER
  chmod 755 "$pkgdir/usr/bin/mmlang-run"

  cat > "$pkgdir/usr/bin/mmlang-debug" <<'WRAPPER'
#!/bin/sh
exec python /usr/share/mmlang/debug.py "$@"
WRAPPER
  chmod 755 "$pkgdir/usr/bin/mmlang-debug"

  cat > "$pkgdir/usr/bin/mmlang" <<'WRAPPER'
#!/bin/sh
echo "Usage: mmlang-asm | mmlang-run | mmlang-debug"
echo "  mmlang-asm   - assemble .mmlang -> .mmbin"
echo "  mmlang-run   - execute .mmbin"
echo "  mmlang-debug - step debugger"
exit 1
WRAPPER
  chmod 755 "$pkgdir/usr/bin/mmlang"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  if [ -d doc ]; then
    install -Dm644 doc/*.md -t "$pkgdir/usr/share/doc/$pkgname/" 2>/dev/null || true
  fi
}
