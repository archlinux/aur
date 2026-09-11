# Maintainer: Hocking Lee <hockinglee@gmail.com>

# A rebuild of the `clipcat` package from the official repositories, carrying
# patches that make a large clip history cheap to keep. See the patch files for
# the details; in short, starting the daemon no longer decodes every image it
# has ever stored, and the images stay on disk until a clip is actually used.

_pkgname=clipcat
pkgname=clipcat-perf
pkgver=0.26.0
pkgrel=1
pkgdesc="A clipboard manager (patched for large clip histories)"
arch=('x86_64')
url="https://github.com/xrelkd/clipcat"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'protobuf')
provides=("clipcat=$pkgver")
conflicts=('clipcat')
options=('!lto' '!debug')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  '0001-perf-crates-base-keep-clips-listable-without-their-p.patch'
  '0002-perf-crates-server-load-only-the-clips-history-keeps.patch'
  '0003-build-drop-the-git2-dependency-from-build-metadata.patch'
)
sha256sums=('3d20e3bbe7b5b7ac478e10e1892d3978a99f4573ed118574b4d441820cff3d7f'
            'a9ac4502327cc3e422ea6a777929042f66b09a98d89b2b17f8697640697956f8'
            'fabdc32e4c09d5950f9694d47e48dd87d55721f697a9ea55d957d71a5c8cfbe1'
            'fad0d68e267e1f45ad2014c36b17db0bc48c54fa862fbf2d9d8c3e3c47a4af48')

prepare() {
  cd "$_pkgname-$pkgver"

  local _patch
  for _patch in "$srcdir"/*.patch; do
    echo "Applying ${_patch##*/}"
    patch -Np1 -i "$_patch"
  done

  # The patches update Cargo.lock, so fetch after applying them.
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$_pkgname-$pkgver"

  # Pin the target directory: makepkg passes a `CARGO_TARGET_DIR` set in the
  # caller's environment straight through, which would put the binaries
  # somewhere this build does not look.
  export CARGO_TARGET_DIR=target

  # Generated code is `include!`d from `OUT_DIR`, which would otherwise leave
  # the build directory embedded in the binaries.
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/"

  cargo build --frozen --release

  local _cmd _shell
  for _cmd in clipcatd clipcatctl clipcat-menu clipcat-notify; do
    for _shell in bash zsh fish; do
      "target/release/$_cmd" completions "$_shell" > "$_cmd.$_shell"
    done
  done
}

check() {
  cd "$_pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm755 -t "$pkgdir/usr/bin" \
    target/release/clipcat-menu \
    target/release/clipcat-notify \
    target/release/clipcatctl \
    target/release/clipcatd

  local _cmd
  for _cmd in clipcatd clipcatctl clipcat-menu clipcat-notify; do
    install -Dm644 "$_cmd.bash" "$pkgdir/usr/share/bash-completion/completions/$_cmd"
    install -Dm644 "$_cmd.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_cmd"
    install -Dm644 "$_cmd.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_cmd.fish"
  done

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# vim:set ts=2 sw=2 et:
