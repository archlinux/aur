# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=sweetlock-git
_pkgname=sweetlock
pkgver=0.1.0.r0.g5cb2225
pkgrel=1
pkgdesc="Screen locker for Wayland (git)"
arch=('x86_64')
url="https://github.com/sweetwm/sweetlock"
license=('GPL-3.0-or-later')
options=('!debug')
depends=('glibc' 'wayland' 'libxkbcommon' 'pam' 'cairo' 'pango' 'glib2'
         'libjpeg-turbo')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'wayland-protocols' 'scdoc')
optdepends=(
  'noto-fonts: the default font'
  'fprintd: fingerprint unlock'
  'pam-u2f: security key unlock'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/pam.d/sweetlock')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  if git describe --tags >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 \
      | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$_pkgname"
  meson setup build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" ninja -C build install
}
