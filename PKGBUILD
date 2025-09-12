# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds-git
_gitname=scx
pkgver=1.0.16.r66.gc3b6b3c0
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
  zlib
)
makedepends=(
  clang
  git
  llvm
  llvm-libs
  meson
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
}

build() {
  cd $_gitname
  arch-meson . build -D openrc=disabled \
    -D libbpf_a=disabled \
    -D bpftool=disabled \
    -D b_lto=true \
    -D b_lto_mode=thin \
    -D cargo_home="$srcdir"/scx
  meson compile -C build
}

package() {
  cd $_gitname
  meson install -C build --destdir "${pkgdir}"
}
