# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Marcin Skory <armitage at q84fh dot net>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Jacek Poplawski <jacekpoplawski__gmail>

pkgname=alephone
_pkgdate=20150620
pkgver=1.2.1_$_pkgdate
pkgrel=2
pkgdesc='A free, enhanced port of the classic FPS "Marathon 2" by Bungie Software'
arch=('i686' 'x86_64')
url="http://marathon.sourceforge.net/"
license=('GPL3')
depends=('sdl_ttf' 'sdl_image' 'sdl_net' 'smpeg' 'libmad' 'glu' 'zziplib'
         'ffmpeg' 'boost-libs' 'curl')
# todo: figure out, if they are all compatible
optdepends=('alephone-emr: community-made scenario'
            'alephone-eternalx: community-made scenario' # ok!
            'alephone-evil: community-made scenario' # ok!
            'alephone-infinity: original data for Marathon Infinity' # ok!
            'alephone-marathon: M1A1 data converted for AlephOne' # ok!
            'alephone-marathon2: original data for Marathon 2: Durandal' # ok!
            'alephone-red: community-made scenario'
            'alephone-rubiconx: community-made scenario'
            'alephone-tempus_irae: community-made scenario')
makedepends=('boost' 'mesa' 'icoutils')
source=("https://github.com/Aleph-One-Marathon/alephone/releases/download/release-$_pkgdate/AlephOne-$_pkgdate.tar.bz2"
        "$pkgname-update-old-ffmpeg-enums.patch")
sha256sums=('c0f360dfb74a6264f95d375103a74000930cf0439ffb0464f915f5379443e133'
            '2c83da1a751e677d8a980e27e3df684943f7b6b883aca5b047a11783232d4324')

prepare() {
  cd AlephOne-$_pkgdate

  # backported patch to make it compile correctly
  patch -Np1 < ../$pkgname-update-old-ffmpeg-enums.patch

  # lowercase for (folder) name
  sed "s|PACKAGE='AlephOne'|PACKAGE='alephone'|g" -i configure

  # convert the windows icons
  cd Resources/Windows
  icotool -x -w 48 alephone.ico -o ../alephone.png
  icotool -x -w 48 marathon.ico -o ../alephone-marathon.png
  icotool -x -w 48 marathon2.ico -o ../alephone-marathon2.png
  icotool -x -w 48 marathon-infinity.ico -o ../alephone-infinity.png
}

build() {
  cd AlephOne-$_pkgdate

  ./configure --prefix=/usr
  make
}

package() {
  cd AlephOne-$_pkgdate

  make DESTDIR="$pkgdir/" install

  # icons
  install -d "$pkgdir"/usr/share/icons
  install -m644 Resources/*.png "$pkgdir"/usr/share/icons

  # docs
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -m644 docs/*.html "$pkgdir"/usr/share/doc/$pkgname
}
