# Maintainer: Tejun Heo <tj@kernel.org>
# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds
_gitname=scx
pkgver=1.0.4
pkgrel=1
pkgdesc='sched_ext schedulers and tools'
url='https://github.com/sched-ext/scx'
arch=('x86_64' 'aarch64')
backup=('etc/default/scx')
license=('GPL-2.0-only')
depends=(
  bpf
  jq
  libbpf
  libelf
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
options=(!lto)
source=("git+https://github.com/sched-ext/scx?signed#tag=v$pkgver")
sha256sums=('c262e6ae6f804c61c4669bf6b09e9fdc01882d0e36ff0e4d6b9598fd7ad20e94')
validpgpkeys=(
  697C63013E65270255EBC2608744DC1EB26B5A9A  # Tejun Heo <tj@kernel.org>
  F5504C7B7B8107B40EF9E97AA1148BB3207BCC33  # David Vernet
)

_backports=(
)

_reverts=(
)

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
  arch-meson . build -D openrc=disabled -D libbpf_a=disabled -D bpftool=disabled
  meson compile -C build
}

package() {
  cd $_gitname
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
