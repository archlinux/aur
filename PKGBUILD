# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-dbus-c++
_pkgname=libdbus-c++
_upstream="dbus-cplusplus"
pkgver=0.9.0
pkgrel=1
pkgdesc="A C++ API for D-BUS (mingw-w64)"
arch=('any')
url="http://dbus-cplusplus.sourceforge.net/"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-dbus' 'mingw-w64-glib2')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://sourceforge.net/projects/${_upstream}/files/dbus-c++/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'gcc47.patch'
        'disable-threading.patch'
        'fix-writechar.patch'
        'dbus-c++-0.9.0-mingw.patch')
sha512sums=('7acebbb4254b2886cc0f05c5ddeeeac0b5863c5552d32249463b89380b0b95b8225c80bd98b8c7fcaada42ab770b5eff41b15390cd0d78bf1ee322ac6c2de319'
            'd8618e1eafd25be074ffecf958fbc04f1b2a844c865ec2d795565809a5d11e7f60c1a8c3a6d952b1485af6b199753b36c06f1759a5559274eed55cf5e6585e20'
            '94d95089ea84af1438191285955bf0866a7d7cbe535ac7fb8282ef6fb96c4ee052f439fb8c9d0b18b9ebec65d39cc45754bb48192ffb46c3d0c4ed6b1b6693a6'
            'df0a3a80d139877eaea5f352da5dfa2bc0407360ddfb59301707c77bd4329ecd986f366f27bbdd7e4ce385125c6ec46fcf115854aa01d97cf11dff905cd9a385'
            '49198f9930dacfc7569e4626adca649039f7d21c69a75067a20f43280e18370c67f5b56efa9866962043e47923f1d225115ab4bf488510eb343b58b75f777e1d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -Np0 -i "${srcdir}/gcc47.patch"
    patch -Np1 -i "${srcdir}/disable-threading.patch"
    patch -Np1 -i "${srcdir}/fix-writechar.patch"
    patch -Np1 -i "${srcdir}/dbus-c++-0.9.0-mingw.patch"
    autoreconf -vi
}

build() {
  cd "${srcdir}/${_pkgname}-$pkgver/"

  export LIBS+=" -lexpat -lpthread -lws2_32" # -lpthread needed for i686
  export CPPFLAGS+=" -D_WIN32_WINNT=0x600" # needed to build with winsock2.h

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
    --disable-ecore \
    --disable-glib \
    --disable-tests \
    --disable-examples \
    ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
