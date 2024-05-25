# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=key-rack
pkgname=key-rack-git
pkgver=r128.11f7f14
pkgrel=1
pkgdesc='Key Rack allows to view and edit keys, like passwords or tokens, stored by apps'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.gnome.org/sophie-h/key-rack'
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=('git' 'meson' 'rust')
conflicts=('key-rack')
provides=('key-rack')
options=('!debug')
source=("${_pkgname}::git+https://gitlab.gnome.org/sophie-h/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${_pkgname}"
  meson install -C build --destdir "${pkgdir}"
}
