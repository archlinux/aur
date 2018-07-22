# Maintainer: Nils Brause <nilschrbrause@gmail.com>
pkgname=sway-wlroots-git
pkgver=1.0.alpha.4.r43.g27f65b94
pkgrel=1
pkgdesc='i3 compatible window manager for Wayland'
arch=('x86_64')
url='http://swaywm.org'
license=('MIT')
depends=('json-c' 'pcre' 'wlroots-git' 'wayland' 'wayland-protocols'
         'libxkbcommon' 'cairo' 'pango' 'gdk-pixbuf2' 'pixman' 'libcap'
         'libinput' 'pam' 'xorg-server-xwayland')
optdepends=('libelogind: systemd logind support')
makedepends=('git' 'meson' 'ninja' 'scdoc')
provides=('sway')
conflicts=('sway' 'sway-git')
install=sway-wlroots-git.install
source=('git+https://github.com/swaywm/sway.git'
        'swaybar-fix.patch')
sha1sums=('SKIP'
          '11fbebb5c3dc9cbb7278033d023fd3557d2bbbba')
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
