# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=enlightenment
pkgname=$_pkgname-git
pkgver=0.19.0.18507.1a321b8
pkgrel=1
pkgdesc="Enlightenment window manager - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary-git' 'xcb-util-keysyms' 'hicolor-icon-theme'
         'desktop-file-utils' 'udisks2' 'ttf-font' 'pixman' 'mesa')
  [[ ! $(pacman -T bluez-libs) ]] && depends+=('bluez-libs') #l2ping support in enlightenment_sys is detected at build time
makedepends=('git')
optdepends=('acpid: power events on laptop lid close'
            'bc: calculator in everything module'
            'bluez-libs: bluetooth module'
            'connman: network module'
            'gdb: create backtraces on crash'
            'packagekit: packagekit module')
provides=("$_pkgname=$pkgver" 'notification-daemon')
conflicts=("$_pkgname")
backup=('etc/enlightenment/sysactions.conf'
        'etc/xdg/menus/enlightenment.menu'
        'etc/xdg/menus/e-applications.menu')
options=('debug')
install=enlightenment.install
source=("git://git.enlightenment.org/core/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for _i in v_maj v_min v_mic; do
    local v_ver=${v_ver#.}.$(grep -m1 $_i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  v_ver=$(awk -F , -v v_ver=$v_ver '/^AC_INIT/ {gsub(/v_ver/, v_ver); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-wayland-clients \
    --enable-wayland-egl

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
