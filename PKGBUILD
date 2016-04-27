# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=enlightenment
pkgname=$_pkgname-git
pkgver=0.20.99.21376.gbcefcdf
pkgrel=2
pkgdesc="Enlightenment window manager - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl-git' 'xcb-util-keysyms' 'shared-mime-info'
         'desktop-file-utils' 'udisks2' 'ttf-font' 'mesa')
  [[ ! $(pacman -T bluez-libs) ]] && depends+=('bluez-libs') #l2ping support in enlightenment_sys is detected at build time
makedepends=('git')
optdepends=('acpid: power events on laptop lid close'
            'bc: calculator in everything module'
            'bluez4: bluetooth module'
            'connman: network module'
            'gdb: create backtraces on crash'
            'geoclue2: geolocation module'
            'packagekit: packagekit module'
            'xorg-server-xwayland: xwayland module')
provides=("$_pkgname=$pkgver" 'notification-daemon')
conflicts=("$_pkgname")
backup=('etc/enlightenment/sysactions.conf'
        'etc/xdg/menus/e-applications.menu')
options=('debug')
source=("git://git.enlightenment.org/core/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  for _i in v_maj v_min v_mic; do
    local v_ver=${v_ver#.}.$(grep -m1 $_i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  v_ver=$(awk -F , -v v_ver=$v_ver '/^AC_INIT/ {gsub(/v_ver/, v_ver); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "%s.%s.g%s" "$v_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-wayland \
    --enable-xwayland

  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
