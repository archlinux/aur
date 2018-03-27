# $Id$

_target=aarch64-linux-gnu
_pkgbase=glib2
pkgbase=${_target}-glib2
pkgname=(${_target}-glib2
#${_target}-glib2-docs
)
pkgver=2.56.0+7+g66948ae
pkgrel=1
pkgdesc="Low level core library"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL2.1)
arch=('any')
depends=(${_target}-pcre
#libffi
${_target}-libutil-linux
zlib-aarch64
)
makedepends=(gettext gtk-doc shared-mime-info python libelf git dbus
${_target}-util-linux # for pkgconfig/*.pc
${_target}-pkg-config
)
optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
            'libelf: gresource inspection tool')
options=(!emptydirs)
_commit=66948ae231f75a548c8a2eb7b3a9d64cfd728b8e  # glib-2-56
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
        noisy-glib-compile-schemas.diff
        glib-compile-schemas.hook gio-querymodules.hook)
sha256sums=('SKIP'
            '81a4df0b638730cffb7fa263c04841f7ca6b9c9578ee5045db6f30ff0c3fc531'
            'e1123a5d85d2445faac33f6dae1085fdd620d83279a4e130a83fe38db52b62b3'
            '5ba204a2686304b1454d401a39a9d27d09dd25e4529664e3fd565be3d439f8b6')

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  patch -Np1 -i ../noisy-glib-compile-schemas.diff

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local debug=minimum
  check_option debug n && debug=yes

  cd glib
  unset CFLAGS CXXFLAGS
if true; then
  glib_cv_stack_grows=no \
  glib_cv_uscore=no \
  glib_cv_compliant_posix_memalign=1 \
  ./configure \
    --host=${_target} \
    --prefix=/usr/${_target} \
    --libdir=/usr/${_target}/lib \
    --sysconfdir=/etc \
    --with-pcre=system \
    --enable-debug=$debug \
    --disable-fam

#    --enable-gtk-doc \
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
fi
  make
}

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

check() {
  local s readelfarch
  readelfarch='AArch64'
  cd glib

  s=$(find . -type f "(" -name "*.so*" -o -name "*.a" ")" -print0 | \
    2>/dev/null LC_ALL=C xargs -0 readelf -h | \
    sed -n -e '/File:/h;/Machine:/{/'"$readelfarch"'/!{H;x;p}}' | head -10)

  if [ -n "$s" ]; then
    >&2 echo "some binaries have wrong architecture:"
    >&2 echo "$s"
    return 1
  fi
}

package_glib2() {
  cd glib
  make DESTDIR="$pkgdir" install
  #mv "$pkgdir/usr/share/gtk-doc" "$srcdir"

  install -Dt "$pkgdir/usr/${_target}/share/libalpm/hooks" -m644 ../*.hook

  # delete all executables
  rm -rf "$pkgdir/usr/${_target}/bin"
}

package_glib2-docs() {
  pkgdesc="Documentation for GLib"
  depends=()
  optdepends=()
  license+=(custom)

  mkdir -p "$pkgdir/usr/share"
  mv gtk-doc "$pkgdir/usr/share"

  install -Dt "$pkgdir/usr/share/licenses/glib2-docs" -m644 glib/docs/reference/COPYING
}

for p in "${pkgname[@]}"; do
  eval "package_${p}() { package_${p/${_target}-/} "'"$@"'"; }"
done
