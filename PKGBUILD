# $Id$
# Maintainer: soloturn@gmail.com
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: Denis (dtonator@gmail.com)

pkgname=xmoto
pkgver=0.5.11
pkgrel=7
pkgdesc="A challenging 2D motocross platform game, where physics play an important role."
arch=('i686' 'x86_64')
url="http://xmoto.tuxfamily.org"
license=('GPL')
depends=('libjpeg' 'libpng' 'lua52' 'sdl_mixer' 'ode' 'curl' 'sqlite' 'sdl_ttf'
         'sdl_net' 'glu' 'libxdg-basedir' 'libxml2')
makedepends=('mesa')
source=("http://download.tuxfamily.org/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}-src.tar.gz"
        'gcc-7.patch'
        'utf8.patch'
        'lua52_compat.patch')
sha1sums=('a795616fb359e60be343e339f7acf5e95e0f1ce2'
          'd30fad6a138de36566c5343ea04e6c7141e767f8'
          '1a64966b887ecbd7280d97988cd8526813820611'
          '104542546fbbd24172ddaa179f87e1b26df8b761')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/gcc-7.patch"
  patch -Np1 -i "${srcdir}/utf8.patch"
  patch -Np1 -i "${srcdir}/lua52_compat.patch"
  ./bootstrap

  # Remove bundled ode library because its headers get picked up during build
  rm -r src/ode
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Build using the old C++ ABI to fix issue with missing text; the issue
  # should be fixed in the next stable release (if that ever does happen)
  CPPFLAGS+=' -D_GLIBCXX_USE_CXX11_ABI=0'

  ./configure --prefix=/usr --disable-sdltest
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" mangdir=/usr/share/man/man6 install

  # install desktop file
  install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/extra/xmoto.desktop" \
        "${pkgdir}/usr/share/applications/xmoto.desktop"

  # install icon for desktop file
  install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/extra/xmoto.xpm" \
        "${pkgdir}/usr/share/pixmaps/xmoto.xpm"
}

