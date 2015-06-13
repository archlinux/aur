# Maintainer: McLenin <mclenin at gooogles email>
pkgname=imview
pkgver=1.1.9h
pkgrel=2
pkgdesc="View and analyze scientific images"
arch=(any)
url="http://hugues.zahlt.info/software_imview.html"
license=('GPL2')
groups=()
depends=('libjpeg' 'libtiff' 'libpng12' 'fltk' 'imagemagick')
source=(http://hugues.zahlt.info/assets/logiciel/imview-current.tar.bz2
	imview.desktop 
	imview.xpm)
noextract=()
md5sums=(
"b8039b290e15668dca4ee8eb93c0ecf8"
"9aa1896313c7826b2a598b125e8e5efb"
"4a2773a692cc209b3f7b2eaa9c1ae6d7") 

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's:--ldstaticflags:--ldflags:' configure
  ./configure --prefix=/usr
  
    sed -i 's:<Fl/:<FL/:' view3d.hxx
	sed -i 's:lpng:lpng12:' Makefile
	sed -i 's:lpng:lpng12:' io/Makefile
	sed -i 's:<png.h>:<libpng12/png.h>:' io/readpng.cxx
	sed -i 's:setg:this->setg:' server/socketstream.hxx 
	sed -i 's:setp:this->setp:' server/socketstream.hxx 
	sed -i 's:sputc:this->sputc:' server/socketstream.hxx
	sed -i 's:nbcopies_cb(Fl_Input :nbcopies_cb(Fl_Int_Input :' printSpect.cxx
	sed -i 's:nbcopies_cb(Fl_Input :nbcopies_cb(Fl_Int_Input :' printPrefs.cxx
	sed -i '45 a\#include<FL/Fl_Int_Input.H>' printPrefs.cxx 
	sed -i '45 a\#include<FL/Fl_Int_Input.H>' printSpect.cxx 
	sed -i 's:b->id:b:' my_Image.cxx
	sed -i 's:(void \*):(Fl_RGB_Image *):' my_Image.cxx
	sed -i 's:(unsigned):(Fl_RGB_Image *):' my_Image.cxx
  
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

 cd "$srcdir"
 
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${pkgname}.xpm  ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm
  
}