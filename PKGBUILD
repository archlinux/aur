# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='pioneer'
pkgver=20171001
pkgrel=1
pkgdesc="A game of lonely space adventure"
arch=('i686' 'x86_64')
url="https://github.com/pioneerspacesim/pioneer"
license=('GPL')
provides=('pioneer')
conflicts=('pioneer-bin' 'pioneer-git')
depends=('libsigc++' 'sdl2_image' 'freetype2' 'libvorbis' 'assimp' 'hicolor-icon-theme')
makedepends=('naturaldocs')
source=("$pkgname-$pkgver.tar.gz::http://github.com/pioneerspacesim/pioneer/archive/$pkgver.tar.gz" 'pioneer.desktop')
sha256sums=('154118bd3dac2f9b8ea43a837bcb967abcc8c3a8ee5ab61d35183bae85e8b0db'
            '31cc3f86dbab4dea44fc61312cbba30dc6d267a3d844bbb866fd2156c29032ef')

build() {
  cd "$pkgname-$pkgver"
  export PIONEER_DATA_DIR=/usr/share/pioneer
  ./bootstrap
  ./configure CXXFLAGS='-fPIC' --prefix=/usr
  make
  make codedoc
}

package() {
  cd "$pkgname-$pkgver"
  export PIONEER_DATA_DIR=/usr/share/pioneer
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/pioneer.desktop" "$pkgdir/usr/share/applications/pioneer.desktop"
  for icon in application-icon/pngs/*
  do
    if [[ $icon =~ pioneer-([0-9]+x[0-9]+).png ]]; then
      install -Dm644 $icon "$pkgdir/usr/share/icons/hicolor/${BASH_REMATCH[1]}/apps/pioneer.png"
    fi
  done
  install -Dm644 "application-icon/badge-enlarged-text.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pioneer.svg"
  mkdir -p "$pkgdir/usr/share/doc/pioneer"
  cp -R codedoc/* "$pkgdir/usr/share/doc/pioneer"
}
