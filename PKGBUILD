# Maintainer: eggfriedrice <eggfriedricew.g.o@gmail.com>

# Builds efr from the newest commit of main, with the ghostty screen backend. The
# efr-code package builds the release tag, and efr-code-bin installs its build.
#
# The ghostty screen needs a build of libghostty-vt by the exact Zig that
# docs/ghostty-pin.md pins, from the ghostty commit that it names. Both move on main,
# so this package reads them from that file of the checkout in prepare(). It fetches
# ghostty by its commit, and it checks the official Zig build from ziglang.org with
# the minisign key of the Zig project. It does not use the Zig of the Arch
# repositories. All downloads happen in the sources and in prepare(); build() needs
# no network.
pkgname=efr-code-git
pkgver=0.0.6.r2250.g8bb1c161
pkgrel=1
pkgdesc='Terminal-first AI agent harness that lives in zsh, with a daemon that owns the state (main branch)'
arch=('x86_64')
url='https://github.com/eggfriedrice24/eggfriedrice.code'
license=('MIT')
depends=('glibc' 'libgcc' 'zsh')
makedepends=('cargo' 'git' 'minisign')
# check() runs the tests with nextest, as CI does; the scope tests run git.
checkdepends=('cargo-nextest' 'git')
optdepends=('bubblewrap: the kernel sandbox of the auto mode (also needs Linux 7.1 or newer)'
            'fzf: the live search picker of ,resume (0.46 or newer)'
            'git: project roots and the git facts of a turn'
            'xdg-dbus-proxy: read-only system queries in the auto mode (0.1.9 or newer)'
            'xdg-utils: let efr login openai open the browser with EFR_OPEN_BROWSER=1')
provides=("efr-code=${pkgver%%.r*}")
conflicts=('efr-code' 'efr-code-bin')
# The same file as packaging/efr-code/efr-code.install.
install=efr-code.install
# The -flto of makepkg.conf makes GCC write LTO bytecode into the C objects of
# aws-lc-sys, which the lld of rustc cannot link. The Cargo profile has its own LTO.
options=('!lto')
source=("$pkgname::git+$url.git#branch=main")
b2sums=('SKIP')
# The minisign key of the Zig project, as https://ziglang.org/download/ shows it.
_zig_key='RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U'

# Keep debug info in the binaries so makepkg can split it into the -debug package.
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# The release version of the workspace, the number of commits and the short commit.
# The count only grows on main, so a newer commit always has a higher pkgver.
pkgver() {
  cd "$pkgname"
  local version
  version="$(sed -nE '/^\[workspace\.package\]/,/^\[/s/^version = "([^"]+)"/\1/p' Cargo.toml)"
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

# The ghostty commit and the Zig version of docs/ghostty-pin.md in the checkout.
_pin_ghostty() {
  sed -nE 's/^\| ghostty \| `([0-9a-f]{40})`.*/\1/p' "$srcdir/$pkgname/docs/ghostty-pin.md"
}
_pin_zig() {
  sed -nE 's/^\| Zig \| ([0-9]+\.[0-9]+\.[0-9]+) exactly.*/\1/p' "$srcdir/$pkgname/docs/ghostty-pin.md"
}

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
  local ghostty zig zigdir
  ghostty="$(_pin_ghostty)"
  zig="$(_pin_zig)"
  if [[ -z "$ghostty" || -z "$zig" ]]; then
    echo "no ghostty commit or Zig version in docs/ghostty-pin.md" >&2
    return 1
  fi
  zigdir="zig-$CARCH-linux-$zig"

  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple

  # Zig of the pin, checked against the key of the Zig project before it runs.
  cd "$srcdir"
  rm -rf zig "$zigdir" "$zigdir.tar.xz" "$zigdir.tar.xz.minisig"
  curl -fsSL --retry 3 -o "$zigdir.tar.xz" "https://ziglang.org/download/$zig/$zigdir.tar.xz"
  curl -fsSL --retry 3 -o "$zigdir.tar.xz.minisig" "https://ziglang.org/download/$zig/$zigdir.tar.xz.minisig"
  minisign -V -q -P "$_zig_key" -m "$zigdir.tar.xz"
  mkdir zig
  tar -xJf "$zigdir.tar.xz" -C zig --strip-components=1

  # ghostty at the commit of the pin. git checks the commit by its hash.
  rm -rf ghostty
  git init -q ghostty
  git -C ghostty fetch -q --depth 1 https://github.com/ghostty-org/ghostty.git "$ghostty"
  git -C ghostty -c advice.detachedHead=false checkout -q FETCH_HEAD

  # The Zig packages of the ghostty build. Zig fetches them into zig-pkg/ of the
  # ghostty source, where build() finds them. A lazy package is fetched only when
  # the build asks for it, and --help asks for the ones of these options, so they
  # must stay the options that libghostty-vt-sys's build.rs passes; zig build
  # --fetch=all would fetch about 550 MB instead of 30 MB.
  cd "$srcdir/ghostty"
  ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache" "$srcdir/zig/zig" build \
    -Demit-lib-vt=true -Doptimize=ReleaseFast -Dcpu=baseline \
    -Demit-xcframework=false -Dapp-runtime=none --help > /dev/null
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # libghostty-vt-sys runs zig from PATH and builds this ghostty source with the
  # packages from prepare(); docs/ghostty-pin.md lists its variables.
  export PATH="$srcdir/zig:$PATH"
  export GHOSTTY_SOURCE_DIR="$srcdir/ghostty"
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
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The leaf crates of the justfile, as `just test-leaf` runs them. The other tests
  # need a real zsh session, bubblewrap and a kernel sandbox, which a build chroot
  # does not have. nextest runs each test in a process of its own, as the tests
  # expect: some of them install a log subscriber for their thread only.
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
  INSTA_UPDATE=no cargo nextest run --frozen "${args[@]}" --lib --tests
}

package() {
  cd "$pkgname"
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
  # Each background job runs in a cgroup of its own below efrd's (ADR 0021).
  grep -qx 'Delegate=yes' "$pkgdir/usr/lib/systemd/user/efrd.service"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/efr-code/" README.md \
    docs/config.md docs/permissions.md docs/sandbox.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/efr-code/examples/" crates/efr-config/examples/config.toml
}
