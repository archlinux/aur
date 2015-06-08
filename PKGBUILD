# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com

pkgname=csoundqt
pkgver=0.9.0
pkgrel=2
pkgdesc="CsoundQt (formerly qutecsound) is a frontend for Csound featuring a highlighting editor with autocomplete, interactive widgets and integrated help"
arch=('i686' 'x86_64')
url="http://qutecsound.sourceforge.net/"
license=('GPLv3') # GPLv3 or at your option LGPLv2
depends=('csound' 'qt4' )
optdepends=('csound-doc: html online manual, opcode lookups and more' )
#optdepends+=('pythonqt: use of example scripts')
provides=('qutecsound')
conflicts=('qutecsound')
install="csoundqt.install"
#
# now uses RtMidi, see: http://qutecsound.sourceforge.net/pages/develop.html
#
_rtmidi=rtmidi-2.1.0
source=("http://sourceforge.net/projects/qutecsound/files/CsoundQt/${pkgver}/csoundqt-${pkgver}-src.tar.gz" 
		csoundqt.desktop 
		"http://www.music.mcgill.ca/~gary/rtmidi/release/${_rtmidi}.tar.gz"
		)
md5sums=('1c3001e44c95d325720641f5eb7f9d3a'
         'a352bbc3e071bfc1e4c5d17ffa4827a2'
         'ea4acc28724bc21fb08b6ad5efbc5c36')

prepare() {
# tarball doesn't have a root dir, extracting to $srcdir
# DEFAULT_HTML_DIR "/usr/share/doc/csound-doc/html"
  sed -e 's@"csdocdir", ""@"csdocdir", DEFAULT_HTML_DIR@' \
      -e 's@/usr/share/qutecsound/Examples/@/usr/share/csoundqt/Examples/@g' -i src/qutecsound.cpp
  sed 's@../../csoundqt/src/Scripts@/usr/share/csoundqt/Scripts@' -i src/types.h
}


build() {
# for csound midi module, remove CONFIG+=rtmidi "RTMIDI_DIR=${_rtmidi}"
# for PythonQt add CONFIG+=pythonqt
  qmake-qt4 qcs.pro CONFIG+=rtmidi "RTMIDI_DIR=${_rtmidi}" 
  make
}

package() {
# tarball doesn't have a root dir, extracting to $srcdir
  install -d "$pkgdir"/usr/{bin,share/{applications,csoundqt,doc/csoundqt}}

  install -Dm755 bin/CsoundQt-d-cs6 "$pkgdir"/usr/bin/csoundqt
# desktop file and icon
  install -Dm644 "$srcdir"/csoundqt.desktop "$pkgdir"/usr/share/applications
  #install -Dm644 images/qtcs.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/csoundqt.png
  install -Dm644 images/qtcs.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/csoundqt.svg
  install -Dm644 images/qtcs.png "$pkgdir"/usr/share/pixmaps/csoundqt.png
  install -Dm644 images/* -t "$pkgdir"/usr/share/csoundqt/images
# docs
  install -Dm644 doc/*.pdf  -t "$pkgdir"/usr/share/doc/csoundqt  
  find examples -type f -print0 | xargs -0 -n1 -i{} install -Dm644 '{}' "$pkgdir"/usr/share/doc/csoundqt/'{}'
  cd src
  find Examples -type f -print0 | xargs -0 -n1 -i{} install -Dm644 '{}' "$pkgdir"/usr/share/csoundqt/'{}'
# pythonqt scripts
  #find Scripts -type f -print0 | xargs -0 -n1 -i{} install -Dm644 '{}' "$pkgdir"/usr/share/csoundqt/'{}'
}
