# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=lemon-lime
pkgver=0.2.2
pkgrel=2
epoch=
pkgdesc="为了 OI 比赛而生的基于 Lemon 的轻量评测系统 | A tiny judging environment for OI contest based on Project_LemonPlus"
arch=(x86_64)
url="https://github.com/iotang/Project_LemonLime"
license=('GPL3')
groups=()
depends=('qt5-base')
makedepends=()
checkdepends=()
optdepends=()
provides=("lemon-lime")
conflicts=("lemon-lime-git")
replaces=()
backup=()
options=()
install=
changelog=
source=(
    'LemonLime::git+https://github.com/iotang/Project_LemonLime'
    'singleapplication::git+https://github.com/itay-grudev/SingleApplication'
    'lemon-lime.desktop'
)
noextract=()
md5sums=('SKIP'
         'SKIP'
         '9502bfa470c41577c750314515bba6f0')
validpgpkeys=()

prepare() {
    cd "${srcdir}/LemonLime"
    git checkout "v${pkgver}"
    sed -i '/unix:QMAKE_LFLAGS += -no-pie/d' lemon.pro
    git submodule init
    submodules=('singleapplication')
    for module in ${submodules[@]}; do
        git config submodule."$module".url "${srcdir}/$module"
    done
    
    git submodule update
}

build() {
	cd "${srcdir}/LemonLime"
	#./configure --prefix=/usr
	g++ watcher_unix.cpp -o watcher_unix -O2
	qmake lemon.pro
	make

}

check() {
	cd "${srcdir}/LemonLime"
	make -k check
}

package() {
	cd "${srcdir}/LemonLime"
	install -D -m755 lemon "$pkgdir/usr/bin/$pkgname"

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 pics/icon.png "$pkgdir/usr/share/pixmaps/lemon-lime.png"
	install -D -m644 $srcdir/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	#install -D -m644 Changelog.md "$pkgdir/usr/share/doc/$pkgname/Changelog.md"
}
