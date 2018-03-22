# Maintainer: Ruslan Almazov <snql dot by at gmail dot com>
# Based on smplayer-svn package

pkgname=smplayer-svn-notitlebar
pkgver=18.3.0.r8959M
pkgrel=1
pkgdesc="Advanced front-end for MPlayer/MPV + Patch to disable titlebar in compact mode"
arch=('i686' 'x86_64')
url="http://smplayer.sourceforge.net/"
license=('GPL')
depends=('qt5-script' 'libxkbcommon-x11' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'subversion')
optdepends=('smplayer-themes-svn: icon themes collection'
            'smplayer-skins-svn: skin themes collection'
            'smtube-svn: browse and play YouTube videos'
            'youtube-dl: play streaming videos'
            'mplayer: backend for video playback'
            'mpv: alternative modern backend, based on MPlayer/MPlayer2')
provides=('smplayer')
conflicts=('smplayer')
source=(
  "$pkgname::svn+https://subversion.assembla.com/svn/smplayer/smplayer/trunk/"
  "hidetitlebar.patch"
)
sha256sums=(
  'SKIP'
  '3f1be6b18805af4f8a2f1958aa8ce45b7053b476f6c6d5d27e60fa6822edab40'
)

prepare() {
    cd $srcdir/$pkgname
    patch -p0 -i "$srcdir/hidetitlebar.patch"
}

pkgver() {
  cd $pkgname
  echo $(grep -m1 'Version' smplayer.spec | cut -d " " -f9).r$(svnversion)
}

build() {
  cd $pkgname
  make clean
  make PREFIX=/usr DOC_PATH='\"/usr/share/doc/smplayer\"'
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr DOC_PATH=/usr/share/doc/smplayer install
}
