# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=enlightenment
pkgname=$_pkgname-wayland-git
pkgver=0.19.0.18634.437a22c
pkgrel=1
pkgdesc="Highly expermimental Enlightenment window manager for Wayland- Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('enlightenment' 'elementary-git')
makedepends=('git')
optdepends=('acpid: power events on laptop lid close'
            'bc: calculator in everything module'
            'bluez4: bluetooth module'
            'connman: network module'
            'gdb: create backtraces on crash'
            'packagekit: packagekit module')
options=('debug')
install=enlightenment.install
source=("git://git.enlightenment.org/core/$_pkgname.git#branch=devs/devilhorns/e_comp_wl"
        "enlightenment_start_wayland")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for _i in v_maj v_min v_mic; do
    local v_ver=${v_ver#.}.$(grep -m1 $_i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  v_ver=$(awk -F , -v v_ver=$v_ver '/^AC_INIT/ {gsub(/v_ver/, v_ver); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i '/^src_bin_enlightenment_LDADD/ s/$/ -luuid/' "$srcdir/$_pkgname/src/bin/Makefile.mk"
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/opt/enlightenment-wayland \
    --sysconfdir=/etc \
    --enable-wayland-only \
    --enable-wayland-clients \
    --enable-wl-drm \
    --disable-conf-randr \
    --disable-shot \
    --disable-xkbswitch

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# remove files provided by the enlightenment package
  rm -r "$pkgdir"/{etc,usr}

# install run script
  install -Dm755 "$srcdir/enlightenment_start_wayland" "$pkgdir/usr/bin/enlightenment_start_wayland"

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" ChangeLog NEWS README README.wayland

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
