# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-nspr
pkgver=4.19
pkgrel=1
pkgdesc="Netscape Portable Runtime (mingw-w64)"
arch=('any')
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR"
license=('MPL' 'GPL')
makedepends=('mingw-w64-configure' 'zip')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${pkgver}/src/nspr-${pkgver}.tar.gz
        nspr-4.10.6-mswsock.patch
        nspr-4.10.2_autotools.patch
        nspr-4.10.2_mingw.patch
        nspr-4.10.2_staticbuild.patch
        nspr-4.10.2_x64.patch
        nspr-4.19-threads.patch)
sha256sums=('2ed95917fa2277910d1d1cf36030607dccc0ba522bba08e2af13c113dcd8f729'
            '725f8d6da56e44dba7669c498ed66af1b2145640115fd9bae9663c9364d9fde9'
            'e3358ed82a289b76b23ceb95308a517145e8c915c0056af58ad1193db870269a'
            '4f47fbfce21a5634094d6a0c7fdd29f2bbdcb352074b8c498ba23a9f4f859b29'
            'bdb7138b12b7fbc32e906347e0dc963342316032ac3db8586683e54e40126e26'
            '599ab9edb21568c02c4e6e96b366e51c042a9e789b72b9e7d9b7acc283757ab4'
            '9737166a7d3c99e1b5979a28412212b648eef9e749a64077607731eee2050f41')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/nspr-${pkgver}/nspr"
  patch -p1 -i ${srcdir}/nspr-4.10.6-mswsock.patch
  patch -p0 -i ${srcdir}/nspr-4.10.2_autotools.patch
  patch -p0 -i ${srcdir}/nspr-4.10.2_mingw.patch
  patch -p0 -i ${srcdir}/nspr-4.10.2_staticbuild.patch
  patch -p0 -i ${srcdir}/nspr-4.10.2_x64.patch
  patch -p0 -i ${srcdir}/nspr-4.19-threads.patch
}

build() {
  cd "${srcdir}/nspr-${pkgver}/nspr"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    if [ "${_arch}" = "x86_64-w64-mingw32" ]; then
      _confflags="--enable-64bit"
    else
      _confflags=""
    fi
    
    ${_arch}-configure \
      --includedir=/usr/${_arch}/include/nspr \
      --enable-optimize \
      --disable-debug \
      --enable-win32-target=WINNT \
      --enable-user-threads \
      ${_confflags} \
      ..

    make -C config CC=/usr/bin/gcc CFLAGS=" -DXP_UNIX=1"
    
    make \
      NSINSTALL=$(pwd)/config/nsinstall \
      RANLIB=${_arch}-ranlib \
      RC=${_arch}-windres
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/nspr-${pkgver}/nspr/build-${_arch}"
    make DESTDIR="${pkgdir}" install NSINSTALL=$(pwd)/config/nsinstall
    
    mv ${pkgdir}/usr/${_arch}/lib/*.dll ${pkgdir}/usr/${_arch}/bin/
    
    cp config/nspr.pc "${pkgdir}/usr/${_arch}/lib/pkgconfig/mozilla-nspr.pc"
    rm -r ${pkgdir}/usr/${_arch}/bin/{compile-et.pl,prerr.properties} \
    ${pkgdir}/usr/${_arch}/include/nspr/md
    
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
