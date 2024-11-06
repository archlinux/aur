# Maintainer: yvs <VSYakovetsky@gmail.com>

_bin="mtr"
_ver="0.85"
_tag="97af563"
_build="_build"

pkgname=mtr085
pkgver="$_ver"
pkgrel=1
pkgdesc="Full screen ncurses traceroute tool, mtr v0.85 fork"
arch=('x86_64' 'aarch64')
url="https://github.com/yvs2014/$pkgname"
license=('GPL-2.0')
depends=('ncurses' 'libcap')
makedepends=('git' 'gcc' 'meson' 'pkgconf')
options=(strip !debug)

conflicts=('mtr' 'mtr-gtk')

source=("$pkgname::git+$url")
provides=("$_bin")

build() {
  arch-meson "$pkgname" "$_build"
  meson compile -C "$_build"
}

post_install() {
  setcap 'cap_net_raw+ep' "usr/bin/$_bin" || :
}

post_upgrade() {
  post_install
}

package() {
  DESTDIR="$pkgdir" meson install -C "$_build"
}

pkgver() {
  cd "$pkgname"
  printf "%s.r%s.%s" "$_ver" "$(git rev-list --count ${_tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

sha256sums=('SKIP')
