# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: push2001sla@gmail.com
# Developer: andrewcrew@rambler.ru

pkgname=xneur-devel-git
pkgver=0.20.0
pkgrel=20
epoch=
pkgdesc="X Neural Switcher detects the input language and corrects keyboard layout. Git version"
arch=('any')
url="https://github.com/AndrewCrewKuznetsov/xneur-devel"
license=('GPL')
groups=()
depends=('enchant1.6' 'gtk2' 'libnotify' 'gstreamer>=1.14.4')
makedepends=('git' 'intltool')
checkdepends=()
optdepends=('hunspell-YOUR-LANGUAGE' 'xosd--rebuilding_needed')
provides=("xneur=$pkgver")
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

build() {

	if test ! -h /usr/include/enchant; then
		echo "You have to check if enchant1.6 is installed"
		echo "And /usr/include/enchant is a symlink to /usr/include/enchant1.6"
		echo "ln -s /usr/include/enchant1.6 /usr/include/enchant"
		exit 127
	fi

	cd "$srcdir/xneur-devel/xneur"
        ./autogen.sh --prefix=/usr/ --sysconfdir=/etc --without-xosd --with-gtk=gtk2
	./configure --prefix=/usr/ --sysconfdir=/etc --without-xosd --with-gtk=gtk2
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	mkdir -p "$pkgdir/usr/bin"	

	cd "$srcdir/xneur-devel/xneur/build"
	make DESTDIR="$pkgdir/" install
        mv -f "$pkgdir/usr/local/*" "$pkgdir/usr/"
}

