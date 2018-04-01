# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='pioneer-git'
pkgver=20180203.r31.g8600607e6
pkgrel=1
pkgdesc="A game of lonely space adventure"
arch=('i686' 'x86_64')
url="https://github.com/pioneerspacesim/pioneer"
license=('GPL')
provides=('pioneer')
conflicts=('pioneer-bin' 'pioneer')
depends=('libsigc++' 'sdl2_image' 'freetype2' 'libvorbis' 'assimp' 'hicolor-icon-theme')
makedepends=('naturaldocs')
source=("$pkgname::git+https://github.com/pioneerspacesim/pioneer" 'pioneer.desktop')
sha256sums=('SKIP'
            '31cc3f86dbab4dea44fc61312cbba30dc6d267a3d844bbb866fd2156c29032ef')
#install=pioneer.install

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  export PIONEER_DATA_DIR=/usr/share/pioneer
  ./bootstrap
  ./configure CXXFLAGS='-fPIC' --prefix=/usr
  make
  make codedoc
}

package() {
  cd $pkgname
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
