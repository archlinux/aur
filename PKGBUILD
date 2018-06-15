# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Petteri Tolonen <petteri dot tolonen at gmail dot com>
# Contributor: erm67
# Contributor: JD Steffen

pkgname=hexen2
pkgver=1.5.9
_gamecodever=1.29b
pkgrel=1
pkgdesc="Hammer of Thyrion: Raven Software's Hexen II source port (based on Anvil of Thyrion)"
arch=('i686' 'x86_64')
url="http://uhexen2.sourceforge.net/"
license=('GPL2')
depends=('bash' 'libmad' 'libvorbis' 'sdl')
makedepends=('nasm')
provides=('hexenworld')
install=hexen2.install
source=("http://downloads.sourceforge.net/uhexen2/hexen2source-$pkgver.tgz"
        "http://downloads.sourceforge.net/uhexen2/hexen2source-gamecode-$pkgver.tgz"
        "http://downloads.sourceforge.net/uhexen2/hexenworld-pakfiles-0.15.tgz"
        "hexen2.desktop"
        "hexen2.sh")
sha256sums=('2aa84c141a820f9087850aacf3684a5f71c434428bc57545899eda1b9a28c3e0'
            '15188ecace6f8431af88d096aae2c4ff9e41c0e1b3e107eee0c4f5f9d09d34bb'
            '49462cdf984deee7350d03c7d192d1c34d682647ffc9d06de4308e0a7c71c4d9'
            'fa0bde060ba3afda3683b96d7ece23161816a04a2365ba996c1cb07268d6580f'
            '9882421ee54afa4995c11e3759ab7fffb59a448291f0d647b3857d43b5cf27a9')

prepare() {
  sed 's|^hexen2dir=.*$|hexen2dir=/opt/hexen2|' -i hexen2source-$pkgver/scripts/hexen2-run.sh
}

build() {
  cd hexen2source-$pkgver

  # main game
  make -C engine/hexen2 h2
  make -s -C engine/hexen2 localclean
  make -C engine/hexen2 glh2
  make -s -C engine/hexen2 localclean

  # dedicated server
  make -C engine/hexen2/server

  # HexenWorld
  make -C engine/hexenworld/server
  make -s -C engine/hexenworld/client localclean
  make -C engine/hexenworld/client hw
  make -s -C engine/hexenworld/client localclean
  make -C engine/hexenworld/client glhw

  # HexenWorld master server
  make -C hw_utils/hwmaster

  # h2patch
  make -C h2patch

  # hcode compiler
  make -C utils/hcc

  # game-code
  utils/hcc/hcc -src ../gamecode-$_gamecodever/hc/h2 -os
  utils/hcc/hcc -src ../gamecode-$_gamecodever/hc/h2 -os -name progs2.src
  utils/hcc/hcc -src ../gamecode-$_gamecodever/hc/portals -os -oi -on
  utils/hcc/hcc -src ../gamecode-$_gamecodever/hc/hw -os -oi -on
  #utils/hcc/hcc -src ../gamecode-$_gamecodever/hc/siege -os -oi -on
}

package() {
  cd hexen2source-$pkgver

  install -d "$pkgdir"/opt/$pkgname

  # executables
  install -m755 engine/hexen2/{gl,}hexen2 engine/hexen2/server/h2ded \
    engine/hexenworld/client/{gl,}hwcl engine/hexenworld/server/hwsv \
    hw_utils/hwmaster/hwmaster "$pkgdir"/opt/$pkgname
  install -Dm755 h2patch/h2patch  "$pkgdir"/usr/bin/h2patch

  # run and cd-rip scripts
  install -m755 scripts/hexen2-run.sh scripts/cdrip_*.sh "$pkgdir"/opt/$pkgname

  # launchers
  for _b in glhexen2 hexen2 h2ded glhwcl hwcl hwsv; do
    ln -s /opt/$pkgname/hexen2-run.sh "$pkgdir"/usr/bin/$_b
  done

  # docs
  (cd docs
    install -d "$pkgdir"/opt/$pkgname/docs
    install -m644 -t "$pkgdir"/opt/$pkgname/docs ABOUT AUTHORS BUGS CHANGES* TODO Features \
      README README.music README.3dfx README.h* ReleaseNotes* SrcNotes.txt
  )

  cd ..

  # gamedata
  (cd gamecode-$_gamecodever
    install -d "$pkgdir"/opt/$pkgname/data1
    install -m644 hc/h2/*.dat res/h2/* "$pkgdir"/opt/$pkgname/data1
    install -d "$pkgdir"/opt/$pkgname/portals
    install -m644 hc/portals/*.dat res/portals/* "$pkgdir"/opt/$pkgname/portals
    install -d "$pkgdir"/opt/$pkgname/hw
    install -m644 hc/hw/*.dat res/hw/* "$srcdir"/hw/pak4.pak "$pkgdir"/opt/$pkgname/hw

    # ent fixes (handling map quirks)
    install -d "$pkgdir"/opt/$pkgname/{data1,portals}/maps
    install -m644 mapfixes/data1/maps/* "$pkgdir"/opt/$pkgname/data1/maps
    install -m644 mapfixes/portals/maps/* "$pkgdir"/opt/$pkgname/portals/maps

    # xdelta updates
    install -d "$pkgdir"/opt/$pkgname/patchdat/data1
    install -m644 patch111/patchdat/data1/* "$pkgdir"/opt/$pkgname/patchdat/data1
    install -m644 patch111/patchdat.txt "$pkgdir"/opt/$pkgname
  )

  # .desktop entry
  install -Dm644 hexen2source-$pkgver/engine/resource/hexen2.png "$pkgdir"/usr/share/pixmaps/hexen2.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
