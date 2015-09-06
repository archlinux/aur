# Maintainer:  Ainola
# Contributor: rtfreedman

pkgname=csoundqt
pkgver=0.9.0
pkgrel=3
pkgdesc="A frontend for Csound featuring a highlighting editor with autocomplete, interactive widgets and integrated help"
arch=('i686' 'x86_64')
url="http://qutecsound.sourceforge.net/"
license=('GPL3') # or, at your option, LGPL2
depends=('csound' 'qt4' 'csound-doc')
install="csoundqt.install"
_rtmidi=rtmidi-2.1.0
source=("http://sourceforge.net/projects/qutecsound/files/CsoundQt/${pkgver}/csoundqt-${pkgver}-src.tar.gz" 
        "csoundqt.desktop"
        "http://www.music.mcgill.ca/~gary/rtmidi/release/${_rtmidi}.tar.gz")
sha256sums=('873c699091e28064bc25f45a1081d583b42c4927061174f76cd8231ef1394feb'
            '4cc7e3d77ce4daf558568f2633645658f565f71c5e6c9f441fd2ade5dd61b138'
            'a0a59226614b878e7c32890cb7c38a6fe48a97082baf4913297d4c3958a9b3ac')

prepare() {
# tarball doesn't have a root dir, extracting to $srcdir
# DEFAULT_HTML_DIR "/usr/share/doc/csound-doc/html"
  sed -e 's@"csdocdir", ""@"csdocdir", DEFAULT_HTML_DIR@' \
      -e 's@/usr/share/qutecsound/Examples/@/usr/share/csoundqt/Examples/@g' -i src/qutecsound.cpp
  sed 's@../../csoundqt/src/Scripts@/usr/share/csoundqt/Scripts@' -i src/types.h
}

build() {
# Now uses RtMidi, see: http://qutecsound.sourceforge.net/pages/develop.html
# For csound midi module, remove CONFIG+=rtmidi "RTMIDI_DIR=${_rtmidi}".
# For PythonQt add CONFIG+=pythonqt.
  qmake-qt4 qcs.pro CONFIG+=rtmidi "RTMIDI_DIR=${_rtmidi}"
  make
}

package() {
# tarball doesn't have a root dir, extracting to $srcdir
  install -d "$pkgdir"/usr/{bin,share/{applications,csoundqt,doc/csoundqt}}

  install -Dm755 bin/CsoundQt-d-cs6 "$pkgdir"/usr/bin/csoundqt
# desktop file and icon
  install -Dm644 "$srcdir"/csoundqt.desktop "$pkgdir"/usr/share/applications
  install -Dm644 images/qtcs.png "$pkgdir"/usr/share/pixmaps/csoundqt.png
  install -Dm644 images/* -t "$pkgdir"/usr/share/csoundqt/images
# docs
  install -Dm644 doc/*.pdf  -t "$pkgdir"/usr/share/doc/csoundqt  
  find examples -type f -print0 | xargs -0 -n1 -i{} install -Dm644 '{}' "$pkgdir"/usr/share/doc/csoundqt/'{}'
  cd src
  find Examples -type f -print0 | xargs -0 -n1 -i{} install -Dm644 '{}' "$pkgdir"/usr/share/csoundqt/'{}'
# pythonqt scripts: Install these if you want added python functionality
  #find Scripts -type f -print0 | xargs -0 -n1 -i{} install -Dm644 '{}' "$pkgdir"/usr/share/csoundqt/'{}'
}

# vim: set tabstop=2 shiftwidth=2 expandtab
