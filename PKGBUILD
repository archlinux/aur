# Maintainer: Ashar Khan <ashar786khan at gmail.com>

pkgname=cpeditor-git
_pkgname=cpeditor
pkgver=6.3.1.r11.gffac70c
pkgrel=1
pkgdesc='The editor for competitive programming'
arch=('x86_64')
url='https://github.com/cpeditor/cpeditor'
license=('GPL3')
depends=('qt5-base')
makedepends=("gcc" "cmake" "git" "python3")
conflicts=("cpeditor")

source=('git://github.com/cpeditor/cpeditor.git'
	'git://github.com/cpeditor/QCodeEditor.git'
	'git://github.com/cpeditor/QtFindReplaceDialog.git'
	'git://github.com/cpeditor/lsp-cpp.git'
	'git://github.com/itay-grudev/singleapplication.git'
	'git://github.com/MikeMirzayanov/testlib.git')

md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git submodule init
	
	git config submodule.QCodeEditor.url $srcdir/third_party/QCodeEditor
	git config submodule.QtFindReplaceDialog.url $srcdir/third_party/QtFindReplaceDialog
	git config submodule.lsp-cpp.url $srcdir/third_party/lsp-cpp
	git config submodule.singleapplication.url $srcdir/third_party/singleapplication
	git config submodule.testlib.url $srcdir/third_party/testlib

	git submodule update
}

build() {
	cd $_pkgname
	cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_COMPILER=g++
	cmake --build build
}

package() {
	cd $_pkgname/build
	make DESTDIR="$pkgdir" install
}



