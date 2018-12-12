# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libpaper
_pkgname=libpaper
pkgver=1.1.26
pkgrel=1
_suffix=
pkgdesc="Library for handling paper characteristics (mingw-w64)"
arch=('any')
url='https://packages.debian.org/unstable/source/libpaper'
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'gettext')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://http.debian.net/debian/pool/main/libp/libpaper/${_pkgname}_${pkgver}${_suffix}.tar.gz"
        "001-no-undefined.patch")
sha256sums=('a6950b67df66a53e974ffe0baec9a52775b909dd2c51497139af2af4e46519b1'
            'a77784a1a2dce1bf0155ee0cd889157fdbb67024e2967d3b0466a39849ac75f0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_suffix}"
  patch -p1 -i ${srcdir}/001-no-undefined.patch
  autoreconf -vfi
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_suffix}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --sysconfdir=/usr/${_arch}/etc \
      --sbindir=/usr/${_arch}/bin \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}${_suffix}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    
    # add systemwide default papersize read by many office applications
    install -dm 755 ${pkgdir}/usr/${_arch}/etc
    echo '# Simply write the paper name. See papersize(5) for possible values' > ${pkgdir}/usr/${_arch}/etc/papersize
    
    # add libpaper.d directory other packages can use to store files
    install -dm 755 ${pkgdir}/usr/${_arch}/etc/libpaper.d
    # add localisation
    pushd ${srcdir}/${_pkgname}-${pkgver}${_suffix}/debian/po
      for i in `ls *.po`; do
        install -dm 755 ${pkgdir}/usr/${_arch}/share/locale/${i%.po}/LC_MESSAGES/;
        msgfmt $i -o ${pkgdir}/usr/${_arch}/share/locale/${i%.po}/LC_MESSAGES/${_pkgname}.mo;
      done
    popd
    
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
