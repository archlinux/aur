# Maintainer: Que Quotion ( quequotion at g mail dot com )
# Contributors: Det, Charles Bos, Xiao-Long Chen, Christopher Reimer, Que Quotion
# Based on gtk3 trunk: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/gtk3

pkgbase=gtk3-ubuntu-multilib
pkgname=({lib32-,}gtk3-ubuntu)
pkgver=3.18.6
_debrel=1ubuntu1
pkgrel=2
pkgdesc="GObject-based multi-platform toolkit (v3) from Ubuntu"
depends=(adwaita-icon-theme gtk-update-icon-cache shared-mime-info)
arch=(i686 x86_64)
url="https://launchpad.net/ubuntu/+source/gtk+3.0/"
license=(LGPL)
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz
        https://launchpad.net/ubuntu/+archive/primary/+files/gtk+3.0_$pkgver-$_debrel.debian.tar.xz
        settings.ini)
sha256sums=('78cabf0fd5a662f8723f62d5ac633072c76c557c1d700454c9c3deaa37e441ef'
            '61cedf302ec1b64c3489da45931fb1a1813b976b7a2f9982b066780d3c78887f'
            '14369dfd1d325c393e17c105d5d5cc5501663277bd4047ea04a50abb3cfbd119')

prepare() {
  cd "gtk+-$pkgver"

  # Apply Patches
  for i in $(grep -v '#' "$srcdir/debian/patches/series" | sort); do
    msg2 "Applying $i ..."
    patch -p1 -i "$srcdir/debian/patches/$i"
  done
}

build() {
  cd "gtk+-$pkgver"

  #Build native libraries
  [[ -d build-x86_64 ]] || mkdir build-x86_64
  pushd build-x86_64

  CXX=/bin/false ../autogen.sh --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --enable-gtk2-dependency \
      --disable-schemas-compile \
      --enable-{x11,broadway,wayland}-backend 

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
  popd

  Build 32bit libraries
  [[ -d build-i686 ]] || mkdir build-i686
  pushd build-i686

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS+=' -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  export GTK_IM_MODULE_FILE='gtk.immodules-32'
  CXX=/bin/false ../autogen.sh --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --enable-gtk2-dependency \
      --disable-schemas-compile \
      --enable-{x11,broadway,wayland}-backend \
      --lib{exec,}dir=/usr/lib32 \
      --build=i686-pc-linux-gnu 

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
  popd
}

package_gtk3-ubuntu() {
  depends+=(atk cairo glib2 pango colord at-spi2-atk wayland 
lib{cups,x{cursor,inerama,randr,i,composite,damage,kbcommon,11,ext}})
  makedepends=(gobject-introspection python2)
  provides=(gtk{3{,-ubuntu},-update-icon-cache}=${pkgver})
  conflicts=('gtk{3{,-ubuntu},-update-icon-cache}')
  install=gtk3-ubuntu.install
  cd "gtk+-$pkgver/build-x86_64"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
}

package_lib32-gtk3-ubuntu() {
  pkgdesc+=" (32bit)"
  
depends+=(lib32-{glib2,atk,cairo,pango,colord,at-spi2-atk,wayland,lib{cups,xcursor,xinerama,xrandr,xi,xcomposite,xdamage,xkbcommon,x11,xext}})
  makedepends=(lib32-{gobject-introspection,python2} 'gcc-multilib')
  provides=(lib32-gtk{3{,-ubuntu},-update-icon-cache}=${pkgver})
  conflicts=('lib32-gtk3')
  install=lib32-gtk3-ubuntu.install
  cd "gtk+-$pkgver/build-i686"
  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/{etc,usr/{share,include}} # needs bin/

  mv "${pkgdir}"/usr/bin/gtk-query-immodules-3.0{,-32}
  find "$pkgdir/usr/bin" -type f -not -name gtk-query-immodules-3.0-32 -delete
}
