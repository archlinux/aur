# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
# Contributor: Python Shell <pythonshell@yeah.net>

pkgname=cbmc
pkgver=6.7.1
pkgrel=2
pkgdesc='C Bounded Model Checker'
arch=('x86_64')
url='https://diffblue.github.io/cbmc'
license=('BSD-4-Clause-UC')
depends=('gcc-libs')
makedepends=('git')
changelog=CHANGELOG
_minisatver=2.2.1
source=(
  "https://github.com/diffblue/cbmc/archive/refs/tags/cbmc-$pkgver.tar.gz"
  "https://ftp.debian.org/debian/pool/main/m/minisat2/minisat2_$_minisatver.orig.tar.gz")
b2sums=('db85af19f003a6389716b16aa2bd99fe2022ab65851750fb899796ffb62838284647e8bd573637b7cd4113be3d686b636fcba06155deec57b0d889f137b0e897'
        'de9bded4bd8a17ec157af486c0572d47429cd0f59bdd57e1238d3c031d7406dc4e305e5e7368898c991e0184ed845bae21717f10a8ba36ea6b60aac0fb84dc71')

prepare() {
  mv "minisat2-$_minisatver" "minisat-$_minisatver"
  mv "minisat-$_minisatver" "$srcdir/cbmc-cbmc-$pkgver"

  cd "$srcdir/cbmc-cbmc-$pkgver/minisat-$_minisatver"
  patch -p1 < "../scripts/minisat-$_minisatver-patch"
}

build() {
  LINKFLAGS="$LDFLAGS" make -C "$srcdir/cbmc-cbmc-$pkgver/src"
}

package() {
  cd "$srcdir/cbmc-cbmc-$pkgver"

  local -a binaries=(
    cbmc/cbmc
    cprover/cprover
    crangler/crangler
    goto-analyzer/goto-analyzer
    goto-cc/goto-cc
    goto-diff/goto-diff
    goto-harness/goto-harness
    goto-inspect/goto-inspect
    goto-instrument/goto-instrument
    goto-synthesizer/goto-synthesizer
    memory-analyzer/memory-analyzer
    solvers/smt2_solver
    symtab2gb/symtab2gb
  )

  for binary in "${binaries[@]}"; do
    install -Dm755 -t "$pkgdir/usr/bin" "src/$binary"

    local manpage="doc/man/${binary##*/}.1"
    [[ -e "$manpage" ]] && install -Dm644 -t "$pkgdir/usr/share/man/man1" $manpage
  done

  ln -s "goto-cc" "$pkgdir/usr/bin/goto-gcc"
  ln -s "goto-cc" "$pkgdir/usr/bin/goto-ld"
  ln -s "goto-cc.1.gz" "$pkgdir/usr/share/man/man1/goto-gcc.1.gz"
  ln -s "goto-cc.1.gz" "$pkgdir/usr/share/man/man1/goto-ld.1.gz"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
