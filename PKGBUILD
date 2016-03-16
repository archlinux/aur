# Maintainer: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>

pkgname=lastfm
pkgver=2.1.36
pkgrel=1
pkgdesc="The official Last.fm desktop application suite"
arch=('any')
url="http://www.last.fm/"
license=('GPL3')
depends=('qt4>4.8' 'ruby' 'liblastfm' 'pkg-config' 'fftw' 'taglib' 'libsamplerate' 'libmad' 'libgpod' 'sqlite' 'phonon' 'phonon-qt4-vlc' 'ffmpeg' 'qtwebkit')
makedepends=()
source=(Last.fm-$pkgver.tar.zip::https://github.com/lastfm/lastfm-desktop/archive/$pkgver.zip
    lastfm-scrobbler
    LAV_Source_fix.patch
    lastfm-scrobbler.desktop
    cast-bug.patch)
conflicts=(lastfm-git
    lastfm-mpd-cli
    lastfm-msk
    lastfm-msk-light)

provides=(lastfm)

#install=$pkgname.install

build() {
  cd $srcdir/lastfm-desktop-$pkgver/app
  patch -Np1 -i ../../LAV_Source_fix.patch
  cd $srcdir/lastfm-desktop-$pkgver
  patch -Np1 -i ../cast-bug.patch
  qmake-qt4 -r
  make

}

package() {
  cd "$srcdir/lastfm-desktop-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/opt/last.fm/css
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  cp -R _bin $pkgdir/opt/last.fm/bin
  cp "app/client/Last.fm Scrobbler.css" $pkgdir/opt/last.fm/css
  install -m755 $srcdir/lastfm-scrobbler $pkgdir/usr/bin/lastfm-scrobbler
  install -D -m644 "${srcdir}/lastfm-scrobbler.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m644 "${srcdir}/lastfm-desktop-$pkgver/app/client/audioscrobbler.ico" "${pkgdir}/usr/share/pixmaps/audioscrobbler.ico"
}
md5sums=('c5a29ccdc29f1191b561b3964149e52f'
         '094d0d092d0244609c0211682479cd03'
         '373cd6b862c13b459ff34b4dcd42daca'
         'fa62e46c1085e8893545e81e063a6a61'
         '1571a79e34558688f25e17f069b070c2')
