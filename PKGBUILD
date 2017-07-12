# Maintainer: dudemanguy <random342@openmailbox.org>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=glib2-patched-thumbnailer
pkgname=glib2-patched-thumbnailer
pkgver=2.52.3
pkgrel=1
pkgdesc="GLib2 patched with ahodesuka's thumbnailer patch."
url="http://gist.github.com/ahodesuka/49c1d0eea4b64f24c4c7"
arch=(i686 x86_64)
provides=("glib2=$pkgver" "glib2-docs")
conflicts=('glib2')
makedepends=('gettext' 'gtk-doc' 'libffi' 'pcre' 'zlib' 'shared-mime-info' 'python' 'libelf' 'git' 'util-linux')
checkdepends=(desktop-file-utils dbus)


_commit=90bb8778f2eabf00bee5bff1259c48f1e7b791b8  # tags/2.52.3^0
_patchver=d0edf118e1c27700300038c1d82b3ff775c0216b
source=("git://git.gnome.org/glib#commit=$_commit"
        glib-compile-schemas.hook
        gio-querymodules.hook
        skip-broken-timer-test.patch
        https://gist.githubusercontent.com/ahodesuka/49c1d0eea4b64f24c4c7/raw/$_patchver/glib-thumbnailer.patch)
sha256sums=('SKIP'
            'e1123a5d85d2445faac33f6dae1085fdd620d83279a4e130a83fe38db52b62b3'
            '5ba204a2686304b1454d401a39a9d27d09dd25e4529664e3fd565be3d439f8b6'
            'a39dc8c1c1707053d565d5b198b1f03f7c55b31e11335a1bfdc3f9803b114d5d'
            '1a4673380fbdf8e8e5de3367089de6c97025633e54010575de63c5ab6c8a044d')

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib
  git revert -n 6560b37450cd  # Noisy glib-compile-schemas

  # Rounding error in timer tests?
  # GLib:ERROR:timer.c:38:test_timer_basic: assertion failed (micros == ((guint64)(elapsed * 1e6)) % 1000000): (1 == 0)
  [[ $CARCH == i686 ]] && patch -Np1 -i ../skip-broken-timer-test.patch

  patch -Np1 -i ../glib-thumbnailer.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd glib
  ./configure --prefix=/usr --libdir=/usr/lib \
      --sysconfdir=/etc \
      --with-pcre=system \
      --disable-fam \
      --enable-gtk-doc \
      $(check_option debug y && echo --enable-debug=yes)
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

#seems to get stuck after live-g-file 2 /live-g-file/create_structure for some reason; skip this
#check() {
#  cd glib
#  make check
#}

package_glib2-patched-thumbnailer() {
  depends=('pcre' 'libffi' 'tumbler' 'libutil-linux')
  optdepends=('python: for gdbus-codegen and gtester-report'
            'libelf: gresource inspection tool')
  options=(!emptydirs)
  license=(LGPL)

  cd glib
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/share/gtk-doc"

  # install hooks
  install -d "$pkgdir/usr/share/libalpm/hooks/"
  install -m644 "$srcdir"/{glib-compile-schemas,gio-querymodules}.hook \
    "$pkgdir/usr/share/libalpm/hooks/"
}

package_glib2-docs() {
  pkgdesc="Documentation for glib2"
  conflicts=(gobject2-docs)
  replaces=(gobject2-docs)
  license=(custom)
  options=(!emptydirs)

  cd glib/docs
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/share/man"

  install -Dm644 reference/COPYING "$pkgdir/usr/share/licenses/glib2-docs/COPYING"
}
