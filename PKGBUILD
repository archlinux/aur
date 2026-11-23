# Maintainer: chrs <chrs@chrs.sh>

pkgname=djdev64-git
pkgver=0.5.r15.g0c9ec58
pkgrel=1
pkgdesc='Libraries and headers implementing the DJ64 and DJ64STUB DPMI extensions for dj64 executables'
arch=('x86_64')
url='https://github.com/dosemu2/djdev64'
license=('GPL-3.0-or-later')
depends=('glibc' 'libelf')
makedepends=('git' 'meson')
provides=("djdev64=${pkgver%%.r*}" 'libdjdev64.so' 'libdjstub64.so')
conflicts=('djdev64')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd djdev64
  # No upstream tags: use the meson project version plus commit count and hash
  local _ver
  _ver="$(sed -nE "s/^[[:space:]]*version[[:space:]]*:[[:space:]]*'([^']+)'.*/\1/p" meson.build | head -n1)"
  printf '%s.r%s.g%s' "${_ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson djdev64 build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
