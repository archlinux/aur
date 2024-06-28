# Maintainer: Tejun Heo <tj@kernel.org>
# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds
gitname=scx
pkgver=0.1.10
pkgrel=7
pkgdesc='Sched_ext schedulers'
url='https://github.com/sched-ext/scx'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libelf' 'zlib' 'jq')
makedepends=('git' 'python' 'meson' 'clang' 'llvm' 'llvm-libs' 'rust')
backup=('etc/default/scx' 'etc/systemd/journald@sched-ext.conf')
options=(!lto)
source=("git+https://github.com/sched-ext/scx?signed#tag=v$pkgver")
sha256sums=('62a2db6b5f562ddc2c192d7025193b1fd924c3c171ec5135afa286706138c93a')
validpgpkeys=(
  697C63013E65270255EBC2608744DC1EB26B5A9A  # Tejun Heo <tj@kernel.org>
  F5504C7B7B8107B40EF9E97AA1148BB3207BCC33  # David Vernet
)

_backports=(
1505164ca09876b3439149b1b7df63c524f5856d # scx.service: start service after graphical target
4558d5c3dd370e6a6250f9c9ded85f7a8e6594f0 # scx: update /etc/default/scx sample flags
66dea6262be278fa833ee7f2a02834ce192724cb # scx.service: allow overriding scx variables
3684b1601ce9f52fba9af3678d36b1bcc0966fd5 # Simplifying pacman-hooks
22f13e22844d3e12590bc71492462dc7d40821a3 # meson: run cargo build in release mode when using plain buildtype
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
