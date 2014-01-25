# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: jose riha <jose 1711 gmail com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: nut543 <kfs1@online.no>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=cdogs
pkgver=0.5.3
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
        tinydir-for-$pkgver.tar.gz::"https://github.com/cxong/tinydir/archive/10561a348a74a839276d3f81505a21a4ab1960ec.tar.gz"
        cbehave-for-$pkgver.tar.gz::"https://github.com/cxong/cbehave/archive/dd7572bccc5b291e6e9ced0a694030fd30b622a6.tar.gz"
        rlutil-for-$pkgver.tar.gz::"https://github.com/cxong/rlutil/archive/b84226ac1345cc62ab7d92c13f4fa27434a99946.tar.gz")
noextract=("hqx-for-$pkgver.tar.gz" "tinydir-for-$pkgver.tar.gz" "cbehave-for-$pkgver.tar.gz" "rlutil-for-$pkgver.tar.gz")
sha256sums=('ecf775a91c257703ce622f28e967e317f0e605a80bc46facf3e89100d8268219'
            'adeef0711099da7e86c2c20b3fc40e63f32ea1e11ef0b9a98dacfc983f38f4ce'
            '402002b715043bb95ee5a604508de83737ed67e3b98b0eb0aa3e0a63700f4dfd'
            '7d367e4f14f2a2d65a40354fa6864cb13f0b2be14b367ae8e948b38021b3361a'
            'dec6d24c82a88c7b1fb84b60f6e026916cb8c628af30f88400ff6c9f3ccb7727')

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
