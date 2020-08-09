# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=lemon-lime
pkgver=0.2.2
pkgrel=5
epoch=
pkgdesc="为了 OI 比赛而生的基于 Lemon 的轻量评测系统 | A tiny judging environment for OI contest based on Project_LemonPlus"
arch=(x86_64)
url="https://github.com/iotang/Project_LemonLime"
license=('GPL3')
groups=()
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'ninja')
checkdepends=()
optdepends=('gcc: C and C++ support'
            'fpc: Pascal support'
            'java-environment: Java support'
            'freebasic: BASIC support'
            'python: Python support')
provides=("lemon-lime")
conflicts=("lemon-lime-git")
replaces=()
backup=()
options=()
install=
changelog=
# TODO: use all source package in next update
source=(
    "LemonLime::git+https://github.com/iotang/Project_LemonLime#tag=v${pkgver}"
    "singleapplication::git+https://github.com/itay-grudev/SingleApplication"
    'lemon-lime.desktop'
)
noextract=()
md5sums=('SKIP'
         'SKIP'
         '707ae7795aab12effd83e92e394bccf4')
validpgpkeys=()

prepare() {
    cd "${srcdir}/LemonLime"
    #sed -i '/unix:QMAKE_LFLAGS += -no-pie/d' lemon.pro
    sed -i '/add_link_options(-no-pie)/d' CMakeLists.txt
    git submodule init
    submodules=('singleapplication')
    for module in ${submodules[@]}; do
        git config submodule."$module".url "${srcdir}/$module"
    done

    git submodule update
}

build() {
	cd "${srcdir}/LemonLime"
	g++ watcher_unix.cpp -o watcher_unix -O2
	#qmake lemon.pro
	#make
    cmake -GNinja .
	ninja

}

package() {
	cd "${srcdir}/LemonLime"
	install -D -m755 lemon "$pkgdir/usr/bin/$pkgname"

	#install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 pics/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/lemon-lime.png"
	install -D -m755 $srcdir/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	#install -D -m644 Changelog.md "$pkgdir/usr/share/doc/$pkgname/Changelog.md"
}
