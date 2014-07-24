# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: jose riha, Christoph Zeiler, nut543 and Dany Martineau

pkgname=cdogs
pkgver=0.5.6
pkgrel=1
pkgdesc='SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2")'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('sdl_mixer' 'sdl_image' 'sdl_net')
makedepends=('cmake')
source=(cdogs-$pkgver.tar.gz::"https://github.com/cxong/cdogs-sdl/archive/$pkgver.tar.gz"
        hqx-for-$pkgver.tar.gz::"https://github.com/cxong/hqx/archive/2a8a05854ad2147425d0b55a3c40e81c368c97fd.tar.gz"
        cbehave-for-$pkgver.tar.gz::"https://github.com/cxong/cbehave/archive/4ab8ce9fe7662c593ce92d5f99f6b60dbaeadad7.tar.gz"
        rlutil-for-$pkgver.tar.gz::"https://github.com/cxong/rlutil/archive/1407ec0e1775366aed527b6113dd14a02d046c09.tar.gz"
        tinydir-for-$pkgver.tar.gz::"https://github.com/cxong/tinydir/archive/53aab97d6a11d70d669ce9c36d0d90ec6937c33d.tar.gz")
sha256sums=('7ead552ed98ce0606ec671f783e3b192cefd0ed37a0b2c8e856eda6d5e9ede1c'
            'fca25adefd14af3584dcf0e48c69647aa46a924ddbfcb75ec6053528f1bd80bc'
            'df3f546c63ab1517d2ae3053e2156f80555d3ddf96328190527965e1ca5dfc9d'
            '42116a68a2fd8e810529df65e2703a3c3cd89d34e5e4652e3955e11f4d55abfe'
            '2d71972034d570ac506dee5909cfac72c1870734228a61b266e354f2d9acf277')

prepare() {
  # copy submodules to right location
  cp -rup hqx-2a8a05854ad2147425d0b55a3c40e81c368c97fd/* $pkgname-sdl-$pkgver/src/cdogs/hqx
  cp -rup cbehave-4ab8ce9fe7662c593ce92d5f99f6b60dbaeadad7/* $pkgname-sdl-$pkgver/src/tests/cbehave
  cp -rup rlutil-1407ec0e1775366aed527b6113dd14a02d046c09/* $pkgname-sdl-$pkgver/src/tests/cbehave/rlutil
  cp -rup tinydir-53aab97d6a11d70d669ce9c36d0d90ec6937c33d/* $pkgname-sdl-$pkgver/src/tinydir

  cd $pkgname-sdl-$pkgver

  # disable -Werror (aborts build) and change data directory
  sed 's| -Werror||;s|CDOGS_DATA_DIR "../"|CDOGS_DATA_DIR "/usr/share/cdogs/"|' \
    -i CMakeLists.txt

  # fix name in .desktop file
  sed 's|cdogs-sdl|cdogs|g' -i build/linux/cdogs-sdl.desktop
}

build() {
  cd $pkgname-sdl-$pkgver

  cmake ./
  make
}

package() {
  cd $pkgname-sdl-$pkgver

  # binary
  install -Dm755 src/cdogs-sdl "$pkgdir"/usr/bin/cdogs
  # data
  install -d "$pkgdir"/usr/share/cdogs
  cp -r doc dogfights graphics missions music sounds *.json "$pkgdir"/usr/share/cdogs
  # doc
  install -d "$pkgdir"/usr/share/doc
  ln -s /usr/share/cdogs/doc "$pkgdir"/usr/share/doc/cdogs
  # .desktop file
  install -Dm644 build/linux/cdogs-icon.48.png "$pkgdir"/usr/share/pixmaps/cdogs.png
  install -Dm644 build/linux/cdogs-sdl.desktop "$pkgdir"/usr/share/applications/cdogs.desktop
}
