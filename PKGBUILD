# Maintainer: Ryan & Claude <i@ryanyuan.top>
#
# Packaging of scripts/install-ctl.sh (Linux x86-64 path) from upstream:
#   https://github.com/steelbrain/reims-vgpu
#
# What the script puts in $HOME, this package puts in the system, tracked by pacman:
#   reims-ctl   -> /usr/lib/reims-ctl/bin/reims-ctl, started through /usr/bin/reims-ctl
#                  (a wrapper that sets REIMS_CTL_QEMU to the packaged QEMU)
#   QEMU fork   -> /usr/lib/reims-ctl/qemu         (self-contained prefix, no clash with `qemu`)
#   reims-util  -> /usr/lib/reims-ctl/bin/reims-util, linked from /usr/bin
#
# Build in a clean chroot if you can (pkgctl build / extra-x86_64-build): QEMU's configure
# enables whatever optional libraries it finds, so a clean chroot keeps `depends` exact.

pkgname=reims-vgpu-git
pkgver=r3260.86d49219
pkgrel=1
pkgdesc='Virtual GPU for macOS guests on QEMU/KVM: reims-ctl, patched QEMU and reims-util'
arch=(x86_64)
url='https://github.com/steelbrain/reims-vgpu'
# reims-vgpu itself; the QEMU fork keeps QEMU's own licenses (COPYING is installed too)
license=('GPL-2.0-or-later OR LGPL-3.0-or-later' 'GPL-2.0-only')
depends=(
  # QEMU runtime
  glib2 pixman libslirp zlib pipewire libpulse alsa-lib
  # graphics (SDL3 is built statically into the library and opens these at run time)
  vulkan-icd-loader libdrm mesa libxkbcommon wayland libdecor dbus systemd-libs
  libx11 libxext libxrandr libxcursor libxi libxfixes libxss libxtst
)
makedepends=(git rustup python ninja pkgconf flex bison bzip2 cmake clang lld binutils dtc)
optdepends=(
  'vulkan-radeon: Vulkan driver for AMD GPUs'
  'nvidia-utils: Vulkan driver for NVIDIA GPUs'
  'vulkan-intel: Vulkan driver for Intel GPUs'
)
provides=(reims-vgpu reims-ctl reims-util)
conflicts=(reims-vgpu reims-ctl)
options=(!lto !debug)
install=$pkgname.install

_util_url=https://github.com/steelbrain/reims-util.git
_qemu_url=https://github.com/steelbrain/qemu-reims-vgpu.git
_qemu_prefix=/usr/lib/reims-ctl/qemu

source=("reims-vgpu::git+https://github.com/steelbrain/reims-vgpu.git"
        "qemu-reims-vgpu::git+${_qemu_url}"
        "reims-util::git+${_util_url}")
sha256sums=(SKIP SKIP SKIP)

# The Rust channel rust-toolchain.toml pins. RUSTUP_TOOLCHAIN overrides that file, so rustup
# installs just this channel (minimal profile), not the file's components or macOS targets.
_rust_channel() {
  sed -n 's/^channel *= *"\([^"]*\)".*/\1/p' "$srcdir/reims-vgpu/rust-toolchain.toml"
}

# The reims-util commit reims-ctl installs (crates/reims-ctl/src/reims_util.rs): following it
# keeps this package in step with upstream, with no pin of our own to go stale.
_util_rev() {
  sed -n 's/^pub const REV: &str = "\([0-9a-f]\{40\}\)";.*/\1/p' \
    "$srcdir/reims-vgpu/crates/reims-ctl/src/reims_util.rs"
}

# Cargo's download cache stays in $srcdir, not in ~/.cargo.
_env() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN="$(_rust_channel)"
}

pkgver() {
  cd "$srcdir/reims-vgpu"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/reims-vgpu"

  # vendor/qemu at the commit this checkout pins, from the local mirror makepkg keeps in
  # SRCDEST; QEMU's own submodules are not needed (its configure fetches what it uses).
  git submodule init vendor/qemu
  git config submodule.vendor/qemu.url "$srcdir/qemu-reims-vgpu"
  if ! git -c protocol.file.allow=always submodule update vendor/qemu; then
    warning "the pinned QEMU commit is not in the local mirror: fetching it from $_qemu_url"
    git config --unset submodule.vendor/qemu.url
    git submodule update --init vendor/qemu
  fi

  # reims-util at the commit reims-ctl names.
  local rev; rev="$(_util_rev)"
  [[ -n $rev ]] || { error "no REV found in crates/reims-ctl/src/reims_util.rs"; return 1; }
  grep -qF "${_util_url%.git}" crates/reims-ctl/src/reims_util.rs ||
    warning "reims_util.rs names another repository than ${_util_url%.git}: check the source array"
  git -C "$srcdir/reims-util" checkout --quiet --detach "$rev"

  # Network is used here, and only here (QEMU's configure aside): the toolchain, then every crate.
  _env
  rustup toolchain install "$RUSTUP_TOOLCHAIN" --profile minimal
  # The library's workspace lock records metal2vulkan (a git dependency, pinned by rev) without
  # its source, so --locked cannot be used on it: cargo adds the three source lines itself.
  cargo fetch
  cargo fetch --locked --manifest-path crates/reims-ctl/Cargo.toml
  cargo fetch --locked --manifest-path "$srcdir/reims-util/Cargo.toml"
}

