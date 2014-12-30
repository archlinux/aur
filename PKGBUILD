# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Marcin Skory <armitage at q84fh dot net>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Jacek Poplawski <jacekpoplawski__gmail>

pkgname=alephone
_pkgdate=20140104
pkgver=1.1_$_pkgdate
pkgrel=3
pkgdesc='A free, enhanced port of the classic FPS "Marathon 2" by Bungie Software'
arch=('i686' 'x86_64')
url="http://marathon.sourceforge.net/"
license=('GPL3')
depends=('sdl_ttf' 'sdl_image' 'sdl_net' 'libmad' 'glu' 'mesa' 'zziplib'
         'ffmpeg')
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
makedepends=('boost' 'lua' 'icoutils')
source=("http://downloads.sourceforge.net/marathon/AlephOne-$_pkgdate.tar.bz2"
        "http://downloads.sourceforge.net/marathon/README.md"
        "$pkgname-r5002-remove-deprecated-ffmpeg-quality-setting.diff"
        "$pkgname-r5009-support-newer-ffmpeg.diff"
        "$pkgname-r5011-use-mkstemp.diff"
        "$pkgname-r5012-include-iostream.diff")
sha256sums=('7f7d35c1d99cddd7cd0b47d3e4b84311373b04c60402ce86e9d85c36dfbaabcd'
            'b2b01a3120b61e56cecb6409585118a5e907171fef0e4dc25afaf13fcea5c5d5'
            'd792f675ad0a92f415f43f1cd15dd828520b1728b5d9b6129933a2abf72df43f'
            '40117efbd082d0b81b7ca0880bfaa313bd64061d80e29f1660eba6ce3c8b2eba'
            '44b8426b1d0260d152864eb473915a206554569833fe3bea5746285a8d7689d0'
            'd1d82464dd97621dfcec234e36d8b5d54c6251b5a792959e9ad8e28bf4bc3dc6')

prepare() {
  cd AlephOne-$_pkgdate

  # backport some patches to make it compile correctly
  patch -Np0 < ../$pkgname-r5002-remove-deprecated-ffmpeg-quality-setting.diff
  patch -Np0 < ../$pkgname-r5009-support-newer-ffmpeg.diff
  patch -Np0 < ../$pkgname-r5011-use-mkstemp.diff
  patch -Np0 < ../$pkgname-r5012-include-iostream.diff

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
  install -Dm644 ../README.md "$pkgdir"/usr/share/doc/$pkgname/README-1.1.md
  install -m644 README docs/*.html "$pkgdir"/usr/share/doc/$pkgname
}
