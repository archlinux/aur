# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=lemon-lime-git
_pkgname=lemon-lime
pkgver=0.2.2.r2.f8de93a
pkgrel=1
epoch=1
pkgdesc="为了 OI 比赛而生的基于 Lemon 的轻量评测系统 | A tiny judging environment for OI contest based on Project_LemonPlus"
arch=(x86_64)
url="https://github.com/iotang/Project_LemonLime"
license=('GPL3')
groups=()
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'ninja')
checkdepends=()
optdepends=()
provides=("lemon-lime")
conflicts=("lemon-lime")
replaces=()
backup=()
options=()
install=
changelog=
source=('Project_LemonLime::git+https://github.com/iotang/Project_LemonLime.git'
		"lemon-lime.desktop"
		)
noextract=()
md5sums=('SKIP'
         '707ae7795aab12effd83e92e394bccf4')
validpgpkeys=()

pkgver() {
	cd "$srcdir/Project_LemonLime"
	#git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
# Git, tags available
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
 #   printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/Project_LemonLime"
	#sed -i '/unix:QMAKE_LFLAGS += -no-pie/d' lemon.pro
	sed -i '/add_link_options(-no-pie)/d' CMakeLists.txt
    git submodule update --init --recursive
}

build() {
	cd "$srcdir/Project_LemonLime"
	#./configure --prefix=/usr
	g++ watcher_unix.cpp -o watcher_unix -O2
	#qmake lemon.pro
	#make
	cmake -GNinja .
	ninja

}

package() {
	cd "$srcdir/Project_LemonLime"
	install -D -m755 lemon "$pkgdir/usr/bin/$_pkgname"

	#install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -D -m644 pics/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/lemon-lime.png"
	install -D -m755 ../$_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -D -m644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	#install -D -m644 Changelog.md "$pkgdir/usr/share/doc/$pkgname/Changelog.md"
}
