# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>
# Contributor: Tejun Heo <tj@kernel.org>

pkgname=scx-scheds-git
_gitname=scx
pkgver=1.1.4.r208.gb19726e95
pkgrel=1
pkgdesc='sched_ext schedulers and tools'
url='https://github.com/sched-ext/scx'
arch=('x86_64' 'aarch64')
license=('GPL-2.0-only')
depends=(
  libelf
  libseccomp
  protobuf
  zlib
)
makedepends=(
  bpf-linker
  cargo
  clang
  git
  llvm
  llvm-libs
  rust-src
)
optdepends=(
'scx-tools: scx_loader and scxctl - A DBUS Interface for Managing sched_ext Schedulers '
)
options=(!lto)
backup=('etc/default/scx')
provides=("scx-scheds=$pkgver")
conflicts=("scx-scheds")
source=("git+https://github.com/sched-ext/scx")
sha256sums=('SKIP')

_backports=(
)

_reverts=(
)

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_gitname

  local _c _l
   for _c in "${_backports[@]}"; do
     if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
     git log --oneline "${_l}" "${_c}"
     git cherry-pick --mainline 1 --no-commit "${_c}"
   done
   for _c in "${_reverts[@]}"; do
     if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
     git log --oneline "${_l}" "${_c}"
     git revert --mainline 1 --no-commit "${_c}"
   done

  local src
   for src in "${source[@]}"; do
     src="${src%%::*}"
     src="${src##*/}"
     [[ $src = *.patch ]] || continue
     echo "Applying patch $src..."
     patch -Np1 < "../$src"
   done

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_gitname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build \
     --release \
     --frozen \
     --workspace \
     --exclude scx_rlfifo \
     --exclude scx_mavd \
     --exclude scx_mitosis \
     --exclude scx_nitosis \
     --exclude scx_characterize \
     --exclude vmlinux_docify \
     --exclude scx_arena_selftests \
     --exclude scx_arena_libarena_selftests
}

package() {
  cd $_gitname

  # Install all built executables (skip .so and .d files)
  find target/release \
    -maxdepth 1 -type f -executable ! -name '*.so' ! -name 'xtask' \
    -exec install -Dm755 -t "$pkgdir/usr/bin/" {} +

  # Runtime data via xtask: scx.service, /etc/default/scx,
  # /usr/share/scx/catalog.json, the scxcli polkit policy.
  # --source-dir keeps cargo out of package().
  ./target/release/xtask install --source-dir . --destdir "$pkgdir"
}
