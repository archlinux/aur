# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-tools-git
_gitname=scx-loader
pkgver=20251030.r361.gc922e29
pkgrel=2
pkgdesc='scx_loader: A DBUS Interface for Managing sched_ext Schedulers'
url='https://github.com/sched-ext/scx-loader'
arch=('x86_64')
license=('GPL-2.0-only')
depends=(
  scx-scheds-git
)
makedepends=(
  cargo
  clang
  git
  llvm
  llvm-libs
)
options=(!lto)
provides=("scxctl")
conflicts=("scxctl")
source=("git+https://github.com/sched-ext/scx-loader")
sha256sums=('SKIP')

_backports=(
)

_reverts=(
)

pkgver() {
  cd $_gitname
  echo "$(git show --format='%cI' -q main | sed 's/T.*//g;s/-//g').r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
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
  cargo build --release --frozen --all-features
}

check() {
  cd $_gitname
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd $_gitname

  # Install all built executables (skip .so and .d files)
  find target/release \
    -maxdepth 1 -type f -executable ! -name '*.so' \
    -exec install -Dm755 -t "$pkgdir/usr/bin/" {} +

  # systemd service
  install -Dm644 services/scx_loader.service \
    -t "$pkgdir/usr/lib/systemd/system/"

  # D-Bus service
  install -Dm644 services/org.scx.Loader.service \
    -t "$pkgdir/usr/share/dbus-1/system-services/"

  # D-Bus configuration
  install -Dm644 configs/org.scx.Loader.conf \
    -t "$pkgdir/usr/share/dbus-1/system.d/"

  # scx_loader sample configuration (template)
  install -Dm644 configs/scx_loader.toml \
    "$pkgdir/usr/share/scx_loader/config.toml"
}
