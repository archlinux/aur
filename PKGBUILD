# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
pkgname=mingw-w64-glib2
pkgver=2.44.1
pkgrel=2
arch=(any)
pkgdesc="Common C routines used by GTK+ and other libs (mingw-w64)"
depends=(mingw-w64-gettext mingw-w64-zlib mingw-w64-libffi mingw-w64-pcre mingw-w64-freetype)
makedepends=(mingw-w64-configure python)
license=("LGPL")
options=(!strip !buildflags staticlibs)
url="http://www.gtk.org/"
source=("http://ftp.gnome.org/pub/GNOME/sources/glib/${pkgver%.*}/glib-$pkgver.tar.xz"
"0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch"
"0002-GNetworkMonitorBase-don-t-fail-when-IPv6-support-is-.patch"
"0003-g_abort.all.patch"
"0004-glib-prefer-constructors-over-DllMain.patch"
"0005-glib-send-log-messages-to-correct-stdout-and-stderr.patch"
"0015-fix-stat.all.patch"
"0021-use-64bit-stat-for-localfile-size-calc.all.patch"
"0024-return-actually-written-data-in-printf.all.patch"
"0027-no_sys_if_nametoindex.patch"
"0028-inode_directory.patch")
sha256sums=('8811deacaf8a503d0a9b701777ea079ca6a4277be10e3d730d2112735d5eca07'
            '1420d8a8cadef2d33d748b31e5ae9c385aee1351d267dabf7a6a68fed6dfe7db'
            '5551461a90386837356d2b56d4011e5272ba1d3e6bc4262275ea0b7d0dfbce82'
            '6df7b4e00aa7ded9e2e9e729dd1fb3f78e11c5936b316ebf9cf102c9043756f4'
            '7d1096d4a799df63939ded9437bcd39ad13ab71ba213ef7c83abd6ebf4efaf6e'
            '4e636326f39261dc359784853bd61a897f8bb2d438fffc256ae60bb580799f16'
            '9ba68777f48816cbee154084c10d0d577a021ef406606d5c2d230761cf82b66b'
            'ad13c9aaa3d2ca7b1e3dcfd6d0c8043fa4fe45d8abb3659dbbc1fcbc412c10c7'
            '497d057e79943df233ca304c389f462d3c4bf55ab3267e94dbef892b79fe3274'
            'bf80d21ed1931f839d5920d0c3633b7c84ceb8f6da051cecc942ce90eccb883f'
            '97384c3e72f7d419eaa2377aeb85a382ce5441c5858e2c986a70dd380d3e1c1b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd glib-$pkgver
  patch -Np1 -i "$srcdir/0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch"
  patch -Np1 -i ../0002-GNetworkMonitorBase-don-t-fail-when-IPv6-support-is-.patch
  patch -Np1 -i "$srcdir/0003-g_abort.all.patch"
  patch -Np1 -i "$srcdir/0004-glib-prefer-constructors-over-DllMain.patch"
  patch -Np0 -i "$srcdir/0005-glib-send-log-messages-to-correct-stdout-and-stderr.patch"
  patch -Np1 -i "$srcdir/0015-fix-stat.all.patch"
  patch -Np1 -i "$srcdir/0021-use-64bit-stat-for-localfile-size-calc.all.patch"
  patch -Np1 -i "$srcdir/0024-return-actually-written-data-in-printf.all.patch"
  patch -Np1 -i "$srcdir/0027-no_sys_if_nametoindex.patch"
  patch -Np1 -i "$srcdir/0028-inode_directory.patch"
  
  NOCONFIGURE=1 ./autogen.sh
}


build() {
  cd glib-$pkgver
  conf="--with-pcre=system --with-threads=win32"
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
    cd "$srcdir/glib-$pkgver/build-${_arch}-shared"
    make DESTDIR="$pkgdir" install
    make -C "$srcdir/glib-$pkgver/build-${_arch}-static" DESTDIR="$pkgdir/static" install
    mv "$pkgdir/static/usr/${_arch}/lib/"*.a "$pkgdir/usr/${_arch}/lib/"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.def' | xargs -rtl1 rm
		find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
		rm "$pkgdir/usr/${_arch}/bin/"{glib-{gettextize,mkenums},gdbus-codegen}
		rm -r "$pkgdir/usr/${_arch}/lib/charset.alias"
		rm -r "$pkgdir/static"
		rm -r "$pkgdir/usr/${_arch}/share"
  done
}
