# Contributor: WoefulDerelict <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=ladish-git
pkgver=1.1.r43.gfc1e901b
pkgrel=1
pkgdesc="Session management system for JACK."
arch=('i686' 'x86_64')
url="https://ladish.org"
license=('GPL2' 'custom:AFL2.1')
depends=('a2jmidid' 'cdbus' 'dbus-glib' 'dbus-python' 'expat' 'glibc' 'gtkmm' 'jack2-dbus' 'libgnomecanvasmm' 'python' 'util-linux-libs')
makedepends=('boost' 'git' 'intltool')
optdepends=('laditools: Provides ladi-control-center the default JACK configuration tool in gladish')
provides=("${pkgname%-*}" 'lash')
conflicts=("${pkgname%-*}" 'lash')
source=("${pkgname%-*}::git+https://gitea.ladish.org/LADI/ladish.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^ladish.//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-*}"
#  The meson build currently lacks key files, including the dbus .service files, and is not ready for deployment.
#  When migrating add 'meson' and 'cmake' to the makedepends array.

#  meson setup --prefix /usr --auto-features enabled --wrap-mode nodownload -D b_lto=true -D b_pie=true -D python.bytecompile=1 build
#  meson compile -C build

  ./waf configure --prefix=/usr \
                  --enable-gladish \
                  --enable-liblash
  ./waf
}

package() {
  cd "${pkgname%-*}"
#  meson install -C build --destdir "$pkgdir"
  ./waf install --destdir="$pkgdir"
  install -Dm644 afl21.txt "$pkgdir/usr/share/licenses/$pkgname/AFL-2.1.txt"
}
