# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: jose riha <jose 1711 gmail com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: nut543 <kfs1@online.no>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=cdogs
pkgver=0.5.5
pkgrel=1
pkgdesc='SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2")'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('sdl_mixer' 'sdl_image')
makedepends=('cmake')
source=(cdogs-$pkgver.tar.gz::"https://github.com/cxong/cdogs-sdl/archive/$pkgver.tar.gz"
        hqx-for-$pkgver.tar.gz::"https://github.com/cxong/hqx/archive/2a8a05854ad2147425d0b55a3c40e81c368c97fd.tar.gz"
        cbehave-for-$pkgver.tar.gz::"https://github.com/cxong/cbehave/archive/4ab8ce9fe7662c593ce92d5f99f6b60dbaeadad7.tar.gz"
        rlutil-for-$pkgver.tar.gz::"https://github.com/cxong/rlutil/archive/1407ec0e1775366aed527b6113dd14a02d046c09.tar.gz"
        tinydir-for-$pkgver.tar.gz::"https://github.com/cxong/tinydir/archive/5545eeb7bf5ee2b64f790a276f89aa1856a6269a.tar.gz")
sha256sums=('144ddf2a818f7bdac159cabb94d3aefeb9a0879ac06ff0c4987d8e5084fbfa9e'
            'fca25adefd14af3584dcf0e48c69647aa46a924ddbfcb75ec6053528f1bd80bc'
            'df3f546c63ab1517d2ae3053e2156f80555d3ddf96328190527965e1ca5dfc9d'
            '42116a68a2fd8e810529df65e2703a3c3cd89d34e5e4652e3955e11f4d55abfe'
            'ebd1c2c64724f5f5e1837e42bae1f5c67a0be4df09b7974c2d6a3d64c8314ea4')

prepare() {
  # copy submodules to right location
  cp -rup hqx-2a8a05854ad2147425d0b55a3c40e81c368c97fd/* $pkgname-sdl-$pkgver/src/cdogs/hqx
  cp -rup cbehave-4ab8ce9fe7662c593ce92d5f99f6b60dbaeadad7/* $pkgname-sdl-$pkgver/src/tests/cbehave
  cp -rup rlutil-1407ec0e1775366aed527b6113dd14a02d046c09/* $pkgname-sdl-$pkgver/src/tests/cbehave/rlutil
  cp -rup tinydir-5545eeb7bf5ee2b64f790a276f89aa1856a6269a/* $pkgname-sdl-$pkgver/src/tinydir

  cd $pkgname-sdl-$pkgver

  # disable -Werror (aborts build)
  sed 's|add_definitions(-Winline -Werror)|add_definitions(-Winline)|' -i CMakeLists.txt

  # fix name in .desktop file
  sed 's|Exec=cdogs-sdl|Exec=cdogs|g' -i build/linux/cdogs-sdl.desktop
}

build() {
  cd $pkgname-sdl-$pkgver

  cmake ./ -DDESTDIR=/opt/cdogs/bin
  make
}

package() {
  cd $pkgname-sdl-$pkgver

  # launcher + binary
  install -Dm755 build/linux/cdogs-sdl "$pkgdir"/usr/bin/cdogs
  install -Dm755 src/cdogs-sdl "$pkgdir"/opt/cdogs/bin/cdogs-sdl
  # data
  cp -r dogfights graphics missions music sounds "$pkgdir"/opt/cdogs/
  # doc
  install -d "$pkgdir"/usr/share/doc/cdogs
  cp -r doc/* "$pkgdir"/usr/share/doc/cdogs
  ln -s /usr/share/doc/cdogs/ "$pkgdir"/opt/cdogs/doc
  # .desktop file
  install -Dm644 build/linux/cdogs-icon.48.png "$pkgdir"/usr/share/pixmaps/cdogs_icon.png
  install -Dm644 build/linux/cdogs-sdl.desktop "$pkgdir"/usr/share/applications/cdogs.desktop
}
