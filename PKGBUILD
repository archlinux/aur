# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=enlightenment
pkgname=${_pkgname}-git
pkgver=0.18.99.17591.921557c
pkgrel=1
pkgdesc="Enlightenment window manager (formerly e17) - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary-git' 'xcb-util-keysyms' 'hicolor-icon-theme'
         'desktop-file-utils' 'udisks2' 'ttf-font' 'pixman' 'mesa')
  [[ ! $(pacman -T bluez-libs) ]] && depends+=('bluez-libs') #l2ping support in enlightenment_sys is detected at build time
makedepends=('git')
optdepends=('acpid: power events on laptop lid close'
            'bluez-libs: bluetooth module'
            'connman: network module'
            'gdb: create backtraces on crash'
            'packagekit: packagekit module')
provides=("$_pkgname=$pkgver" 'notification-daemon' "enlightenment17=$pkgver" "enlightenment17-git=$pkgver")
conflicts=("$_pkgname" "enlightenment17" "enlightenment17-git")
backup=('etc/enlightenment/sysactions.conf'
        'etc/xdg/menus/enlightenment.menu')
options=('debug')
install=enlightenment.install
source=("git://git.enlightenment.org/core/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for _i in v_maj v_min v_mic; do
    local v_ver=$v_ver.$(grep -m1 $_i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  v_ver=$(awk -F , -v v_ver=${v_ver#.} '/^AC_INIT/ {gsub(/v_ver/, v_ver); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

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
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
