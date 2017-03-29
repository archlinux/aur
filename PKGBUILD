# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributors: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Christopher Reimer <github@creimer.net>

_use_ppa=true

pkgbase=gtk3-ubuntu-multilib
pkgname=({lib32-,}gtk3-ubuntu-multilib)
_ubuntu_rel=1ubuntu2~ubuntu16.10.1
pkgver=3.22.7
pkgrel=2
pkgdesc="GObject-based multi-platform toolkit"
arch=(i686 x86_64)
url="http://www.gtk.org/"
pkgdesc="GObject-based multi-platform toolkit (v3) from Ubuntu"
depends=(adwaita-icon-theme gtk-update-icon-cache desktop-file-utils shared-mime-info wayland-protocols)
makedepends=(gobject-introspection gtk-doc)
arch=(i686 x86_64)
url="https://launchpad.net/ubuntu/+source/gtk+3.0/"
license=(LGPL)
source=("https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz"
	settings.ini
        gtk-query-immodules-3.0.hook
        lib32-gtk-query-immodules-3.0.hook)

if [[ "${_use_ppa}" != "true" ]]; then
  source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gtk+3.0_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
else
  source+=("http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/pool/main/g/gtk+3.0/gtk+3.0_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
fi
sha256sums=('a3a27564bfb1679ebbc75c37cd2bcd6e727c8bdfbcd3984d29305bf9ee60d432'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845'
            '141797a0b5cad8273ef66019b32ca70a41d3992f9884feab843cef455bde028a'
            '00944de9b032d7b0aa839869187f6084b93b359370501b1d7497a62bf06e13c6')

prepare() {
    cd "gtk+-${pkgver}"


#    [[ "${i}" == some-patch.patch ]] && continue

  # Apply Patches
  for i in $(grep -v '#' "$srcdir/debian/patches/series" | sort); do
    [[ "${i}" =~ ^# || -z "${i}" ]] && continue # Skip comments and newlines
    msg2 "Applying $i ..."
    patch -p1 -i "$srcdir/debian/patches/$i"
  done

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "gtk+-${pkgver}"

  #Build native libraries
  [[ -d build-x86_64 ]] || mkdir build-x86_64
  pushd build-x86_64

    CXX=/bin/false ../configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-schemas-compile \
        --enable-x11-backend \
        --enable-broadway-backend \
        --enable-wayland-backend \
        --enable-gtk-doc

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
  popd

  #Build 32bit libraries
  [[ -d build-i686 ]] || mkdir build-i686
  pushd build-i686

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export LDFLAGS+=' -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    export GTK_IM_MODULE_FILE='gtk.immodules-32'

    CXX=/bin/false ../configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-schemas-compile \
        --enable-x11-backend \
        --enable-broadway-backend \
        --enable-wayland-backend \
        --program-suffix="-32" \
        --lib{exec,}dir=/usr/lib32 \
        --build=i686-pc-linux-gnu

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
  popd
}

package_gtk3-ubuntu-multilib() {
  depends+=(at-spi2-atk atk cairo colord gdk-pixbuf2 
            json-glib pango rest wayland
            lib{cups,epoxy,rsvg,xcomposite,xcursor,xdamage,xi,xinerama,xkbcommon,xrandr})
  makedepends+=(libcanberra)
  optdepends=('libcanberra: gtk3-widget-factory demo')
  provides=(gtk3{,-ubuntu}=${pkgver})
  conflicts=('gtk3')
  install=gtk3-ubuntu.install

  cd "gtk+-$pkgver/build-x86_64"

  make DESTDIR="$pkgdir" install
  install -Dm644 ../../settings.ini "${pkgdir}"/usr/share/gtk-3.0/settings.ini
  install -Dm644 ../../gtk-query-immodules-3.0.hook "${pkgdir}"/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook

  rm "${pkgdir}"/usr/bin/gtk-update-icon-cache

  cd "$pkgdir"
  for _f in usr/lib/*/*/printbackends/*; do
      case $_f in
          *-file.so|*-lpr.so) continue ;;
          *) rm "${_f}" ;;
      esac
  done
}

package_lib32-gtk3-ubuntu-multilib() {
  pkgdesc+=" (32bit)"
  depends+=(lib32-{at-spi2-atk,atk,cairo,colord,gdk-pixbuf2,json-glib,pango,rest,wayland}
            lib32-lib{cups,epoxy,rsvg,xcomposite,xcursor,xdamage,xi,xinerama,xkbcommon,xrandr})
  makedepends+=(lib32-libcanberra)
  optdepends=('lib32-libcanberra: gtk3-widget-factory demo')
  provides=(lib32-gtk3{,-ubuntu}=${pkgver})
  conflicts=('lib32-gtk3')
  install=lib32-gtk3-ubuntu.install

  cd "gtk+-$pkgver/build-i686"

  make DESTDIR="$pkgdir" install
  install -Dm644 ../../lib32-gtk-query-immodules-3.0.hook "${pkgdir}"/usr/share/libalpm/hooks/lib32-gtk-query-immodules-3.0.hook

  rm -rf "${pkgdir}"/{etc,usr/{share,include}} # needs bin/gtk-query-immodules-3.0-32
  find "$pkgdir/usr/bin" -type f -not -name gtk-query-immodules-3.0-32 -delete

  #rm "${pkgdir}"/usr/bin/gtk-update-icon-cache-32

  cd "$pkgdir"
  for _f in usr/lib32/*/*/printbackends/*; do
      case $_f in
          *-file.so|*-lpr.so) continue ;;
          *) rm "${_f}" ;;
      esac
  done

}
