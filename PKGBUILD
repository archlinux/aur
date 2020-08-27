# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=trigger-rally-svn
_pkgname=trigger-rally
_pkgver=0.6.7
pkgver=0.6.7r982
pkgrel=1
pkgdesc="A fast-paced free software rally racing game "
arch=('i686' 'x86_64' 'aarch64')
url='https://trigger-rally.sourceforge.io/'
license=('GPL')
depends=(
  'opengl-driver'
  'glu'
  'glew'
  'openal'
  'freealut'
  'physfs'
  'sdl2'
  'sdl2_image'
  'tinyxml2'
)
makedepends=('gcc' 'subversion')
conflicts=('trigger-rally')
source=(
    "${pkgname}::svn+https://svn.code.sf.net/p/trigger-rally/code"
)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "${_pkgver}r%s" "${ver//[[:alpha:]]}"
}

build() {
    cd $pkgname/src

    make prefix=/usr \
      LOC_APPDATAFILE=/usr/share/metainfo/${_pkgname}.appdata.xml
}

package() {
    cd $pkgname/src

    install -d $pkgdir/usr/share/applications
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/share/metainfo

    make DESTDIR=$pkgdir prefix=/usr \
      LOC_APPDATAFILE=/usr/share/metainfo/${_pkgname}.appdata.xml \
      install

    # move binary
    mv "$pkgdir/usr/games/$_pkgname" $pkgdir/usr/bin/$_pkgname

    # install icons
    cd ..

    install -Dm644 data/icon/trigger-16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/$_pkgname.png"
    install -Dm644 data/icon/trigger-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
    install -Dm644 data/icon/trigger-64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_pkgname.png"
    install -Dm644 data/icon/trigger-rally-icons.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    install -Dm644 data/icon/trigger-64.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
