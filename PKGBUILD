# Maintainer:  Ainola
# Contributor: rtfreedman

pkgname=csoundqt
pkgver=0.9.5
pkgrel=1
pkgdesc="A frontend for Csound featuring a highlighting editor with autocomplete, interactive widgets and integrated help"
arch=('i686' 'x86_64')
url="https://csoundqt.github.io/"
license=('GPL3') # or, at your option, LGPL2
depends=('csound' 'qt5-base' 'csound-doc' 'qt5-declarative')
makedepends=('shared-mime-info')
_rtmidi=rtmidi-2.1.0
source=("https://github.com/CsoundQt/CsoundQt/archive/$pkgver.tar.gz"
        "csoundqt.desktop"
        "http://www.music.mcgill.ca/~gary/rtmidi/release/${_rtmidi}.tar.gz"
        "csoundqt-mime.xml"
        "csoundqt-icons.tar.gz")
sha256sums=('adf9c48be719226ec553cc67019b191d1730f6643ee41ce2996cd3a88dd12eab'
            '6d08233ee50eec15bbcb59f1edcee56626264fb37590603bc88af4764e8dda9d'
            'a0a59226614b878e7c32890cb7c38a6fe48a97082baf4913297d4c3958a9b3ac'
            '2d78945761ff6f673ac93f7d879a691eb77466e73a40ef77e4a8f3c3c374d599'
            'd2a7319315e77cd5f694a0d861772ea09d0a10cdcbaa9e0c6751b3b72fca5982')

prepare() {
mv "$srcdir/CsoundQt-$pkgver/"* .
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
  qmake-qt5 qcs.pro CONFIG+=rtmidi "RTMIDI_DIR=${_rtmidi}"
  make
}

package() {
# tarball doesn't have a root dir, extracting to $srcdir
  install -d "$pkgdir"/usr/{bin,share/{applications,csoundqt,doc/csoundqt}}

  install -Dm755 bin/CsoundQt-d-cs6 "$pkgdir"/usr/bin/csoundqt
# desktop file and icons
  install -Dm644 "$srcdir"/csoundqt.desktop "$pkgdir"/usr/share/applications
  for size in 22 24 32 48 64 128 256 512; do
    install -Dm644 "${srcdir}/${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/csoundqt.png"
  done
# docs
  install -Dm644 doc/*.pdf  -t "$pkgdir"/usr/share/doc/csoundqt
  find examples -type f -print0 | xargs -0 -n1 -i{} install -Dm644 '{}' "$pkgdir"/usr/share/doc/csoundqt/'{}'
  cd src
  find Examples -type f -print0 | xargs -0 -n1 -i{} install -Dm644 '{}' "$pkgdir"/usr/share/csoundqt/'{}'
# pythonqt scripts: Install these if you want added python functionality
  #find Scripts -type f -print0 | xargs -0 -n1 -i{} install -Dm644 '{}' "$pkgdir"/usr/share/csoundqt/'{}'
  install -Dm644 "$srcdir"/csoundqt-mime.xml "$pkgdir"/usr/share/mime/packages/csoundqt.xml
}

# vim: set tabstop=2 shiftwidth=2 expandtab
