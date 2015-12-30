# Contributor: <nixtrian@gmail.com>
# Contributor: <philipp.mildenberger <- AT -> student.uibk.ac.at>

pkgname="fragmentarium-git"
_pkgname="fragmentarium"
_gitname="Fragmentarium"
pgksourcename="Fragmentarium-Source"
pkgver=1.0.0.r19.144.g132c6b5
pkgrel=2
pkgdesc="Fragmentarium is an open source, cross-platform IDE for exploring pixel based graphics on the GPU"
arch=('i686' 'x86_64')
url="http://syntopia.github.com/Fragmentarium/"
license=('GPL3 or LGPL 2.1')
depends=('qt5-base' 'qt5-xmlpatterns' 'qt5-script' 'mesa')
makedepends=("git")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+https://github.com/Syntopia/Fragmentarium"
        "fragmentarium.desktop")
md5sums=('SKIP' 
         'c7a0add0fb47613c5de3c0ad3a62464d')

pkgver() {
	cd "${_gitname}"
	git describe --long --tags | sed 's/v//g' | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed "s/g/$(git rev-list --count HEAD).g/g"
}

build() {
	cd "$_gitname/$pgksourcename"
	qmake -project -after "CONFIG+=opengl" -after "QT+=xml opengl script"
	qmake
	make
}


package() {
	cd "$_gitname/$pgksourcename"
	install -d -m755 $pkgdir/usr/bin
	install -m755 "$pgksourcename" "$pkgdir/usr/bin/fragmentarium"
	install -d 755 "$pkgdir/usr/share/fragmentarium"
	cp -rf "Examples" "Misc" $pkgdir/usr/share/fragmentarium/
	mkdir -p "$pkgdir/usr/share/applications"
	cp -rf "$startdir/fragmentarium.desktop" "$pkgdir/usr/share/applications/"
}
