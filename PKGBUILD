# Maintainer: Your Name <abrahammurciano at gmail dot com>
_pkgname="agena"
pkgname="$_pkgname-bin"
pkgver="2.22.0"
pkgrel=14
pkgdesc="An easy-to-learn procedural programming language designed to be used in science, scripting, and many other applications."
arch=('x86_64')
url="http://$_pkgname.sourceforge.net/"
license=('GPL')
groups=()
depends=("lib32-readline" "lib32-ncurses" "lib32-libxext")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://master.dl.sourceforge.net/project/agena/Binaries/Agena%20$pkgver/$_pkgname-$pkgver-linux.i386.deb")
noextract=("$_pkgname-$pkgver-linux.i386.deb")
md5sums=('e745338351c2b36f95fb2f0dd0aa61d8')
validpgpkeys=()

prepare() {
	# extract data.tar.xz from the .deb file
	ar p $_pkgname-$pkgver-linux.i386.deb data.tar.xz | tar x -J
}

package() {
	# move extracted files to pkgdir
	mv $srcdir/usr $pkgdir/usr

	# make links to required libraries
	mkdir $pkgdir/usr/lib32
	ln -s /usr/lib32/libreadline.so.8.0 $pkgdir/usr/lib32/libreadline.so.7
	ln -s /usr/lib32/libreadline.so.8.0 $pkgdir/usr/lib32/libreadline.so.6
	ln -s /usr/lib32/libhistory.so.8.0 $pkgdir/usr/lib32/libhistory.so.7
	ln -s /usr/lib32/libncursesw.so $pkgdir/usr/lib32/libncurses.so.5
	ln -s /usr/lib32/libncursesw.so $pkgdir/usr/lib32/libtinfo.so.5
	cp $pkgdir/usr/local/lib/libagena.so $pkgdir/usr/lib32/libagena.so

	# generate desktop file for agenaedit
	mkdir $pkgdir/usr/share
	mkdir $pkgdir/usr/share/applications
	mkdir $pkgdir/usr/share/pixmaps
	desktop=$pkgdir/usr/share/applications/AgenaEdit.desktop
	cp $pkgdir/usr/agena/share/icons/agena.png $pkgdir/usr/share/pixmaps/agena.png
	echo "[Desktop Entry]" >> $desktop
	echo "Type=Application" >> $desktop
	echo "Version=$pkgver" >> $desktop
	echo "Name=AgenaEdit" >> $desktop
	echo "Comment=Agena editor featuring syntax-highlighting and an integrated environment" >> $desktop
	echo "Path=/usr/local/bin" >> $desktop
	echo "Exec=agenaedit" >> $desktop
	echo "Icon=/usr/share/pixmaps/agena.png" >> $desktop
	echo "Terminal=false" >> $desktop
	echo "Categories=Education;Languages;Agena;IDE" >> $desktop
}
