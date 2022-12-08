# Maintainer: éclairevoyant

_pkgname=cysboard
pkgname="$_pkgname-git"
_gitname=Cysboard
pkgver=1.2.r44.a5bc770
pkgrel=1
pkgdesc='Lightweight system monitor with html and css for themes'
arch=('x86_64')
url="https://github.com/mike168m/$_gitname"
license=('GPL3')
depends=('gtk3' 'libsciter-gtk' 'spdlog')
makedepends=('cmake>=3.1' 'git')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_gitname
	printf "%s.%s" $(git blame -s -L/Cysboard_VERSION_MAJOR/,+2 CMakeLists.txt | awk 'BEGIN { ORS = "."; }
	{
		gsub("[\")]", "");
		"git rev-list --count "$1"..HEAD" | getline x;
		if (NR==1 || min>x) {
			min = x;
			min_hash = $1;
		}
		print $4;
	}
	END {
		ORS="";
		print "r"min;
	}') $(git rev-parse --short HEAD)
}

build() {
	cmake -B build -S $_gitname
	make -C build
}

package() {
	install -Dm755 build/build/$_gitname "$pkgdir/usr/bin/$_pkgname"
}
