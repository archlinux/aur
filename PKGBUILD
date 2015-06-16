# Maintainer: Cravix < dr dot neemous at gmail dot com >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=freegish-git
_pkgname=freegish
pkgver=1.60.181.f53d915
pkgrel=1
pkgdesc="Free version of gish, a physics platformer"
arch=('x86_64' 'i686')
#url="http://github.com/FrozenCow/gish"
url="http://github.com/freegish/freegish"
license=('GPL')
depends=('sdl' 'openal' 'libvorbis' 'libpng' 'libgl')
makedepends=('git' 'cmake' 'mesa' 'imagemagick')
provides=('freegish')
conflicts=('freegish')
install='freegish.install'

source=("git://github.com/${_pkgname}/${_pkgname}"
        'freegish.desktop'
        'libmath.patch')

md5sums=('SKIP'
         '45a57af69e7e6becdac80ed85d87f871'
         '92f82b888c2f3766af4e17684f84f04e')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo 1.60.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  # libmath fix...
  patch -p1 < ../libmath.patch
  mkdir build && cd build
  cmake ..
  make
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 ${_pkgname} $pkgdir/usr/bin/${_pkgname}
  install -dm755 $pkgdir/usr/share/${_pkgname}
  mkdir -p $pkgdir/usr/share/{icons,applications}

  # i don't know if there's a better way instead of using imagemagick... hmm
  convert ${_pkgname}.bmp $pkgdir/usr/share/icons/${_pkgname}.png

  install -m644 ${srcdir}/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
  # there's no texturesets or tile0{1,2,3} dir in git repo...
  cp -r animation level music sound texture $pkgdir/usr/share/${_pkgname}
}

# vim: sw=2:ts=2 et:
