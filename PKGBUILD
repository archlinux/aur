# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
pkgname=mingw-w64-glib2
pkgver=2.52.3
pkgrel=1
_commit=90bb8778f2eabf00bee5bff1259c48f1e7b791b8  # tags/2.52.3^0
arch=(any)
pkgdesc="Low level core library (mingw-w64)"
depends=(mingw-w64-libffi mingw-w64-pcre mingw-w64-gettext)
makedepends=(mingw-w64-configure python shared-mime-info mingw-w64-zlib git)
license=("LGPL")
options=(!strip !buildflags staticlibs !emptydirs)
url="http://www.gtk.org/"
source=("git+https://git.gnome.org/browse/glib#commit=$_commit"
"0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch"
"0004-glib-prefer-constructors-over-DllMain.patch"
"0027-no_sys_if_nametoindex.patch"
"0028-inode_directory.patch"
"use-pkgconfig-file-for-intl.patch"
"skip-broken-timer-test.patch")
sha256sums=('SKIP'
            'ef81e82e15fb3a71bad770be17fe4fea3f4d9cdee238d6caa39807eeea5da3e3'
            '7b099af0c562f397458542482d6d1debe437f220762aa2ed94b2e6c4d43dd8a6'
            '5cb481295ff86c2802030984d8b2bf6a3b1dcd5e5fe7b0be68b22d9116305837'
            'f7f06a90156fe0a308412512c359072922f7f0d19dd4bed30d863db18e48940b'
            '1991eaa0471ff8d0b3dd3bccccd560ca6cc8c0995c6145b9bc93d5e90755e3f4'
            'a39dc8c1c1707053d565d5b198b1f03f7c55b31e11335a1bfdc3f9803b114d5d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib
  git revert -n 6560b37450cd  # Noisy glib-compile-schemas
  patch -Np1 -i .."/0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch"
  patch -Np1 -i ../0004-glib-prefer-constructors-over-DllMain.patch
  patch -Np1 -i ../"0027-no_sys_if_nametoindex.patch"
  patch -Np1 -i ../"0028-inode_directory.patch"
  patch -p0  -i ../use-pkgconfig-file-for-intl.patch
  patch -Np1 -i ../skip-broken-timer-test.patch
  NOCONFIGURE=1 ./autogen.sh
}


build() {
  cd glib
  conf="--with-pcre=system --with-threads=win32 --disable-fam"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-configure \
      --disable-shared $conf
    make
    popd
    
    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared
    ${_arch}-configure \
      --disable-static $conf
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/glib/build-${_arch}-shared"
    make DESTDIR="$pkgdir" install
    make -C "$srcdir/glib/build-${_arch}-static" DESTDIR="$pkgdir/static" install
    mv "$pkgdir/static/usr/${_arch}/lib/"*.a "$pkgdir/usr/${_arch}/lib/"
		find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
		find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
		rm -r "$pkgdir/usr/${_arch}/lib/charset.alias"
		rm -r "$pkgdir/static"
  done
}
