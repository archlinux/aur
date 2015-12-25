# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='pioneer-git'
pkgver=20151221.r14.gf80b393
pkgrel=1
pkgdesc="A game of lonely space adventure"
arch=('i686' 'x86_64')
url="https://github.com/pioneerspacesim/pioneer"
license=('ISC')
provides=('pioneer')
conflicts=('pioneer-bin') 
depends=('curl' 'libsigc++' 'sdl2' 'sdl2_image' 'freetype2' 'libvorbis' 'libpng' 'assimp' 'mesa' 'hicolor-icon-theme')
makedepends=('gcc' 'git' 'automake' 'pkg-config' 'naturaldocs')
source=("$pkgname::git+https://github.com/pioneerspacesim/pioneer" 'pioneer.desktop')
md5sums=('SKIP'
         'f2301fe8850926b2d9bd89e3ab1158a8')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  export PIONEER_DATA_DIR=/usr/share/pioneer
  ./bootstrap
  ./configure --prefix=/usr
  make
  make codedoc
}

package() {
  cd $pkgname
  export PIONEER_DATA_DIR=/usr/share/pioneer
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/pioneer.desktop" "$pkgdir/usr/share/applications/pioneer.desktop"
  for size in 16x16 22x22 24x24 32x32 40x40 48x48 64x64 128x128 256x256
  do
    install -Dm644 "application-icon/pngs/pioneer-$size.png" "$pkgdir/usr/share/icons/hicolor/$size/apps/pioneer.png"
  done
  install -Dm644 "application-icon/badge-enlarged-text.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pioneer.svg"
  mkdir -p "$pkgdir/usr/share/doc/pioneer" 
  cp -R codedoc/* "$pkgdir/usr/share/doc/pioneer" 
}

