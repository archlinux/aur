# Maintainer: eggfriedrice <eggfriedricew.g.o@gmail.com>

# Builds efr from the GitHub tag tarball, with the ghostty screen backend. The
# efr-code-bin package installs the prebuilt release of the same version.
#
# The ghostty screen needs a build of libghostty-vt by Zig 0.16.0 exactly
# (docs/ghostty-pin.md). The Zig of the Arch repositories moves on to 0.17 and
# later, so this package does not use it: it downloads the official Zig 0.16.0
# build from ziglang.org, pinned by its checksum, and uses it only for the
# build. The ghostty source is the commit that the libghostty-vt pin names.
# All downloads happen in the sources and in prepare(); build() needs no network.
pkgname=efr-code
pkgver=0.0.1
pkgrel=1
pkgdesc='Terminal-first AI agent harness that lives in zsh, with a daemon that owns the state'
arch=('x86_64')
url='https://github.com/eggfriedrice24/eggfriedrice.code'
license=('MIT')
depends=('glibc' 'libgcc' 'zsh')
makedepends=('cargo')
# The scope tests of check() run git.
checkdepends=('git')
optdepends=('bubblewrap: the kernel sandbox of the auto mode (also needs Linux 7.1 or newer)'
            'git: project roots and the git facts of a turn'
            'xdg-utils: let efr login openai open the browser with EFR_OPEN_BROWSER=1')
conflicts=("$pkgname-bin")
install=efr-code.install
# The -flto of makepkg.conf makes GCC write LTO bytecode into the C objects of
# aws-lc-sys, which the lld of rustc cannot link. The Cargo profile has its own LTO.
options=('!lto')
# The ghostty commit of the libghostty-vt pin, and the Zig release it needs.
# Change them together with docs/ghostty-pin.md.
_ghostty=22d13172cde98a0a4dda05d3d6a3fcb0dd8ed018
_zig=0.16.0
_src="eggfriedrice.code-$pkgver"
_zigdir="zig-$CARCH-linux-$_zig"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "ghostty-$_ghostty.tar.gz::https://github.com/ghostty-org/ghostty/archive/$_ghostty.tar.gz"
        "https://ziglang.org/download/$_zig/$_zigdir.tar.xz")
# The first sum is filled in for each release by .github/workflows/aur.yml from
# the tag tarball. The other two are pinned: the ghostty archive of the commit,
# and the Zig tarball whose SHA-256 ziglang.org publishes in
# https://ziglang.org/download/index.json
# (70e49664a74374b48b51e6f3fdfbf437f6395d42509050588bd49abe52ba3d00).
b2sums=('29ddaf4ae7516fd0d5bbbe6646ac98cd2edbc6cf481194c58f472d67b2098164f3242dc3f02ba256d5d55e82924013e60fc8adbfb6ff97451c7cc68829299911'
        '04e7fc2104a5e6bccbe5b189f5dcc4e3abf0a80410764f6ae44fcd042ca952250df08f6e60631653b00b7202dd1d906ca6033ad66a2ecb1cfa2935496120daef'
        '77f476c241e6be49e8e71a98276261bdc8cc0bb90aca277f2d81413fe373d94c442df5277cf4cd0893b986b4c6c2a6f8b2061c9305fe8445883316899ff67958')

# Keep debug info in the binaries so makepkg can split it into the -debug package.
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# aws-lc-sys (under rustls) must build its jitter entropy source with -O0 and fails
# with any other level. cc appends CFLAGS last, so the -O2 of makepkg.conf would win.
# Without a -O in CFLAGS, cc takes the level of the Cargo profile, so the rest of the
# C code stays optimized.
_drop_cflags_optimization() {
  local flag kept=()
  for flag in $CFLAGS; do
    [[ $flag == -O* ]] || kept+=("$flag")
  done
  export CFLAGS="${kept[*]}"
}

prepare() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple

  # The Zig packages of the ghostty build. Zig 0.16 fetches them into zig-pkg/ of
  # the ghostty source, where build() finds them. A lazy package is fetched only
  # when the build asks for it, and --help asks for the ones of these options, so
  # they must stay the options that libghostty-vt-sys's build.rs passes at the
  # pinned rev; zig build --fetch=all would fetch about 550 MB instead of 20 MB.
  cd "$srcdir/ghostty-$_ghostty"
  "$srcdir/$_zigdir/zig" build --global-cache-dir "$srcdir/zig-global-cache" \
    -Demit-lib-vt=true -Doptimize=ReleaseFast -Dcpu=baseline \
    -Demit-xcframework=false -Dapp-runtime=none --help > /dev/null
}

build() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # libghostty-vt-sys runs zig from PATH and builds this ghostty source with the
  # packages from prepare(); docs/ghostty-pin.md lists its variables.
  export PATH="$srcdir/$_zigdir:$PATH"
  export GHOSTTY_SOURCE_DIR="$srcdir/ghostty-$_ghostty"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
  export LIBGHOSTTY_VT_SYS_CPU=baseline
  _drop_cflags_optimization
  # The packages and the feature of `just build-release`.
  cargo build --frozen --release -p efr-daemon -p efr-cli -p efr-sbx \
    --features efr-daemon/screen-ghostty

  # A build with the sandbox's test seams lets a test replace the launcher and the
  # probe; it must never ship.
  if [[ "$(target/release/efrd --test-seams)" != off ]]; then
    echo "target/release/efrd has the test-sandbox-fake feature" >&2
    return 1
  fi
}

check() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The leaf crates of the justfile, as `just test-leaf` runs them. The other tests
  # need a real zsh session, bubblewrap and a kernel sandbox, which a build chroot
  # does not have.
  local crate crates args=()
  read -ra crates <<<"$(sed -nE 's/^leaf_crates := "(.*)"$/\1/p' justfile)"
  if (( ${#crates[@]} == 0 )); then
    echo "no leaf_crates in the justfile" >&2
    return 1
  fi
  for crate in "${crates[@]}"; do
    args+=(-p "$crate")
  done
  _drop_cflags_optimization
  INSTA_UPDATE=no cargo test --frozen "${args[@]}" --lib --tests
}

package() {
  cd "$_src"
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/efr target/release/efrd
  # efrd finds its sandbox launcher in ../lib/efr/ next to its own directory. It is
  # never on PATH.
  install -Dm0755 -t "$pkgdir/usr/lib/efr/" target/release/efr-sbx
  install -Dm0644 -t "$pkgdir/usr/share/zsh/plugins/efr/" shell/zsh/efr.plugin.zsh
  # The unit of `just install` with the daemon in /usr/bin.
  install -dm0755 "$pkgdir/usr/lib/systemd/user"
  sed 's|^ExecStart=%h/\.local/bin/efrd$|ExecStart=/usr/bin/efrd|' systemd/efrd.service \
    > "$pkgdir/usr/lib/systemd/user/efrd.service"
  grep -qx 'ExecStart=/usr/bin/efrd' "$pkgdir/usr/lib/systemd/user/efrd.service"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/efr-code/" README.md \
    docs/config.md docs/permissions.md docs/sandbox.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/efr-code/examples/" crates/efr-config/examples/config.toml
}
