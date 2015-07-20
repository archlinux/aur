# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=enlightenment
pkgname=$_pkgname-wayland-git
pkgver=0.19.99.20261.g3593883
pkgrel=1
pkgdesc="Highly expermimental Enlightenment window manager for Wayland - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary-git' 'xcb-util-keysyms' 'hicolor-icon-theme'
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
options=('debug')
install=enlightenment.install
source=("git://git.enlightenment.org/core/$_pkgname.git"
        "enlightenment_start_wayland")
sha256sums=('SKIP'
            '87a2a6f68d91b73e3c838f11b09a1156cd4e2525a6e00a53af30cc7638ae7311')

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
    --prefix=/opt/enlightenment-wayland \
    --enable-wayland

  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr"

# install run script
  install -Dm755 "$srcdir/enlightenment_start_wayland" "$pkgdir/usr/bin/enlightenment_start_wayland"

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" ChangeLog NEWS README README.wayland

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
