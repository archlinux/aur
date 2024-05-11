# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>
# Contributor: Lin Rs <lin dot ruohshoei+arch at gmail dot com>
# Contributor: Randy Ramos <rramos1295@gmail.com>
# Contributor: Reventlov <contact+aur@volcanis.me>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Zariel <c.bannister@gmail.com>
# Contributor: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=irssi-git
_gitname=${pkgname%-git}
pkgver=1.5+1.dev.r237.g5c159375
pkgrel=1

pkgdesc="Modular text mode IRC client with Perl scripting"
url="https://irssi.org"
license=(GPL-2.0-only)
arch=(x86_64)

depends=(
  glib2
  openssl
  perl
  libotr
  ncurses
  libutf8proc
)
makedepends=(
  git
  meson
  ninja
)
optdepends=("perl-lwp-protocol-https: for the scriptassist script")

provides=(irssi)
conflicts=(irssi)

backup=(etc/irssi.conf)

source=("git+https://github.com/irssi/irssi.git#branch=master")
b2sums=(SKIP)

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson setup --prefix=/usr --buildtype=plain "$_gitname" build \
    -Dwith-proxy=yes \
    -Dwith-perl-lib=vendor \
    -Dwith-perl=yes \
    -Dwith-otr=yes
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm 644 "$_gitname/irssi.conf" "$pkgdir/etc/irssi.conf"
}
