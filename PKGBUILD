# Maintainer: Tejun Heo <tj@kernel.org>
# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds
gitname=scx
pkgver=1.0.0
pkgrel=1
pkgdesc='Sched_ext schedulers'
url='https://github.com/sched-ext/scx'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libelf' 'zlib' 'jq')
makedepends=('git' 'python' 'meson' 'clang' 'llvm' 'llvm-libs' 'rust')
backup=('etc/default/scx' 'etc/systemd/journald@sched-ext.conf')
options=(!lto)
source=("git+https://github.com/sched-ext/scx?signed#tag=v$pkgver"
        "fix-packaging.patch"
        "drop-disabled-schedulers.patch")
sha256sums=('f1f574ec638fba3177181e437eb18cf312af0d84718e11ccc5f968ee389639e6'
            '6870476b2cbf699a4f7f5464ea1cb211bbff1cbbbb13f472ad34dbce80f82df8'
            'd9be266b04c91790b2f80033a9dae67fd1548c46994580d81b69383b0ce1bce8')
validpgpkeys=(
  697C63013E65270255EBC2608744DC1EB26B5A9A  # Tejun Heo <tj@kernel.org>
  F5504C7B7B8107B40EF9E97AA1148BB3207BCC33  # David Vernet
)

_backports=(
274bcf7f02ea8d90c7c6308af6a891a31ba45e14 # Fix Compilation on newer Pacman Version, due working RUSTFLAGS
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
  arch-meson . build -D openrc=disabled
  meson compile -C build
}

package() {
  cd $gitname
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
