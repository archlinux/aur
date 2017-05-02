# Maintainer: hfte@posteo.org
pkgname=sws
pkgver=2.9.4.0
pkgrel=1
pkgdesc="A collection of features that seamlessly integrate into REAPER"
arch=('x86_64')
url="http://www.sws-extension.org/"
license=('MIT')
depends=('reaper')
makedepends=('git' 'gcc' 'make' 'php')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git://github.com/reaper-oss/sws.git"
	"git://github.com/justinfrankel/WDL")
md5sums=('SKIP'
	 'SKIP')
pkgver() {
	cd "$pkgname"
	head -1 version.h | tr , . | cut -d' ' -f3
}

prepare() {
	echo "You have to following Steps on your own:"
	echo "1) Open REAPER"
	echo "2) Go to Actions tab"
	echo "3) open Show action list..."   
	echo "4) search for header in the actions list"
	echo "5) export reaper_plugin_functions.h to your home directory"
	while true; do
		read -p "Did you complete this tasks? " yn
		case $yn in
			[Yy]* ) break;;
			[Nn]* ) exit;;
			* ) echo "Please answer yes or no.";;
		esac
	done
	HOMEDIR=$(eval echo ~$USER)
	cp "${HOMEDIR}/reaper_plugin_functions.h" "$srcdir/$pkgname"
}

build() {
	cd "$pkgname"
	git checkout next
	make
	rm "${HOMEDIR}/reaper_plugin_functions.h"
}


package() {
	DESTDIR="${pkgdir}/usr/lib/REAPER/Plugins/"
	mkdir -p "${DESTDIR}"
	cp "${srcdir}/$pkgname/reaper_sws64.so" "${DESTDIR}"
	cd "${srcdir}"
	cd ..
        mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
