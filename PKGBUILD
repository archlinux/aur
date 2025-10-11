# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Danila Fedotov <mail at danilafedotov dot com>
# Contributor: Gökberk Yaltıraklı <webdosusb at gmail dot com>
# Contributor: Tuur Vanhoutte <vanhouttetuur at gmail dot com>
pkgname=notes
pkgver=2.3.1
pkgrel=5
pkgdesc='Note taking application, write down your thoughts'
arch=('x86_64')
url='https://www.notes-foss.com/'
license=('MPL-2.0')
depends=(
	libx11
	gcc-libs
	glibc
	hicolor-icon-theme
	qt6-base
	qt6-declarative)
makedepends=(git cmake)
_commit=v${pkgver}
source=("git+https://github.com/nuttyartist/notes.git#commit=$_commit"
	'git+https://github.com/b00f/qautostart.git'
	'git+https://github.com/pbek/qmarkdowntextedit.git'
	'git+https://github.com/alex-spataru/QSimpleUpdater.git'
	'fix-build-on-qt6-10.patch') # cherry-picks 1585918af82e9ab03208be00a20816e5599f93f2
sha256sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP')

prepare() {
	cd ${pkgname}
	git submodule init
	git submodule set-url 3rdParty/qautostart "${srcdir}/qautostart"
	git submodule set-url 3rdParty/qmarkdowntextedit "${srcdir}/qmarkdowntextedit"
	git submodule set-url 3rdParty/QSimpleUpdater "${srcdir}/QSimpleUpdater"
	git -c protocol.file.allow=always submodule update

	patch -Np1 -i "${srcdir}/fix-build-on-qt6-10.patch"
}

build() {
	cd ${pkgname}
	cmake -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUPDATE_CHECKER=OFF \
		-Wno-dev
	cmake --build build
}

package() {
	cd ${pkgname}
	DESTDIR="${pkgdir}" cmake --install build
}
