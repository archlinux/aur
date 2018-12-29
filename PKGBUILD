# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: push2001sla@gmail.com
# Developer: andrewcrew@rambler.ru

pkgname=xneur-devel-git
pkgver=0.20.0
pkgrel=12
epoch=
pkgdesc="X Neural Switcher detects the input language and corrects keyboard layout. Git version"
arch=('any')
url="https://github.com/AndrewCrewKuznetsov/xneur-devel"
license=('GPL')
groups=()
depends=('enchant' 'gtk2' 'libnotify' 'gstreamer>=1.14.4')
makedepends=('git')
checkdepends=()
optdepends=('hunspell-YOUR-LANGUAGE' 'xosd')
provides=('xneur')
conflicts=('xneur')
replaces=('xneur')
backup=()
options=()
install=
changelog=
source=("git+http://github.com/AndrewCrewKuznetsov/xneur-devel.git")
noextract=()
md5sums=('SKIP')

validpgpkeys=()

#prepare() {
#	#rm -rf "$pkgname-$pkgver"
	#git clone https://github.com/AndrewCrewKuznetsov/xneur-devel "$pkgname-$pkgver" || echo
#}

build() {
	echo "New versions of enchant stores as /usr/include/enchant-2"
	echo "So I must symlink it to /usr/include/enchant: "
	sudo ln -s /usr/include/enchant-2 /usr/include/enchant &>/dev/null || echo

	cd "$srcdir/xneur-devel/xneur"
	# If you have xosd, why dont use it?
	if test `pacman -Qs xosd`; then
		./autogen.sh --prefix=/opt/xneur --with-gtk=gtk2
	else
		./autogen.sh --prefix=/opt/xneur --with-gtk=gtk2 --without-xosd
	fi
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"	

	cd "$srcdir/xneur-devel/xneur"
	make DESTDIR="$pkgdir/" install
	ln -s /opt/xneur/bin/xneur $pkgdir/usr/bin/xneur
	
}

