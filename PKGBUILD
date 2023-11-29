# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributors: Marcin Skory, Arkham, Christoph Zeiler, Jacek Poplawski, carstene1ns

pkgname=alephone
_pkgdate=20231125
pkgver=1.7_$_pkgdate
pkgrel=1
pkgdesc='A free, enhanced port of the classic FPS "Marathon 2" by Bungie Software'
arch=('i686' 'x86_64')
url="https://alephone.lhowon.org/"
license=('GPL3')
depends=('sdl2_ttf' 'sdl2_image' 'sdl2_net' 'libmad' 'glu' 'zziplib'
         'ffmpeg4.4' 'boost-libs' 'curl')
optdepends=('alephone-eternalx: community-made scenario'
            'alephone-evil: community-made scenario'
            'alephone-infinity: original data for Marathon Infinity'
            'alephone-marathon: M1A1 data converted for AlephOne'
            'alephone-marathon2: original data for Marathon 2: Durandal')
makedepends=('boost' 'mesa' 'icoutils')
source=("https://github.com/Aleph-One-Marathon/alephone/releases/download/release-$_pkgdate/AlephOne-$_pkgdate.tar.bz2")
sha256sums=('a911e6b64ccf8ba3ca780ce830f7526dba228a51be2f67c25ef5d7bb7bc8721b')

prepare() {
  cd AlephOne-$_pkgdate

  # convert the windows icons
  cd Resources/Windows
  icotool -x -w 48 alephone.ico -o "$srcdir"/alephone.png
  icotool -x -w 48 marathon.ico -o "$srcdir"/alephone-marathon.png
  icotool -x -w 48 marathon2.ico -o "$srcdir"/alephone-marathon2.png
  icotool -x -w 48 marathon-infinity.ico -o "$srcdir"/alephone-infinity.png
}

build() {
  cd AlephOne-$_pkgdate

  PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig" ./configure --prefix=/usr
  make
}

package() {
  cd AlephOne-$_pkgdate

  make DESTDIR="$pkgdir/" install

  # icons
  install -d "$pkgdir"/usr/share/icons
  install -m644 "$srcdir"/*.png "$pkgdir"/usr/share/icons

  # docs
  #install -Dm644 README.txt "$pkgdir"/usr/share/doc/alephone/README
  #install -m644 docs/*.html "$pkgdir"/usr/share/doc/alephone
}
