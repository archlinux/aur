# Maintainer: Frantic1048 <archer@frantic1048.com>

pkgname=kreogist-mu
pkgver='0.9.9.2'
pkgrel=2
epoch=1
pkgdesc="Fantastic cross-platform music manager.based on Qt5"
arch=('x86_64')
url="https://kreogist.github.io/Mu/"
license=('GPL')
changelog="$pkgname.changelog"
install="$pkgname.install"
depends=(
  'pulseaudio'
  'ffmpeg'
  'phonon-qt5'
  'gst-libav'
  'gstreamer0.10-ffmpeg'
  'desktop-file-utils'
  'hicolor-icon-theme'
)

optdepends=(
  'gst-plugins-good: good plugin libraries'
  'gst-plugins-bad: bad plugin libraries'
  'gst-plugins-ugly: ugly plugin libraries'
)

makedepends=(
  'git'
  'gcc'
  'qt5-tools'
)

source=(
  "https://github.com/Kreogist/mu-archlinux/releases/download/$pkgver.$pkgrel/$pkgname-resource.tar.gz"
  "https://codeload.github.com/Kreogist/Mu/tar.gz/$pkgver"
)

sha224sums=('2877b0096d3359733e070ab41ebeaad63d1cc10c67f0e4ba1c18b717' 'f69b65d11c06de016b2f058292f8d196b2cf93e01d5d1b12060d2ed0')

build() {
  mkdir -p $srcdir/Mu-build
  cd $srcdir/Mu-build
  qmake "CONFIG+=release" $srcdir/Mu-$pkgver/mu.pro
  make
}

package() {
  # excecutable
  mv $srcdir/Mu-build/bin/mu $srcdir/Mu-build/bin/kreogist-mu
  install -d $pkgdir/usr/bin/
  install -m775 $srcdir/Mu-build/bin/kreogist-mu $pkgdir/usr/bin/

  # i18n files
  # https://github.com/Kreogist/Mu/issues/17#issuecomment-164236195
  install -d $pkgdir/usr/share/Kreogist/mu/Language/
  for f in $srcdir/Mu-build/bin/*.qm
  do
    baseName=$(basename $f)
    languageName="${baseName%.qm}"
    install -d $pkgdir/usr/share/Kreogist/mu/Language/$languageName/
    install -m664 $f $pkgdir/usr/share/Kreogist/mu/Language/$languageName/
  done

  # static resource
  install -d $pkgdir/usr/share/icons/hicolor/512x512/apps/
  install -m664 $srcdir/$pkgname-resource/$pkgname.png $pkgdir/usr/share/icons/hicolor/512x512/apps/
  install -d $pkgdir/usr/share/applications/
  install -m664 $srcdir/$pkgname-resource/$pkgname.desktop $pkgdir/usr/share/applications/
}
