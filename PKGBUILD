# Maintainer: Nils Brause <nilschrbrause@gmail.com>
pkgname=sway-wlroots-git
pkgver=1.0.alpha.6.r21.g082488a8
pkgrel=1
pkgdesc='i3 compatible window manager for Wayland'
arch=('x86_64')
url='http://swaywm.org'
license=('MIT')
depends=('json-c' 'pcre' 'wlroots-git' 'wayland' 'wayland-protocols'
         'libxkbcommon' 'cairo' 'pango' 'gdk-pixbuf2' 'pixman' 'libcap'
         'libinput' 'pam' 'xorg-server-xwayland' 'dbus')
optdepends=('libelogind: systemd logind support')
makedepends=('git' 'meson' 'ninja' 'scdoc')
provides=('sway')
conflicts=('sway' 'sway-git')
install=sway-wlroots-git.install
source=('git+https://github.com/swaywm/sway.git'
        'swaybar-fix.patch')
sha1sums=('SKIP'
          '1439ccd67866cec5e280a8b552046a9f5a1787f7')
options=('!strip' 'debug')

pkgver() {
  cd "$srcdir/sway"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/sway"
  patch -Np1 -i "$srcdir/swaybar-fix.patch"
}

build() {
	cd "$srcdir/sway"
  rm -rf "$srcdir/build"
  meson -Dwerror=false --prefix /usr "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
	cd "$srcdir/build"
  DESTDIR="$pkgdir" ninja install
}
