# Maintainer: Nicholas Schlabach <Techcable@techcable.net>
pkgname=ripgrep-simd
pkgver=0.5.0
pkgrel=1
pkgdesc="SIMD-accelerated ripgrep - A search tool that combines the usability of ag with the raw speed of grep"
arch=('i686' 'x86_64')
url="https://github.com/BurntSushi/ripgrep"
license=('MIT' 'UNLICENSE')
makedepends=('rustup')  # We must use rustup for proper nightly support
provides=("ripgrep=$pkgver")
conflicts=('ripgrep' 'ripgrep-git')
source=("https://github.com/BurntSushi/ripgrep/archive/$pkgver.tar.gz")
sha512sums=('924e7907daf719732f888c296ea8b110db77e144cd3f7858070aca44fba93d09731d9097dd7201a851f0581ced0f0d58a7ffef6aa7c998298834170661d80256')

checkCpu() {
  feature="$1"
  if [ ! -f /proc/cpuinfo ]; then
      echo "Couldn't find /proc/cpuinfo";
      exit 1;
  fi;
  echo "Checking for $feature"
  grep -q "$feature" /proc/cpuinfo;
  # NOTE: Bash violates tradition and uses 0 for true and 1 for false
  case $? in
    0)
      return 0; # grep found the feature
      ;;
    1)
      return 1; # grep didn't find the feature
      ;;
    *)
      echo "Error checking for $feature in /proc/cpuinfo";
      exit 1;
      ;;
   esac;
   echo "Unreachable";
   exit 1;
}

build() {
  cd "ripgrep-$pkgver"
  if checkCpu sse2; then
    echo "SIMD support found"
    if checkCpu avx; then
      echo "AVX support found"
      FEATURES="simd-accel avx-accel"
    else
      echo "AVX support missing!"
      FEATURES="simd-accel"
    fi;
  else
    echo "SIMD support missing"
    FEATURES=""
  fi;

  ARGS=(
    "--release" # Compile an optimized build
    "--features" "$FEATURES" # Use SIMD and AVX if possible
    "--" "-C" "lto" # Enable LTO, which is disabled by default (see ripgrep#325)
  )

  # Tell all crates to compile for the native CPU, to both improve performance,
  # and to allow the compiler to emit AVX and SIMD instructions if possible
  RUSTFLAGS="-C target-cpu=native" \
      rustup run nightly cargo rustc "${ARGS[@]}"
}

package() {
  cd "ripgrep-$pkgver"

  install -Dm755 "target/release/rg" "$pkgdir/usr/bin/rg"

  install -Dm644 "target/release/build/ripgrep-"*/out/rg.bash-completion "$pkgdir/usr/share/bash-completion/completions/rg"
  install -Dm644 "target/release/build/ripgrep-"*/out/_rg "$pkgdir/usr/share/zsh/site-functions/_rg"
  install -Dm644 "target/release/build/ripgrep-"*/out/rg.fish "$pkgdir/usr/share/fish/completions/rg.fish"

  install -Dm644 "doc/rg.1" "$pkgdir/usr/share/man/man1/rg.1"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ripgrep/README.md"

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/ripgrep/COPYING"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/ripgrep/LICENSE-MIT"
  install -Dm644 "UNLICENSE" "$pkgdir/usr/share/licenses/ripgrep/UNLICENSE"
}
