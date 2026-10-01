# Maintainer: Hildigerr Vergaray <Maintainer at YmirSystems dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributors: Marcin Skory, Arkham, Christoph Zeiler, Jacek Poplawski, carstene1ns

pkgname=alephone
_pkgdateXXX=20260930
_pkgdate=20250930 #Asset Name Issue #583
pkgver=1.11.1_$_pkgdateXXX
pkgrel=3
pkgdesc='A free, enhanced port of the classic FPS "Marathon 2" by Bungie Software'
arch=('i686' 'x86_64')
url="https://alephone.lhowon.org/"
license=('GPL3')
depends=('boost-libs' 'sdl2_image' 'sdl2_ttf' 'openal' 'libsndfile' 'glu')
optdepends=(
  'curl: for stats upload to lhowon.org'
  'miniupnpc: for opening router ports'
  'zziplib: for using zipped plugins'
  'libvpx: for film export'
  'libmatroska: for film export'
  'libebml: for film export'
  'libvorbis: for film export'
  'libyuv: for film export and video playback'
  'alephone-eternalx: community-made scenario'
  'alephone-evil: community-made scenario'
  'alephone-infinity: original data for Marathon Infinity'
  'alephone-marathon: M1A1 data converted for AlephOne'
  'alephone-marathon2: original data for Marathon 2: Durandal')
makedepends=(
  'asio' 'boost' 'mesa'
  'curl' 'miniupnpc' 'zziplib'
  'libvpx' 'libmatroska' 'libebml' 'libvorbis' 'libyuv'
  'icoutils')
source=("https://github.com/Aleph-One-Marathon/alephone/releases/download/release-$_pkgdateXXX/AlephOne-$_pkgdate.tar.bz2")
sha256sums=('e68d55ac592ccf0634ad840345dabeae41aab498cc98fba26df564db7233656d')

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

  export CXXFLAGS="$CXXFLAGS -fsanitize=undefined" #Issue#518
  ./configure --prefix=/usr
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
