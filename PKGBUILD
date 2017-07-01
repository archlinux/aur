# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: oi_wtf <brainpower@gulli.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Tom Killian <tomk@runbox.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=lib32-libnewt
pkgver=0.52.20
pkgrel=1
pkgdesc="Not Erik's Windowing Toolkit - text mode windowing with slang"
arch=('x86_64')
url='https://fedorahosted.org/newt/'
license=('GPL')
depends=('lib32-glibc' 'lib32-gpm' 'lib32-popt' 'lib32-slang' 'libnewt')
makedepends=('gcc-multilib' 'lib32-tcl')
optdepends=('lib32-tcl: whiptcl support')
options=('!makeflags')
source=("https://releases.pagure.org/newt/newt-${pkgver}.tar.gz")
sha256sums=('8d66ba6beffc3f786d4ccfee9d2b43d93484680ef8db9397a4fb70b5adbb6dbc')

prepare() {
  cd newt-${pkgver}

  sed -i "s:tcl8.4:tcl8.6:" Makefile.in
  echo '#define USE_INTERP_RESULT 1' >> config.h
}

build() {
  cd newt-${pkgver}

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --with-gpm-support \
    --without-python
  make
}

package() {
  cd newt-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
