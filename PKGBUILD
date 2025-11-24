# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-tools-git
_gitname=scx-loader
pkgver=1.0.18.r6.g0bacdf7
pkgrel=1
epoch=1
pkgdesc='scx_loader: A DBUS Interface for Managing sched_ext Schedulers'
url='https://github.com/sched-ext/scx-loader'
arch=('x86_64')
license=('GPL-2.0-only')
depends=(
  polkit
  scx-scheds
)
makedepends=(
  cargo
  clang
  git
  llvm
  llvm-libs
)
options=(!lto)
provides=("scx-tools=$pkgver")
conflicts=("scx-tools")
source=("git+https://github.com/sched-ext/scx-loader")
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
  cargo build --release --frozen --all-features --workspace
}

package() {
  cd $_gitname

  # Install all built executables (skip .so and .d files)
  find target/release \
    -maxdepth 1 -type f -executable ! -name '*.so' ! -name 'xtask' \
    -exec install -Dm755 -t "$pkgdir/usr/bin/" {} +

  # Install runtime assets via xtask
  # (systemd units, D-Bus services, configs, sample files)
  ./target/release/xtask install --destdir "$pkgdir"
}
