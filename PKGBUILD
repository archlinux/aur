# Maintainer: Emma CHRISTOPHE <jean.michel.lesatanique@gmail.com>
pkgname=crcl-select-git
pkgver=2.2.pre
pkgrel=0
pkgdesc="Git version - may not work - Circle selection utility with Eww widgets"
arch=('x86_64')
url="https://github.com/Pat8998/crcl-select/"
license=('unknown')
groups=()
backup=('etc/crcl-select/theme.json'
		'etc/crcl-select/toolbox.json'
		'etc/crcl-select/power_menu.json')
depends=('eww' 'jq')
makedepends=('jansson')
source=('git+https://github.com/Pat8998/crcl-select.git')
sha256sums=('SKIP')

build() {
	cd "$srcdir/crcl-select"
	tput setaf 13
	printf "Building crcl-select...\n"
	gcc "eww-circle.c"    		-O3 -o crcl-circle-gen   -ljansson -lm
	tput setaf 5
		printf "	Compiled crcl-circle-gen\n"
	gcc "eww-execute.c"   		-O3 -o crcl-exe          -ljansson -lm
		printf "	Compiled crcl-exe\n"
	gcc "eww-angle.c"     		-O3 -o crcl-angle        -ljansson -lm
		printf "	Compiled crcl-angle\n"
	gcc "eww-circle-select.c" 	-O3 -o crcl-select    	 -ljansson -lm
		printf "	Compiled crcl-select\n"
	tput setaf 13
	printf "Build ok\n"
}

package() {
	# Create the target directory
	mkdir -p "$pkgdir"/etc/crcl-select
	mkdir -p "$pkgdir"/usr/share/crcl-select/
	mkdir -p "$pkgdir"/usr/bin/
	
	# Copy compiled binaries
	cd "$srcdir/crcl-select"
	install -Dm755 "crcl-circle-gen" 			"$pkgdir"/usr/bin/
	install -Dm755 "crcl-exe" 					"$pkgdir"/usr/bin/
	install -Dm755 "crcl-angle" 				"$pkgdir"/usr/bin/
	install -Dm755 "crcl-select" 				"$pkgdir"/usr/bin/

	# Copy data files	
	tput setaf 4	
	printf 	"Data files installation in /usr/share/crcl-select/ ..."
	install -Dm644 "eww.yuck" 					"$pkgdir"/usr/share/crcl-select/
	install -Dm644 "eww.scss" 					"$pkgdir"/usr/share/crcl-select/
	tput setaf 2
	printf  "ok\n"
	tput setaf 4
	printf "Default configuration files installation in /etc/crcl-select/ ..."
	install -Dm644 "def_conf/toolbox.json" 		"$pkgdir"/etc/crcl-select/
	install -Dm644 "def_conf/power_menu.json" 	"$pkgdir"/etc/crcl-select/
	install -Dm644 "def_conf/theme.json" 		"$pkgdir"/etc/crcl-select/
	tput setaf 2
	printf  "ok\n"
	tput setaf 3
	printf "Warining :  when upgrading to v2.1+, themes are incompatible\n\n"
	tput setaf 1
	printf ">-------------< COPY DEFAULT CONFIG FILES TO ~/.config/crcl-select/ >-------------<"
	printf "\nwith :"
	tput setaf 5
	printf "\n	mkdir -p ~/.config/crcl-select "
	printf "\n	cp /etc/crcl-select/* ~/.config/crcl-select \n\n"
	tput setaf 7
} 
