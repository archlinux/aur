# Maintainer: Vekhir <vekhir AT yahoo DOT com>

pkgname=hedgewars-client-hg
pkgver=r15983+.2c92499daa67+
pkgrel=1
pkgdesc="Turn-based strategy artillery game similiar to Worms (Client component)"
arch=('x86_64')
url="https://hedgewars.org"
license=('GPL' 'custom')
depends=('qt5-base' 'sdl2' 'sdl2_mixer' 'sdl2_image' 'sdl2_net' 'sdl2_ttf' 'lua51' 'ffmpeg4.4' 'glut'
         'physfs')
makedepends=('mercurial' 'fpc' 'cmake' 'qt5-tools' 'imagemagick' 'mesa')
optdepends=('hedgewars-server')
provides=('hedgewars-client')
conflicts=('hedgewars' 'hedgewars-hg')
source=("$pkgname::hg+https://hg.hedgewars.org/hedgewars/"
        "sdl2-mixer.patch")
sha512sums=('SKIP'
            '2403faa65e89959105c32651ca426b9e01ad8c1d6cb748c7e2bcf577faf995ee3f042aa9f994f161987bee14ce0749c26620656b17007deb18303a320d495f7f')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$pkgname"
  patch -p1 < ../sdl2-mixer.patch
}

build() {
  cd "$pkgname"
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
  cmake \
    -Bbuild \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDATA_INSTALL_DIR=/usr/share/hedgewars \
    -DNOSERVER=1
  make -C build

  # resize icon
  for _size in 16 32 48 64 128 256; do
    convert +set date:create +set date:modify misc/hedgewars.png -resize ${_size}x${_size} hedgewars_${_size}.png
  done
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" make -C build install
  install -D -m644 Fonts_LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/Fonts_LICENSE.txt

  # install icons
  install -D -m644 misc/hedgewars.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/hedgewars.png
  for _size in 16 32 48 64 128 256; do
    install -D -m644 hedgewars_${_size}.png "$pkgdir"/usr/share/icons/hicolor/${_size}x${_size}/apps/hedgewars.png
  done
  rm -rf "$pkgdir"/usr/share/pixmaps

  install -D -m644 share/hedgewars/Data/misc/hedgewars.desktop "$pkgdir"/usr/share/applications/hedgewars.desktop
}
