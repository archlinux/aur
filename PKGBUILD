# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Siddhartha Das bablu.boy@gmail.com>
pkgname=nutty-git
_app_id=com.github.babluboy.nutty
pkgver=1.2.0.r10.g23c4712
pkgrel=1
pkgdesc="A network utility with a user interface for common command line tools"
arch=('x86_64')
url="https://babluboy.github.io/nutty"
license=('GPL-3.0-or-later')
depends=(
  'granite'
  'iproute2'
  'libgee'
  'libnotify'
  'libxml2'
  'lshw'
  'net-tools'
  'nethogs'
  'nmap'
  'pciutils'
  'polkit'
  'sqlite'
  'traceroute'
  'vnstat'
  'wireless_tools'
)
makedepends=(
  'git'
  'meson'
  'vala'
)
checkdepends=('appstream-glib')
optdepends=('cronie: background device monitoring')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/babluboy/nutty.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/${pkgname%-git}"
}
