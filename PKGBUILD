# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds-git
_gitname=scx
pkgver=1.0.18.r160.g874e8f42
pkgrel=1
pkgdesc='sched_ext schedulers and tools'
url='https://github.com/sched-ext/scx'
arch=('x86_64' 'aarch64')
license=('GPL-2.0-only')
depends=(
  bash
  bpf
  gcc-libs
  glibc
  jq
  libseccomp
  libbpf
  libelf
  protobuf
  scx-tools
  zlib
)
makedepends=(
  clang
  git
  llvm
  llvm-libs
  python
  rust
)
source=("git+https://github.com/sched-ext/scx")
sha256sums=('SKIP')
options=(!lto)
provides=("scx-scheds=$pkgver")
conflicts=("scx-scheds")

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
     --all-features \
     --workspace \
     --exclude scx_rlfifo \
     --exclude scx_wd40 \
     --exclude scx_mitosis \
     --exclude scxcash \
     --exclude xtask \
     --exclude vmlinux_docify \
     --exclude scx_arena_selftests
}

package() {
  cd $_gitname

  # Install all built executables (skip .so and .d files)
  find target/release \
    -maxdepth 1 -type f -executable ! -name '*.so' \
    -exec install -Dm755 -t "$pkgdir/usr/bin/" {} +
}
