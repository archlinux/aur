_pkgname=Surelog
pkgname=${_pkgname,,}-git
pkgver=r3840.a1edc64c1
pkgrel=1
pkgdesc="SystemVerilog 2017 Pre-processor, Parser, Elaborator, UHDM Compiler."
arch=(x86_64)
url="https://github.com/chipsalliance/$_pkgname"
license=('Apache')
depends=('antlr4-runtime' 'uhdm' 'flatbuffers')
makedepends=('git' 'cmake' 'tcl' 'antlr4')
checkdepends=('gtest')
provides=("${_pkgname,,}=$pkgver")
conflicts=("${_pkgname,,}")
source=(
	"git+$url"
	"0001-Unvendor-dependencies.patch"
	"0002-Don-t-build-hello-worlds.patch"
	"0003-Fix-installation-directories.patch"
	"0004-Fix-install-location-of-cmake-config-files.patch"
	"0005-Build-shared-instead-of-static-library.patch"
)
sha256sums=('SKIP'
            '957d4ac0d8da855d993719ae5a33ee112c01ec62cdf2411f93d945b33e4f246e'
            'edb38cf4fbed373574e02f2e7559ee8c43ffaf75d6945ff5c0251886d18a9924'
            'f6ce38895b3f493f45e75fe87b7604d9f0a52b56f38b320d797ba6e4c3d79969'
            '4a14d0861cc8daa3fd192711870c02394e2def0ff662c9f846c4baf36f97f6d4'
            '968e6832222b9eadce0bc4dc4e0e7872f26bb4bec69709771d1bd4c7b64b22ba')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -p1 < "$srcdir/0001-Unvendor-dependencies.patch"
	patch -p1 < "$srcdir/0002-Don-t-build-hello-worlds.patch"
	patch -p1 < "$srcdir/0003-Fix-installation-directories.patch"
	patch -p1 < "$srcdir/0004-Fix-install-location-of-cmake-config-files.patch"
	patch -p1 < "$srcdir/0005-Build-shared-instead-of-static-library.patch"
}

build() {
	cmake -B build -S "$_pkgname" \
		-DANTLR_JAR_LOCATION=/usr/share/java/antlr-complete.jar \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None
	make -C build
}

check() {
	make -C build UnitTests
	make -C build -k test
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
