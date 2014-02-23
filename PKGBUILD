# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: jose riha <jose 1711 gmail com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: nut543 <kfs1@online.no>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=cdogs
pkgver=0.5.4
pkgrel=1
pkgdesc='SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2")'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('sdl_mixer')
makedepends=('cmake')
conflicts=('cdogs-git')
source=(cdogs-$pkgver.tar.gz::"https://github.com/cxong/cdogs-sdl/archive/$pkgver.tar.gz"
        hqx-for-$pkgver.tar.gz::"https://github.com/cxong/hqx/archive/994249c8c4d1446afd9c05654bf7eafffd7a11bb.tar.gz"
        tinydir-for-$pkgver.tar.gz::"https://github.com/cxong/tinydir/archive/5545eeb7bf5ee2b64f790a276f89aa1856a6269a.tar.gz"
        cbehave-for-$pkgver.tar.gz::"https://github.com/cxong/cbehave/archive/e90cdcf2ebaedabb8f5a2595d6edf7c823a4f196.tar.gz"
        rlutil-for-$pkgver.tar.gz::"https://github.com/cxong/rlutil/archive/97348047c4340de554bb0b5c6e0d2ab34c88f05b.tar.gz")
noextract=("hqx-for-$pkgver.tar.gz" "tinydir-for-$pkgver.tar.gz" "cbehave-for-$pkgver.tar.gz" "rlutil-for-$pkgver.tar.gz")
sha256sums=('675eab5e9fafe3254cd2a42435c37809d97050bd875c748184d59565a8dda276'
            'adeef0711099da7e86c2c20b3fc40e63f32ea1e11ef0b9a98dacfc983f38f4ce'
            'ebd1c2c64724f5f5e1837e42bae1f5c67a0be4df09b7974c2d6a3d64c8314ea4'
            '16fbb9d01d7c03701447621f51033d58e1853d622bbff2930148fadd4a8e8029'
            'eca5ba880a64688591c556a0d125e0cc2b92c2c15b60e733a85f2a735728f9c7')

prepare() {
  cd $pkgname-sdl-$pkgver

  # disable -Werror (aborts build)
  sed 's|add_definitions(-Winline -Werror)|add_definitions(-Winline)|' -i CMakeLists.txt

  # fix name in .desktop file
  sed 's|Exec=cdogs-sdl|Exec=cdogs|g' -i build/linux/cdogs-sdl.desktop

  # extract submodules
  bsdtar -x --strip-components 1 -f ../hqx-for-$pkgver.tar.gz -C src/cdogs/hqx
  bsdtar -x --strip-components 1 -f ../tinydir-for-$pkgver.tar.gz -C src/tinydir
  bsdtar -x --strip-components 1 -f ../cbehave-for-$pkgver.tar.gz -C src/tests/cbehave
  bsdtar -x --strip-components 1 -f ../rlutil-for-$pkgver.tar.gz -C src/tests/cbehave/rlutil
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
