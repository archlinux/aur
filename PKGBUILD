pkgname='mingw-w64-libpurple'

_pkgname='pidgin'

pkgver=2.14.8
pkgrel=1
arch=('any')
url="https://pidgin.im/"
license=('GPL')
makedepends=('mingw-w64-configure' 'mingw-w64-gcc')
options=(!emptydirs !strip !buildflags)
source=(https://downloads.sourceforge.net/project/pidgin/Pidgin/$pkgver/$_pkgname-$pkgver.tar.bz2{,.asc})
sha256sums=('3f8085c0211c4ca1ba9f8a03889b3d60738432c1673b57b0086070ef6e094cca'
            'SKIP')
validpgpkeys=('40DE1DC7288FE3F50AB938C548F66AFFD9BDB729') # Gary Kramlich <grim@reaperworld.com>

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd $_pkgname-$pkgver
  sed -b -i 's,-I\$(NSS_TOP)/include,-I$(NSS_TOP)/include/nspr -I$(NSS_TOP)/include/nss3,' libpurple/plugins/ssl/Makefile.mingw
  sed -b -i \
    -e 's,\$(NSS_TOP)/lib/\([^/]*[.]dll\),$(NSS_TOP)/bin/\1,g' \
    -e 's,/sqlite3.dll,/libsqlite3-0.dll,g' \
    libpurple/plugins/ssl/Makefile.mingw

  sed -b -i \
    -e 's,\(\t*\)\(.*PERL_PLUGIN.*\),\1#\2,' \
    libpurple/plugins/Makefile.mingw
}

build() {
  for _arch in ${_architectures}; do
    cp -aT "$_pkgname-$pkgver" "build-${_arch}"
    pushd build-${_arch}/libpurple
    
    make \
      CC=${_arch}-gcc \
      WINDRES=${_arch}-windres \
      STRIP=${_arch}-strip \
      GTK_TOP=/usr/${_arch} \
      LIBXML2_TOP=/usr/${_arch} \
      CYRUS_SASL_TOP=/usr/${_arch} \
      MEANWHILE_TOP=/usr/${_arch} \
      NSS_TOP=/usr/${_arch} \
      SILC_TOOLKIT=/usr/${_arch} \
      -f Makefile.mingw install

    popd
  done
}

package_mingw-w64-libpurple(){
  pkgdesc="IM library extracted from Pidgin"
  depends=(mingw-w64-libxml2 mingw-w64-cyrus-sasl mingw-w64-nss mingw-w64-meanwhile mingw-w64-silc-toolkit)

  for _arch in ${_architectures}; do
    pushd build-${_arch}/libpurple
    #ls win32-install-dir
    
    install -d -m755 "$pkgdir/usr/$_arch/include/libpurple" "$pkgdir/usr/$_arch/bin" "$pkgdir/usr/$_arch/lib" "$pkgdir/usr/$_arch/lib/pkgconfig"
    install -m644 `ls *.h | grep -v 'internal.h\|purple-client.h\|valgrind.h'` "$pkgdir/usr/$_arch/include/libpurple"
    install -m644 libpurple.dll.a "$pkgdir/usr/$_arch/lib"
    install -m755 libpurple.dll "$pkgdir/usr/$_arch/bin"

{
echo "prefix=/usr/$_arch"
cat <<'EOFCONF'
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include
datarootdir=${prefix}/share
datadir=${datarootdir}
sysconfdir=${prefix}/etc
gstreamer=1.0

plugindir=${libdir}/purple-2

Name: libpurple
Description: libpurple is a GLib-based instant messenger library.
Version: 2.14.8
Requires: glib-2.0
Cflags: -I${includedir}/libpurple
Libs: -L${libdir} -lpurple
EOFCONF
} >"${pkgdir:?}/usr/${_arch:?}/lib/pkgconfig/purple.pc"

    popd
  done
}

# vim:set ts=2 sw=2 et:
