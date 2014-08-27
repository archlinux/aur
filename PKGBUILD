# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=enlightenment
pkgname=$_pkgname-wayland-git
pkgver=0.19.0.18810.6b56465
pkgrel=1
pkgdesc="Highly expermimental Enlightenment window manager for Wayland - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary-git' 'xcb-util-keysyms' 'hicolor-icon-theme'
         'desktop-file-utils' 'udisks2' 'ttf-font' 'pixman' 'mesa')
  [[ ! $(pacman -T bluez-libs) ]] && depends+=('bluez-libs') #l2ping support in enlightenment_sys is detected at build time
makedepends=('git')
optdepends=('acpid: power events on laptop lid close'
            'bluez4: bluetooth module'
            'connman: network module'
            'gdb: create backtraces on crash'
            'packagekit: packagekit module')
options=('debug')
install=enlightenment.install
source=("git://git.enlightenment.org/core/$_pkgname.git"
        "enlightenment_start_wayland")
sha256sums=('SKIP'
            'c9e3b3791174f53af429f8adf734a30ad44be9fb35adad50c46f5e5b37f12ccc')

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
    --prefix=/opt/enlightenment-wayland \
    --enable-wayland-clients \
    --enable-wl-drm \
    --enable-wayland-only \
    --disable-shot \
    --disable-xkbswitch \
    --disable-conf-randr \
    --disable-everything \
    --disable-wl-x11

  make
}

package() {
  cd "$srcdir/$_pkgname"

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
