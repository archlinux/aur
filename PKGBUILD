# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-js17
pkgver=17.0.0
pkgrel=4
pkgdesc='JavaScript interpreter and libraries (legacy)'
arch=('x86_64')
url='https://developer.mozilla.org/En/SpiderMonkey/17'
license=('MPL')
depends=('gcc-libs-multilib' 'js17' 'lib32-nspr' 'lib32-readline')
makedepends=('gcc-multilib' 'lib32-libffi' 'python2' 'zip')
source=("http://ftp.mozilla.org/pub/mozilla.org/js/mozjs${pkgver}.tar.gz"
        'js17-perl-milestone.patch')
sha256sums=('321e964fe9386785d3bf80870640f2fa1c683e32fe988eeb201b04471c172fba'
            'c77994e0a89a33b1ad06f39b20bc605ee882a82cd373778f12eaa410c8db645f')

prepare() {
  cd mozjs${pkgver}

  patch -Np1 -i ../js17-perl-milestone.patch
}

build() {
  cd mozjs${pkgver}/js/src

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export RANLIB='ranlib'
  export AR='ar'
  export AS='as'
  export LD='ld'
  export STRIP='strip'

  unset CPPFLAGS

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --sbindir='/usr/bin' \
    --target='i686-pc-linux-gnu' \
    --enable-{readline,threadsafe} \
    --with-nspr-cflags="$(pkg-config --cflags nspr)" \
    --with-nspr-libs="$(pkg-config --libs nspr)" \
    --with-system-ffi
  make
}

package() {
  cd mozjs${pkgver}/js/src

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
  find "${pkgdir}"/usr/lib32/pkgconfig -type f -exec chmod -x {} +
}

# vim: ts=2 sw=2 et:
