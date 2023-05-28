# Maintainer: éclairevoyant
# Contributor: George Rawlinson <grawlinson at archlinux dot org>
# Contributor: Jelle van der Waa <jelle at archlinux dot org>
# Contributor: Stéphane Gaudreault <stephane at archlinux dot org>

_pkgname=cppcheck
pkgname="$_pkgname-git"
pkgver=2.7.r1629.647432580
pkgrel=1
epoch=1
pkgdesc='Tool for static C/C++ code analysis'
arch=(i686 x86_64)
url='https://cppcheck.sourceforge.io/'
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=(pcre python tinyxml2)
makedepends=(clang cmake docbook-xsl git pandoc python-pygments qt5-base qt5-tools)
optdeps=('qt5-tools: cppcheck-gui'
         'python-pygments: cppcheck-htmlreport'
         'clang: cppcheck-gui integration')
source=("git+https://github.com/danmar/$_pkgname.git"
        0001-Add-missing-rebinding-trait-to-TaggedAllocator.patch
        translations-location.patch)
b2sums=('SKIP'
        '7c7e259c20b5c6ec9cfd5831fb0bd912aa2fa5b5f6c5afc18a6741e952138eacc9a2702f1b6f009beb75ddb724af29e3c0f4905f927cc091e3caf02566ca582a'
        '8156920eacc630cb5eceb2387937b747c84c6325bef906717cfbad68c122bdd27965da1e8070a560a0bed3a7b7c59ff5f0e116bb1d035c4c42f430c927a75b1f')

prepare() {
	cd $_pkgname
	patch -Np1 -i ../translations-location.patch
	patch -Np1 -i ../0001-Add-missing-rebinding-trait-to-TaggedAllocator.patch
}

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	export CXXFLAGS+=" -DNDEBUG"

	  # Manuals
	pushd $_pkgname
	xsversion=$(pacman -Qi docbook-xsl | grep ^Version | sed -e 's/.*: //' -e 's/-[0-9]$//')
	make DB2MAN=/usr/share/xml/docbook/xsl-stylesheets-${xsversion}-nons/manpages/docbook.xsl man
	pandoc man/manual.md -o man/manual.html -s --number-sections --toc
	pandoc man/reference-cfg-format.md -o man/reference-cfg-format.html -s --number-sections --toc
	popd

	cmake \
		-B build \
		-S $_pkgname \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DUSE_MATCHCOMPILER=ON \
		-DHAVE_RULES=ON \
		-DBUILD_GUI=ON \
		-DBUILD_SHARED_LIBS=OFF \
		-DBUILD_TESTS=ON \
		-DFILESDIR=/usr/share/cppcheck \
		-DUSE_BUNDLED_TINYXML2=OFF

	cmake --build build
}

check() {
	cd build/bin
	./testrunner -g -q
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	cd $_pkgname

	install -vDm644 $_pkgname.1 -t "$pkgdir/usr/share/man/man1/"
	install -vDm755 htmlreport/cppcheck-htmlreport -t "$pkgdir/usr/bin"

	# Fix location of language files
	install -d "${pkgdir}"/usr/share/cppcheck/cfg/lang
	mv "${pkgdir}"/usr/bin/cppcheck_*.qm "${pkgdir}"/usr/share/cppcheck/cfg/lang/
}
