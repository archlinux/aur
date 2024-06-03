# Maintainer: Tejun Heo <tj@kernel.org>
# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds
gitname=scx
pkgver=0.1.9
pkgrel=4
pkgdesc='Sched_ext schedulers'
url='https://github.com/sched-ext/scx'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libelf' 'zlib' 'jq')
makedepends=('git' 'python' 'meson' 'clang' 'llvm' 'llvm-libs' 'rust')
backup=('etc/default/scx' 'etc/systemd/journald@sched-ext.conf')
options=(!lto)
source=("git+https://github.com/sched-ext/scx?signed#tag=v$pkgver")
sha256sums=('4b226e717366a2d11561f72c9bde85b89390dbeb3f909504e5986e8751d9ef9e')
validpgpkeys=(
  697C63013E65270255EBC2608744DC1EB26B5A9A  # Tejun Heo <tj@kernel.org>
  F5504C7B7B8107B40EF9E97AA1148BB3207BCC33  # David Vernet
)

_backports=(
)

_reverts=(
)

prepare() {
 cd $gitname

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
  cd $gitname
  arch-meson . build --buildtype release --auto-features auto
  meson compile -C build
}

package() {
  cd $gitname
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
