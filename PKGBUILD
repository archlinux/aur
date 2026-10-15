# Maintainer: Kunobi Ninja <feedback@kunobi.ninja>
# This PKGBUILD is generated/updated by kunobi-ninja/kache CI on each stable
# release (pkgver + checksums refreshed, then pushed to the AUR). It installs
# the official prebuilt, statically linked musl binary from GitHub Releases.
pkgname=kache-bin
pkgver=1.2.2
pkgrel=1
pkgdesc='Content-addressed zero-copy build cache for Rust, C/C++ and more (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/kunobi-ninja/kache'
license=('Apache-2.0')
provides=('kache')
conflicts=('kache')
source_x86_64=("kache-$pkgver-x86_64.tar.gz::https://github.com/kunobi-ninja/kache/releases/download/v$pkgver/kache-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("kache-$pkgver-aarch64.tar.gz::https://github.com/kunobi-ninja/kache/releases/download/v$pkgver/kache-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('f2f6555dee50945c2a90a7fb793c2084a00cc6459d08ac2306d38d905064321b')
sha256sums_aarch64=('38856cee613f6ee0ec579099fc9205b840a0b45bb763f4b8fa782d25d93c18ef')

package() {
  cd "$srcdir"

  # Shell completions (kache ships a `completions` subcommand). Runs the
  # freshly-extracted native binary on the matching-arch build host.
  ./kache completions bash   > kache.bash
  ./kache completions zsh    > kache.zsh
  ./kache completions fish   > kache.fish
  ./kache completions elvish > kache.elvish

  install -Dm0755 kache        "$pkgdir/usr/bin/kache"
  install -Dm0644 kache.bash   "$pkgdir/usr/share/bash-completion/completions/kache"
  install -Dm0644 kache.zsh    "$pkgdir/usr/share/zsh/site-functions/_kache"
  install -Dm0644 kache.fish   "$pkgdir/usr/share/fish/vendor_completions.d/kache.fish"
  install -Dm0644 kache.elvish "$pkgdir/usr/share/elvish/lib/kache.elv"

  # Compiler-name farm (ccache's /usr/lib/ccache). Keep in sync with
  # compiler::shim::SHIM_NAMES. Symlink target is the installed path, not
  # the extracted srcdir binary.
  install -d "$pkgdir/usr/lib/kache"
  for name in cc c++ gcc g++ clang clang++ cargo; do
    ln -s /usr/bin/kache "$pkgdir/usr/lib/kache/$name"
  done
  # Marks the farm so another kache on PATH skips it (see
  # compiler::shim::SHIM_DIR_MARKER).
  install -Dm0644 /dev/null "$pkgdir/usr/lib/kache/.kache-shims"
}
