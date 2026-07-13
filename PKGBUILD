# Maintainer: Austin Choi <austin.c.percussion@gmail.com>
pkgname=dusk-lang-git
pkgver=1.3.1.r0.g131a93b
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
source=("dusk::git+https://github.com/choice404/dusk.git"
        "dusk.ll.xz::https://github.com/choice404/dusk/releases/latest/download/dusk.ll.xz"
        "dusk-artifact-sums::https://github.com/choice404/dusk/releases/latest/download/sha256sums")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd dusk
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # The release's own sums file carries the hash the release's stage ladder
  # printed, so the IR being linked below is the IR the release proved.
  cd "$srcdir"
  grep ' dusk.ll.xz$' dusk-artifact-sums | sha256sum -c -
}

build() {
  cd dusk
  # No Rust toolchain here: link the release IR artifact into a seed
  # compiler with clang, then have the seed self-build this source tree.
  # Each self build peaks around 11GB, so it runs caged.
  xz -dkc ../dusk.ll.xz > seed.ll
  clang seed.ll runtime/*.c -pthread -lm -o seed
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
