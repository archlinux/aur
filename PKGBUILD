# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-lame
pkgver=3.100
pkgrel=5
pkgdesc="A high quality MPEG Audio Layer III (MP3) encoder (mingw-w64)"
arch=('any')
url="http://lame.sourceforge.net/"
depends=('mingw-w64-crt' 'mingw-w64-ncurses')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure' 'nasm')
license=('LGPL')
source=("http://downloads.sourceforge.net/lame/lame-$pkgver.tar.gz"
        "lame.pc.in"
        "mingw.patch"
        "0007-revert-posix-code.patch"
        "winsock2.patch")
sha256sums=('ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e'
            '3ec0c7126cdd39288cdf4d49edbd16b770e88cd1a96cf82eb69418637047c52d'
            '3b90a1ea486b245c7a6ddc7e3c4a6b217afdcfdf918a1857633a4e509e274296'
            '1e7f61456b15ceea613de8fd982b3f892340b851393d4ca4aff44395ae237ae9'
            '340a3126c22d3a545034c726b81bba3808f0f0ded83a714336fca49a11f8a942')
b2sums=('6954d30cfd3951ea07762ba5dd7ff27038b78455f423099a225ebf748abddf9970e444456ca5a6179bd381e2205b32293392cb757c203901674860710fe2c183'
        '369c6aedb682613576429beb3790dcf1d00717a30f2ed8e7165b4a145bfb2e2787514089aed94b4bdfe4adc63f2b916926bb579102fbb6b3ae70c725b1a528db'
        '2016a58f6ca3049ef93f603546e4cf07d6c55e17ea125c52085dc77299e2aa69d97f0110f4cf973d989d1634f37a569bc02e741e08f691f721b6a421328ec0be'
        '679b392ce029ed3b2077c781131eddcfb112158a79f08ef00b1fc9bcc684a6bd0a6e98d7c7104abc0cf872027131fdb3fc72f9a9e20468a9fb1a8fd09a7969e2'
        'bce89b4dd57ad25db1f1d8ef6a7bae9bab84e6b273258efeab33d11f0902469d309b2f12c6bb1687cadd6d557cfeb1d6250e53af8cdfb383b024ddd2f7e8c294')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  for _arch in ${_architectures}; do
   sed -e "s/VERSION/$pkgver/" -e "s/ARCH/${_arch}/" lame.pc.in > lame-${_arch}.pc
  done

   cd ${srcdir}/lame-${pkgver}

   patch -Np1 -i "${srcdir}/mingw.patch"
   patch -Np1 -i "${srcdir}/0007-revert-posix-code.patch"
   patch -Np1 -i "${srcdir}/winsock2.patch"

   #autoreconf -iv
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/lame-${pkgver}/build-${_arch} && cd ${srcdir}/lame-${pkgver}/build-${_arch}

    unset LDFLAGS CPPFLAGS

    export LIBS="-lncursesw"
    export CFLAGS="-msse"
    export CPPFLAGS="-msse"

    ${_arch}-configure \
                --enable-nasm \
                --enable-mp3rtp \
                --enable-shared
    make
  done
}

check() {
  for _arch in ${_architectures}; do
      cd ${srcdir}/lame-${pkgver}/build-${_arch}
      make test
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/lame-${pkgver}/build-${_arch}

    make DESTDIR="$pkgdir" install

    ${_arch}-strip -s $pkgdir/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    rm -r $pkgdir/usr/${_arch}/share

    cd ${srcdir}
    install -vDm 644 lame-${_arch}.pc -t "$pkgdir/usr/${_arch}/lib/pkgconfig/lame.pc"
  done
}

# vim:set ts=2 sw=2 et:
