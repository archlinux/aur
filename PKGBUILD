# Maintainer: Olaf Wriggers <olaf@olwig.xyz>

pkgname=grok-build-git
_pkgname=grok-build
pkgver=r39.9684fa3
pkgrel=2
pkgdesc="SpaceXAI's coding agent harness and TUI. Fullscreen, mouse interactive, extensible."
arch=('x86_64' 'aarch64')
url="https://x.ai/build"
license=('Apache-2.0')
provides=('grok')
conflicts=('grok')
options=('!strip' '!debug' '!emptydirs')

makedepends=("git" "curl")
backup=('etc/grok/requirements.toml')

source=(
  "$_pkgname::git+https://github.com/xai-org/grok-build.git"
  "requirements.toml"
)

b2sums=(
  "SKIP"
  "4d37a050b4fa861b2ee076940908f4dfef7419e6297425bb3dfe6c26fcb9440b01befff1837451b9bed194ee45a3f52e30b040bd356b32a5bb178ede6aea694e"
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# TODO default "ultra" sandbox -> https://docs.x.ai/build/features/sandbox
# TODO restrict with explicit local grok user

prepare() {
  cd "$srcdir/$_pkgname"

  cargo_toml="crates/codegen/xai-grok-pager-bin/Cargo.toml"
  upstream_license=$(grep '^license =' "$cargo_toml" | cut -d '"' -f2)
  if [[ "$license" != "$upstream_license" ]]; then
    echo "License mismatch: $cargo_toml license is $upstream_license, but PKGBUILD license is $license"
    exit 1
  fi
  # TODO check also LICENSE file

}

build() {
  cd "$srcdir/$_pkgname"
  
  export RUSTUP_HOME="$srcdir/rustup"
  export CARGO_HOME="$srcdir/cargo"
  export PATH="$CARGO_HOME/bin:$PATH"
  export RUSTUP_INIT_SKIP_PATH_CHECK=yes

  rm -rf "$RUSTUP_HOME" "$CARGO_HOME"

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain none  
  rustup show

  # ring, used by xai-grok-tools, fails to link when -flto is present in CFLAGS
  # same for lzma and zstd, since moved install dotslash from prepare to build
  unset CFLAGS 

  cargo install dotslash
  cargo build -p xai-grok-pager-bin --release 

  binary="$srcdir/$_pkgname/target/release/xai-grok-pager"
  chmod +x "$binary"

  cargo_toml="crates/codegen/xai-grok-pager-bin/Cargo.toml"
  upstream_version=$(grep '^version =' "$cargo_toml" | cut -d '"' -f2)
  binary_version=$("$binary" --version | awk '{print $2}')
  if [[ "$binary_version" != "$upstream_version" ]]; then
    echo "Version mismatch: built binary version is $binary_version, but upstream version is $upstream_version"
    exit 1
  fi
}

package() {
  binary="$srcdir/$_pkgname/target/release/xai-grok-pager"

  install -Dm755 "$binary" "$pkgdir/usr/bin/grok"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/requirements.toml" "$pkgdir/etc/grok/requirements.toml"

  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"

  "$pkgdir/usr/bin/grok" completions bash > "$pkgdir/usr/share/bash-completion/completions/grok" || true
  "$pkgdir/usr/bin/grok" completions zsh  > "$pkgdir/usr/share/zsh/site-functions/_grok" || true
  "$pkgdir/usr/bin/grok" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/grok.fish" || true
}
