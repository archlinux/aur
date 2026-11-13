# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>

# Split package: scdr-git (MPL-2.0) and scx-devbox-git (GPL-2.0, a sched_ext
# scheduler). Building scx-devbox needs a running kernel with sched_ext.
pkgbase=scdr-git
pkgname=('scdr-git' 'scx-devbox-git')
_pkgname=scdr
pkgver=0.4.1.r0.g9ef7d68
pkgrel=1
pkgdesc="Process scheduling and priority daemon for EEVDF and sched_ext kernels (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/asafelobotomy/scdr"
license=('MPL-2.0')
makedepends=('cargo' 'git' 'clang' 'bpf' 'libbpf' 'libelf' 'zlib' 'dbus' 'systemd')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "0.4.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  make -C scx_devbox BUILD="$srcdir/scx_devbox" "$srcdir/scx_devbox/scx_devbox"
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package_scdr-git() {
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
  provides=('scdr')
  conflicts=('scdr')

  cd "$_pkgname"
  ./packaging/install.sh "$pkgdir" target/release
}

package_scx-devbox-git() {
  pkgdesc="sched_ext scheduler for low-end machines doing development with LLM agent apps (git)"
  license=('GPL-2.0-only')
  install=scx-devbox.install
  depends=('glibc' 'libbpf')
  optdepends=('scdr: per-process hints (batch builds, latency slices, nice)')
  provides=('scx-devbox')
  conflicts=('scx-devbox')

  cd "$_pkgname"
  make -C scx_devbox BUILD="$srcdir/scx_devbox" DESTDIR="$pkgdir" \
    PREFIX=/usr UNITDIR=/usr/lib/systemd/system install
}
