# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Siddhartha Das bablu.boy@gmail.com>
pkgname=nutty-git
_app_id=com.github.babluboy.nutty
pkgver=1.1.1.r84.g294d666
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
  'speedtest-cli'
  'sqlite'
  'traceroute'
  'vnstat'
  'wireless_tools'
)
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
optdepends=('cronie: background device monitoring')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/babluboy/nutty.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/${pkgname%-git}"

  # Included speedtest-cli script is broken, use system package:
  rm "$pkgdir/usr/share/${_app_id}/scripts/speedtest-cli"
  ln -s /usr/bin/speedtest-cli "$pkgdir/usr/share/${_app_id}/scripts/"
}
