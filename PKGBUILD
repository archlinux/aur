# Maintainer: João F. (BeyondMagic) <beyondmagic@mail.ru>
# Contributor: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: j.r <j.r@jugendhacker.de>
# Contributor: Matthew Murray <matt@mattmurr.xyz>

pkgname=fprintd-clients-git-elogind
pkgver=1.90.1.r2.g54e56d6
pkgrel=1
pkgdesc='Fprintd without the daemon (debian/clients-only git branch) with elogind support'
arch=('x86_64')
url="https://gitlab.freedesktop.org/uunicorn/fprintd"
license=('GPL-2.0-or-later')

depends=(
  dbus
  dbus-glib
  glib2
  glibc
  libfprint
  libelogind
  pam
  polkit
)

makedepends=(
  git
  glib2-devel
  meson
  pam_wrapper
  python-cairo
  python-dbus
  python-dbusmock
)

conflicts=(
  fprintd
  fprintd-clients
  fprintd-clients-git
)

provides=(
  fprintd-clients
  fprintd-clients-git
)

_commit=54e56d660bf9730f8abc8f2c6a358ef2fec675f2
source=("fprintd::git+${url}.git#commit=${_commit}"
        '0001-disable-systemd-reactivated.diff'
        '0002-Remove-ignored-positional-arguments.patch'
        '0003-support-elogind.patch')

sha256sums=('SKIP'
            '05e537a783302f0b01984eee00368deb2bc846bfd16b8892a21aff79c9b7a6ab'
            '83458c77fd9b1c3022ed7230b92432a3edde00cc811a01e49b76c04629534b82'
            '5f188568b43dfa9f9c02786d05b8d91fd584ef263cd3871d9351ba9b5f9af1be')

pkgver() {
  cd fprintd
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd fprintd
  patch -Np1 -i "$srcdir/0001-disable-systemd-reactivated.diff"
  patch -Np1 -i "$srcdir/0002-Remove-ignored-positional-arguments.patch"
  patch -Np1 -i "$srcdir/0003-support-elogind.patch"
}

build() {
  arch-meson fprintd build \
    -D pam_modules_dir=/usr/lib/security
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -d -m 700 "${pkgdir}/var/lib/fprint"
}
