# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Marcin Skory <armitage at q84fh dot net>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Jacek Poplawski <jacekpoplawski__gmail>

pkgname=alephone
_pkgdate=20140104
pkgver=1.1_$_pkgdate
pkgrel=1
pkgdesc='A free, enhanced port of the classic FPS "Marathon 2" by Bungie Software'
arch=('i686' 'x86_64')
url="http://marathon.sourceforge.net/"
license=('GPL3')
depends=('sdl_ttf' 'sdl_image' 'sdl_net' 'libmad' 'glu' 'mesa' 'zziplib'
         'ffmpeg' 'ffmpeg-compat')
# todo: figure out, if they are all compatible
optdepends=('alephone-emr: community-made scenario'
            'alephone-eternalx: community-made scenario'
            'alephone-evil: community-made scenario'
            'alephone-infinity: original data for Marathon Infinity'
            'alephone-marathon: M1A1 data converted for AlephOne'
            'alephone-marathon2: original data for Marathon 2: Durandal'
            'alephone-red: community-made scenario'
            'alephone-rubiconx: community-made scenario'
            'alephone-tempus_irae: community-made scenario')
makedepends=('boost' 'lua')
source=("http://downloads.sourceforge.net/marathon/AlephOne-$_pkgdate.tar.bz2"
        "http://downloads.sourceforge.net/marathon/README.md"
        "$pkgname-remove-deprecated-r5002.diff"
        "$pkgname-ffmpeg-add-magic-number.diff")
sha256sums=('7f7d35c1d99cddd7cd0b47d3e4b84311373b04c60402ce86e9d85c36dfbaabcd'
            'b2b01a3120b61e56cecb6409585118a5e907171fef0e4dc25afaf13fcea5c5d5'
            'b06a57cffbf5ae3df916de1baa457e53c78a7ed5af22e7e330da3fc405602351'
            'cd0f169ea4a79d4b782ee0c03c35b254d947b8fc6af88cc5563d71f864b891f8')

prepare() {
  cd AlephOne-$_pkgdate

  # add removed ffmpeg define
  patch -Np1 < ../$pkgname-ffmpeg-add-magic-number.diff
  # remove old setting
  patch -Np1 < ../$pkgname-remove-deprecated-r5002.diff

  # this is a leftover from old version (needed?)
  #sed "s|PACKAGE='AlephOne'|PACKAGE='alephone'|g" -i configure
}

build() {
  cd AlephOne-$_pkgdate

  ./configure --prefix=/usr
  make
}

package() {
  cd AlephOne-$_pkgdate

  make DESTDIR="$pkgdir/" install
  # docs
  install -Dm644 ../README.md "$pkgdir"/usr/share/doc/$pkgname/README-1.1.md
  install -m644 README docs/*.html "$pkgdir"/usr/share/doc/$pkgname
}
