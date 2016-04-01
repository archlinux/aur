# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: Leonardo Miliani <leonardo@leonardomiliani.com>

pkgname=jag
pkgver=0.3.2
pkgrel=3
pkgdesc="A free arcade-puzzle 2D game in which you have to break all the target pieces"
arch=('i686' 'x86_64')
url="http://jag.xlabsoft.com/"
depends=('qt4' 'sdl_mixer')
#optdepends=('jag-themes: for additional graphic themes')
license=('GPL3')
source=(http://jag.xlabsoft.com/files/$pkgname-$pkgver-src.zip 
        http://jag.xlabsoft.com/files/$pkgname-$pkgver-data.zip
	'jag.desktop' 'jag.png'
	'jag-level-editor.desktop' 'jag-leveleditor.png'
	'jag-0.3.2-dirs.patch')

md5sums=('ed4313f2cf57cfc130700e8d91365faa'
         '21a1a36f348f866a0a43cb1a8adf4e2f'
         '89494a96f138793852744484a05f62d2'
         '75bad1a145baa8a9b3fb79b65c959ae6'
         '60a2470557e66eed3317d93cf47f4fdd'
         '6a733b853844f834efcd182a9182aba6'
         '5dce2d642a61b1788670be12dd7363c7')

build() {
    mv $pkgname-$pkgver-data/data $pkgname-$pkgver-src
    cd $pkgname-$pkgver-src
    patch -Np1 -i ../jag-0.3.2-dirs.patch 
    ## building game
	qmake-qt4 
	make 
	
    ## building level editor  
	cd editor
	qmake-qt4 
	make 
}
package() {
    ## installing game
    cd $pkgname-$pkgver-src
	make INSTALL_ROOT=${pkgdir} install 
	install -D -m644 ../jag.png ${pkgdir}/usr/share/pixmaps/jag.png 
	install -D -m644 ../jag.desktop ${pkgdir}/usr/share/applications/jag.desktop     	
    
    ## installing level editor
    cd editor
	make INSTALL_ROOT=${pkgdir} install 
	install -D -m644 ${srcdir}/jag-leveleditor.png  ${pkgdir}/usr/share/pixmaps/jag-leveleditor.png 
	install -D -m644 ${srcdir}/jag-level-editor.desktop ${pkgdir}/usr/share/applications/jag-level-editor.desktop     	
    ## fixing permissions 
    find ${pkgdir}/usr/share -type d -execdir chmod o+rx {} \; 
    find ${pkgdir}/usr/share -type f -execdir chmod o+r {} \; 
}
