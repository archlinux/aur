# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>

# Split package: scdr (MPL-2.0) and scx-devbox (GPL-2.0, a sched_ext
# scheduler). Building scx-devbox needs a running kernel with sched_ext.
pkgbase=scdr
pkgname=('scdr' 'scx-devbox')
pkgver=0.4.2
pkgrel=1
pkgdesc="Process scheduling and priority daemon for EEVDF and sched_ext kernels"
arch=('x86_64' 'aarch64')
url="https://github.com/asafelobotomy/scdr"
license=('MPL-2.0')
makedepends=('cargo' 'clang' 'bpf' 'libbpf' 'libelf' 'zlib' 'dbus' 'systemd')
# The source archive the release workflow uploads (git archive of the tag),
# not GitHub's generated /archive/ tarball, whose bytes aren't guaranteed.
# The release's `aur` artifact has this PKGBUILD with the real checksum.
source=("$pkgbase-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgbase-$pkgver.tar.gz")
sha256sums=('f30fb061c773d4664388b00b050516f44f7bbf95f5ddc87a31bee77e800fee39')

prepare() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  make -C scx_devbox BUILD="$srcdir/scx_devbox" "$srcdir/scx_devbox/scx_devbox"
}

check() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package_scdr() {
  install=scdr.install
  depends=('libgcc' 'glibc' 'dbus' 'systemd')
  optdepends=('scx-scheds: sched_ext schedulers ([sched_ext])'
              'scx-tools: scx_loader, which scdr drives ([sched_ext])'
              'scx-devbox: sched_ext scheduler that follows scdr profiles'
              'pipewire: audio-client role (pw-dump)'
              'gamemode: game role'
              'power-profiles-daemon: per-power-profile roles'
              'uq: the Scheduling page and bar widget in uQ'
              'plasma-workspace: the SCDR panel widget in KDE Plasma'
              'kquickcharts: live graphs in the Plasma panel widget'
              'kcmutils: settings pages of the Plasma panel widget')

  cd "$pkgbase-$pkgver"
  ./packaging/install.sh "$pkgdir" target/release
}

package_scx-devbox() {
  pkgdesc="sched_ext scheduler for low-end machines doing development with LLM agent apps"
  license=('GPL-2.0-only')
  install=scx-devbox.install
  depends=('glibc' 'libbpf')
  optdepends=('scdr: per-process hints (batch builds, latency slices, nice) and focus hints')

  cd "$pkgbase-$pkgver"
  make -C scx_devbox BUILD="$srcdir/scx_devbox" DESTDIR="$pkgdir" \
    PREFIX=/usr UNITDIR=/usr/lib/systemd/system install
}