build() {
  _env
  # Everything cargo needs is in CARGO_HOME now. If a step fails for want of network, remove this.
  export CARGO_NET_OFFLINE=true
  cd "$srcdir/reims-vgpu"

  # The library (on Linux the Vulkan platform, in dist-vulkan).
  CARGO_TARGET_DIR="$srcdir/target" cargo xtask dist
  local dist="$srcdir/target/dist-vulkan"
  [[ -f $dist/lib/pkgconfig/reims-vgpu.pc ]] ||
    { error "cargo xtask dist wrote no $dist/lib/pkgconfig/reims-vgpu.pc"; return 1; }

  # QEMU on it (the library is linked statically).
  mkdir -p "$srcdir/qemu-build"
  cd "$srcdir/qemu-build"
  PKG_CONFIG_PATH="$dist/lib/pkgconfig" "$srcdir/reims-vgpu/vendor/qemu/configure" \
    --prefix="$_qemu_prefix" \
    --target-list=x86_64-softmmu --enable-kvm --disable-sdl --disable-gtk --enable-slirp \
    --enable-pvg --disable-docs --disable-tests --disable-werror
  ninja

  # reims-ctl: cargo install --locked --path crates/reims-ctl, as the script does.
  cd "$srcdir/reims-vgpu"
  CARGO_TARGET_DIR="$srcdir/ctl-target" \
    cargo build --release --locked --manifest-path crates/reims-ctl/Cargo.toml

  # reims-util: built from here, so rust-toolchain.toml's channel applies, as in reims_util.rs.
  CARGO_TARGET_DIR="$srcdir/util-target" \
    cargo install --locked --path "$srcdir/reims-util" --root "$srcdir/util-root"
}

package() {
  # QEMU installs straight to its real prefix: no staging and moving, as the script needs.
  DESTDIR="$pkgdir" ninja -C "$srcdir/qemu-build" install >/dev/null
  local root="$pkgdir$_qemu_prefix"
  [[ -x $root/bin/qemu-system-x86_64 ]] || { error "QEMU's install has no qemu-system-x86_64"; return 1; }
  [[ -x $root/bin/qemu-img ]] || { error "QEMU's install has no qemu-img (reims-ctl needs it)"; return 1; }
  find "$root" -name ReimsVgpu.rom -type f | grep -q . ||
    { error "QEMU's install has no ReimsVgpu.rom: was it configured with reims-vgpu?"; return 1; }

  # reims-ctl finds QEMU at ~/.local/share/reims-ctl/qemu/current unless REIMS_CTL_QEMU names a
  # binary (qemu-img is then taken from beside it), so no per-user setup is needed.
  # reims-ctl looks for reims-util beside itself, then on PATH.
  install -Dm755 "$srcdir/ctl-target/release/reims-ctl" "$pkgdir/usr/lib/reims-ctl/bin/reims-ctl"
  install -Dm755 "$srcdir/util-root/bin/reims-util" "$pkgdir/usr/lib/reims-ctl/bin/reims-util"
  install -dm755 "$pkgdir/usr/bin"
  ln -s ../lib/reims-ctl/bin/reims-util "$pkgdir/usr/bin/reims-util"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/reims-ctl" <<'EOF'
#!/bin/sh
# Runs reims-ctl on the packaged QEMU. Set REIMS_CTL_QEMU to use another QEMU binary.
: "${REIMS_CTL_QEMU:=/usr/lib/reims-ctl/qemu/bin/qemu-system-x86_64}"
export REIMS_CTL_QEMU
exec /usr/lib/reims-ctl/bin/reims-ctl "$@"
EOF

  # What the script only warns about, as package files (delete any you do not want):
  # a VM's guest memory takes about 64 kernel mappings per MiB (30 GiB fits in this)...
  echo 'vm.max_map_count = 2097152' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysctl.d/60-reims-ctl.conf"
  # ...and an AMD GPU imports it as dma-bufs made by /dev/udmabuf, which kvm's group may open.
  echo 'udmabuf' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/reims-ctl.conf"
  echo 'KERNEL=="udmabuf", SUBSYSTEM=="misc", GROUP="kvm", MODE="0660"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/udev/rules.d/70-reims-ctl-udmabuf.rules"

  # Licenses: reims-vgpu's (LICENSE names the texts in LICENSES/), QEMU's, reims-util's.
  cd "$srcdir/reims-vgpu"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE LICENSES/*.txt
  install -Dm644 vendor/qemu/COPYING "$pkgdir/usr/share/licenses/$pkgname/QEMU-COPYING"
  install -Dm644 "$srcdir/reims-util/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/reims-util-LICENSE"
}
