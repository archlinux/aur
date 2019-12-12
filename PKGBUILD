#Maintainer: oshaboy <noamgilor{at}protonmail{dot}com>

pkgname=lowres-nx-git
pkgver=1.0
pkgrel=1
pkgdesc="Fantasy Game Console and Basic Interpreter"
arch=('x86_64' 'i686')
url="https://github.com/timoinutilis/lowres-nx"
license=('LGPLv3')
depends=(sdl2 glibc)
optdepends=()
makedepends=(gcc git make sed)
source=("git+git://github.com/timoinutilis/lowres-nx.git")
sha256sums=('SKIP')

desktop_entry='[Desktop Entry]\nType=Link\nIcon=/usr/share/pixmaps/lowres-nx/lowres-nx.ico\nName=LowRes NX\nExec=/usr/bin/lowres-nx\nTerminal=false\nHidden=false\nCategories=Game\nComment=Fantasy Computer and Basic Interpreter'
build() {
	cd lowres-nx/platform/LowRes\ NX\ Linux/
	# For some reason gcc on arch doesn't quite work properly. This should patch it up
	sed '4 c CC_FLAGS_MAIN =  -D __LINUX__ -lSDL2main -lSDL2 -lm' makefile >| makefile-arch
	make -f makefile-arch
	echo -e ${desktop_entry} >| ${srcdir}/LowRes\ NX.desktop
}
package(){
	mkdir ${pkgdir}/opt ${pkgdir}/opt/lowres-nx 
	install -Dm755 ${srcdir}/lowres-nx/platform/LowRes\ NX\ Linux/output/LowResNX ${pkgdir}/usr/bin/lowres-nx
	
	#put included programs in opt
	cp -r ${srcdir}/lowres-nx/programs ${pkgdir}/opt/lowres-nx/
	
	#Give included programs their own launchers. 
	echo "/usr/bin/lowres-nx /opt/lowresnx/programs/LowRes\ Galaxy\ 2\ \(1.5\).nx" >| ${pkgdir}/usr/bin/lowres-nx-lowres-galaxy
	echo "/usr/bin/lowres-nx /opt/lowresnx/programs/LowRes\ Adventure\ 1.1.nx" >| ${pkgdir}/usr/bin/lowres-nx-lowres-adventure
	echo "/usr/bin/lowres-nx /opt/lowresnx/programs/BG\ Designer\ 1.7.nx" >| ${pkgdir}/usr/bin/lowres-nx-bg-designer    
	echo "/usr/bin/lowres-nx /opt/lowresnx/programs/Char\ Designer\ 1.6.nx" >| ${pkgdir}/usr/bin/lowres-nx-char-designer
	echo "/usr/bin/lowres-nx /opt/lowresnx/programs/Sound\ Composer\ 1.4.nx" >| ${pkgdir}/usr/bin/lowres-nx-sound-composer
	echo "/usr/bin/lowres-nx /opt/lowresnx/programs/Star\ Scroller\ 1.2.nx" >| ${pkgdir}/usr/bin/lowres-nx-star-scroller
	chmod -R 755 ${pkgdir}/usr/bin/
	
	install -Dm644 ${srcdir}/lowres-nx/platform/LowRes\ NX\ Win/LowRes\ NX\ Win/icon1.ico ${pkgdir}/usr/share/pixmaps/lowres-nx/lowres-nx.ico
	install -Dm755 ${srcdir}/LowRes\ NX.desktop ${pkgdir}/usr/share/applications/LowRes\ NX.desktop
	
	
}
