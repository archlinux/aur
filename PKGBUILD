# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
pkgname=mingw-w64-glib2
pkgver=2.56.2
pkgrel=2
_commit=d4b60396c79c7294ab69a2c591518e76ab17b603  # tags/2.56.2^0
arch=(any)
pkgdesc="Low level core library (mingw-w64)"
depends=(mingw-w64-libffi mingw-w64-pcre mingw-w64-gettext mingw-w64-zlib)
makedepends=(mingw-w64-configure python shared-mime-info git)
license=("LGPL2.1")
options=(!strip !buildflags staticlibs !emptydirs)
url="http://www.gtk.org/"
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
"0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch"
"0004-glib-prefer-constructors-over-DllMain.patch"
"0028-inode_directory.patch"
"use-pkgconfig-file-for-intl.patch"
"skip-broken-timer-test.patch"
"0001-gsocket-fix-cross-compilation.patch")
sha256sums=('SKIP'
            'ef81e82e15fb3a71bad770be17fe4fea3f4d9cdee238d6caa39807eeea5da3e3'
            '7b099af0c562f397458542482d6d1debe437f220762aa2ed94b2e6c4d43dd8a6'
            'f7f06a90156fe0a308412512c359072922f7f0d19dd4bed30d863db18e48940b'
            '1991eaa0471ff8d0b3dd3bccccd560ca6cc8c0995c6145b9bc93d5e90755e3f4'
            'a39dc8c1c1707053d565d5b198b1f03f7c55b31e11335a1bfdc3f9803b114d5d'
            '44c8c6b4ca376177a8c333a00c3485d638f8641967503e15364606d4c4292ff3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib
  patch -Np1 -i .."/0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch"
  patch -Np1 -i ../0004-glib-prefer-constructors-over-DllMain.patch
  patch -Np1 -i ../"0028-inode_directory.patch"
  patch -p0  -i ../use-pkgconfig-file-for-intl.patch
  patch -Np1 -i ../skip-broken-timer-test.patch
  patch -Np1 -i ../0001-gsocket-fix-cross-compilation.patch
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

# vim: ts=2 sw=2 et:
