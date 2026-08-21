# Maintainer: Austin Choi <austin.c.percussion@gmail.com>
pkgname=dusk-lang-git
pkgver=0.3.2.r0.g31fc15b
pkgrel=1
pkgdesc="Compiler for the dusk programming language, a systems language with generational memory safety (development build)"
# The seed IR artifact pins the x86_64 linux triple; other platforms bootstrap
# through the dusk-rust archive's tag walk instead.
arch=('x86_64')
url="https://github.com/choice404/dusk"
license=('MIT OR Apache-2.0')
# dusk shells out to clang at run time to link, and the textual IR it emits
# targets exactly one LLVM major version, so pin to LLVM 22.x on both ends.
depends=('clang>=22' 'clang<23')
makedepends=('git' 'xz')
optdepends=('git: package fetching through the dawn tool')
provides=('dusk-lang')
conflicts=('dusk-lang' 'dawn')
# The seed release the bootstrap starts from. Pinned to a tagged, immutable
# URL under a versioned filename with a real checksum, so a new release never
# collides with a cached download and the IR linked below is exactly the IR
# that release's stage ladder proved. A release binary is guaranteed to build
# the next release's source, so bump this pin as the tree moves ahead; the
# preflight in build() names the mismatch loudly when the pin has gone stale.
_seedver=1.14.0
source=("dusk::git+https://github.com/choice404/dusk.git"
        "dusk-seed-${_seedver}.ll.xz::https://github.com/choice404/dusk/releases/download/v${_seedver}/dusk.ll.xz")
sha256sums=('SKIP'
            '9371fc719e1ceea9377d4bd6130c3368de412f7866c5ca1b42a7697b9f73d94a')

pkgver() {
  cd dusk
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd dusk
  # No Rust toolchain here: link the release IR artifact into a seed
  # compiler with clang, then have the seed self-build this source tree.
  # Each self build peaks around 11GB, so it runs caged.
  xz -dkc "../dusk-seed-${_seedver}.ll.xz" > seed.ll
  clang seed.ll runtime/*.c -pthread -lm -o seed
  # Preflight: a release binary is guaranteed to build only the very next
  # release's source, so the pinned seed must be at least the newest tag older
  # than this source's own version. A stale pin fails here with the reason,
  # instead of mid-build with an undefined-name error.
  seed_ver=$(./seed version | awk '{print $2}')
  # The version lives in compiler/version.dusk since 1.14.0 and in
  # compiler/dusk.dusk before it; read whichever this checkout carries.
  src_ver=$(grep -ohE 'return "(dusk )?[0-9]+\.[0-9]+\.[0-9]+"' compiler/version.dusk compiler/dusk.dusk 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
  if [ -z "$src_ver" ]; then
    echo "ERROR: cannot read the source version from compiler/version.dusk or compiler/dusk.dusk" >&2
    return 1
  fi
  min_seed=$(git tag -l 'v*' | sed 's/^v//' | grep -vx "$src_ver" | sort -V | tail -1)
  echo "seed compiler: $seed_ver, source: $src_ver, minimum seed: $min_seed"
  if [ -n "$min_seed" ] && [ "$(printf '%s\n%s\n' "$min_seed" "$seed_ver" | sort -V | head -1)" != "$min_seed" ]; then
    echo "ERROR: the published seed release ($seed_ver) is older than this source needs ($min_seed)." >&2
    echo "Upstream has not yet published the current release's artifacts; install a release" >&2
    echo "package instead, or wait for the v$src_ver release to appear on GitHub." >&2
    return 1
  fi
  DUSK_HOME="$PWD" timeout 600 bash -c 'ulimit -v 25165824; ulimit -t 900; exec nice -n 19 ./seed build compiler/dusk.dusk'
  DUSK_HOME="$PWD" timeout 600 bash -c 'ulimit -v 25165824; ulimit -t 900; exec nice -n 19 target/dusk-out/dusk build compiler/dawn.dusk'
}

check() {
  cd dusk
  # The freshly built compiler must pass the full golden suite through the
  # runner it builds itself.
  DUSK_HOME="$PWD" timeout 600 bash -c 'ulimit -v 25165824; ulimit -t 900; exec nice -n 19 target/dusk-out/dusk build tests/runner/testrun.dusk'
  DUSK_HOME="$PWD" DUSK_BIN=target/dusk-out/dusk timeout 3000 bash -c 'ulimit -v 12582912; ulimit -t 3600; exec nice -n 19 target/dusk-out/testrun tests/goldens.manifest'
}

package() {
  cd dusk
  install -Dm755 target/dusk-out/dusk "$pkgdir/usr/bin/dusk"
  install -Dm755 target/dusk-out/dawn "$pkgdir/usr/bin/dawn"
  install -dm755 "$pkgdir/usr/share/dusk-lang"
  cp -r lib runtime "$pkgdir/usr/share/dusk-lang/"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 spec.md "$pkgdir/usr/share/doc/$pkgname/spec.md"
}
