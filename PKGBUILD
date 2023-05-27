# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=doom2df-editor-gtk2
pkgver=0.667
pkgrel=3
pkgdesc="Official map editor for Doom 2D: Forever, gtk2 version."
arch=(x86_64 i686)
url="https://doom2d.org/"
license=('GPL3')
group=(doom2df-full)
depends=(doom2df-res cairo gtk2 libjpeg-turbo libpng gdk-pixbuf2 libxcb libx11 libgl)
makedepends=(git fpc lazarus lazarus-gtk2)
optdepends=('doom2df-bin: for testing/playing')
provides=(doom2df-editor)
conflicts=(doom2df-editor-qt5 doom2df-editor-qt4)
source=(
  'git://repo.or.cz/d2df-editor.git'
  'doom2df-editor.desktop'
  'doom2df-editor.png'
  'Doom2DF_E'
)
md5sums=(
  'SKIP'
  '6e002827b10502fb00feab7d64a021f1'
  '1ad21e89200ff2bdcae68935b43f53fd'
  '8dfb08b8e31386b612156db8e61a0fde'
)
options=(
  !strip
)


prepare(){
  cd "${srcdir}/d2df-editor"
  
  BIN="$PWD/bin"
  TMP="$PWD/tmp"

  # Check directories bin and tmp and remove them for normal rebuilding
  if [ -d "$BIN" ]; then
    		rm -r bin
  else
    	echo "Here we go"
	fi;


  if [ -d "$TMP" ]; then
    		rm -r tmp
  else
    	echo "Here we go"
	fi;
	
  # Make these directories
  mkdir bin
  mkdir tmp
}


build() {

  # Before building the editor, make lang files
  cd "${srcdir}/d2df-editor/"
  	mkdir -p data/lang
  		# EN
  		msguniq lang/editor.en_US.po | msgfmt -o lang/editor.en_US.mo -
  			mv lang/editor.en_US.mo ../editor.en_US.mo
  		# RU
  		msguniq $PWD/lang/editor.ru_RU.po | msgfmt -o lang/editor.ru_RU.mo -
  			mv lang/editor.ru_RU.mo ../editor.ru_RU.mo

  # Export environment variable before building
  export D2DF_BUILD_HASH="$(git rev-parse HEAD)"
  
  cd "src/editor"
    lazbuild --bm=Debug Editor.lpi
  
  cd ../../bin
  cp editor ../../
  
}


package() {
  cd "${srcdir}"
  install -Dm755 editor "${pkgdir}"/usr/bin/editor
  install -Dm755 Doom2DF_E "${pkgdir}"/usr/bin/Doom2DF_E
  install -Dm644 doom2df-editor.desktop "${pkgdir}"/usr/share/applications/doom2df-editor.desktop
  install -Dm644 doom2df-editor.png "${pkgdir}"/usr/share/pixmaps/doom2df-editor.png
  install -Dm644 editor.en_US.mo "${pkgdir}"/usr/share/doom2df/data/lang/editor.en_US.mo
  install -Dm644 editor.ru_RU.mo "${pkgdir}"/usr/share/doom2df/data/lang/editor.ru_RU.mo
}
