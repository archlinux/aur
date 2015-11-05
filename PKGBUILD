# Maintainer: Peter Vasil <mail@petervasil.net>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: sputnick <gilles DOT quenot AT gmail DOT com>

pkgname=xwax-git
_name=xwax
pkgver=1.6.beta2
pkgrel=1
pkgdesc='Open-source vinyl emulation software for Linux.'
arch=('i686' 'x86_64')
url='http://www.xwax.co.uk/'
license=('GPL')
depends=('alsa-lib' 'sdl_ttf' 'ttf-dejavu' 'jack')
optdepends=('cdparanoia: for CD import'
            'mpg123: for MP3 import'
            'ffmpeg: for video fallback import')
source=("${pkgname}::git+http://xwax.org/devel/xwax.git")
md5sums=('SKIP')
conflicts=('xwax')
provides=('xwax')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  cd "${srcdir}/${pkgname}"

  # patch "rig.c" to use Arch Linux's default rtprio value
  sed -i 's/^#define REALTIME_PRIORITY 80/#define REALTIME_PRIORITY 65/' rig.c

  ./configure --enable-alsa --enable-jack --prefix /usr
  make EXECDIR="/usr/share/${_name}"
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" EXECDIR="/usr/share/${_name}" install
}
