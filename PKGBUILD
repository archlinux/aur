# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Jiri Pospisil <jiri@jpospisil.com>
# Contributor: Python Shell <pythonshell@yeah.net>

pkgname=cbmc
pkgver=6.11.0
pkgrel=1
pkgdesc='C Bounded Model Checker'
arch=('x86_64')
url='https://diffblue.github.io/cbmc'
license=('BSD-4-Clause-UC')
depends=('gcc-libs')
makedepends=('git')
# checkdepends=('python3' 'gdb')
changelog=CHANGELOG
_minisatver=2.2.1
source=(
  "https://github.com/diffblue/cbmc/archive/refs/tags/cbmc-$pkgver.tar.gz"
  "https://ftp.debian.org/debian/pool/main/m/minisat2/minisat2_$_minisatver.orig.tar.gz"
  fix-gcc-warnings.patch)
b2sums=('189ba600dc1d65e22440a6def58f7ace873ac686e979f4f92490ef3b661b7ff30c5a6f4f84360e63da75cf0f14207e94789874f9f1509ee819cc3157b8da7459'
        'de9bded4bd8a17ec157af486c0572d47429cd0f59bdd57e1238d3c031d7406dc4e305e5e7368898c991e0184ed845bae21717f10a8ba36ea6b60aac0fb84dc71'
        '903f3df45b925437f9a85f6b96ec40d9c1a06e6f1428888bf85aee6b8799c7603df3ffc7b6963564ed471fff9030c0d836ac7234ac3bfec61d2a09fba544e20a')

prepare() {
  mv "minisat2-$_minisatver" "minisat-$_minisatver"
  mv "minisat-$_minisatver" "$srcdir/cbmc-cbmc-$pkgver"

  cd "$srcdir/cbmc-cbmc-$pkgver"
  patch -d "minisat-$_minisatver" -p1 < "scripts/minisat-$_minisatver-patch"
  patch -p1 < ../fix-gcc-warnings.patch
}

build() {
  LINKFLAGS="$LDFLAGS" make -C "$srcdir/cbmc-cbmc-$pkgver/src"
}

# Tests are expensive and a little flaky
# check() {
#   cd "$srcdir/cbmc-cbmc-$pkgver"
#   ulimit -c 0 # disable coredumps
#   # make -C regression test # commented out because "Failing_Assert1" fails
#   make -C unit test # "smt2_incremental_decision_procedure" and "variable_sensitivity_test_helpers" fail in `pkgctl build` container
# }

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
