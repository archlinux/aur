# Maintainer: willemw <willemw12@gmail.com>
# Contributor: rtfreedman  <rob<d0t>til<d0t>freedman< T>googlemail<d0t>com>

pkgname=exmplayer-git
pkgver=5.0.1.r17.gaecf78a
pkgrel=1
pkgdesc="MPlayer GUI front-end. Plays any media file. Video downloader, subtitle search, audio converter/extractor, media cutter, Gif animation generator"
arch=('x86_64')
url="http://exmplayer.sourceforge.net/"
license=('GPL')
depends=('ffmpeg' 'mplayer' 'qt5-base')
optdepends=('youtube-dl: download video/audio')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+https://github.com/rupeshs/ExMplayer.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname/src
  qmake-qt5
  make 
}

package() {
  cd $pkgname

  install -Dm644 debian/exmplayer.png "$pkgdir/usr/share/pixmaps/exmplayer.png"

  install -Dm644 exmplayer.desktop "$pkgdir/usr/share/applications/exmplayer.desktop"
  install -Dm644 exmplayer_enqueue.desktop "$pkgdir/usr/share/applications/exmplayer_enqueue.desktop"

  install -Dm644 linux_build/fmts "$pkgdir/etc/exmplayer/fmts"
  install -Dm644 linux_build/sc_default.xml "$pkgdir/etc/exmplayer/sc_default.xml"

  install -Dm755 src/exmplayer "$pkgdir/usr/bin/exmplayer"

  # Use installed ffmpeg 
  install -dm755 "$pkgdir/usr/share/exmplayer"
  ln -s /usr/bin/ffmpeg "$pkgdir/usr/share/exmplayer/ffmpeg"
  #
  # Or use bundled ffmpeg
  #install -Dm755 linux_build/ffmpeg "$pkgdir/usr/share/exmplayer"
}

