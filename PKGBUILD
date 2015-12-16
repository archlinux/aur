# Contributor: Ben Ward <benjamin.ward@bathspa.org>
# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=rstudio-desktop
pkgver=0.99.486
_gwtver=2.7.0
_ginver=1.5
_clangver=3.6.1
pkgrel=1
pkgdesc="Open source and enterprise-ready professional software for the R community"
arch=('i686' 'x86_64')
url="http://www.rstudio.com/"
license=('AGPL')
depends=('r>=2.11.1' 'boost-libs>=1.50' qt5-base qt5-webkit pango shared-mime-info mathjax pandoc clang)
makedepends=('cmake>=2.8' 'boost>=1.50' java-environment apache-ant openssl pam)
conflicts=('rstudio-desktop-bin' 'rstudio-desktop-git' 'rstudio-desktop-preview-bin')
install=rstudio-desktop.install
source=("rstudio-$pkgver.tar.gz::https://github.com/rstudio/rstudio/tarball/v$pkgver"
        "https://s3.amazonaws.com/rstudio-buildtools/gin-$_ginver.zip"
        "https://s3.amazonaws.com/rstudio-buildtools/gwt-$_gwtver.zip"
        "https://s3.amazonaws.com/rstudio-dictionaries/core-dictionaries.zip"
        "qdatastream.patch")
noextract=('core-dictionaries.zip'
           "gin-$_ginver.zip")
sha256sums=('e6e8dff7506f31293b319ac26ee58e4fbd8da528b8887b70e31438d8b407d3c9'
            'f561f4eb5d5fe1cff95c881e6aed53a86e9f0de8a52863295a8600375f96ab94'
            'aa65061b73836190410720bea422eb8e787680d7bc0c2b244ae6c9a0d24747b3'
            '4341a9630efb9dcf7f215c324136407f3b3d6003e1c96f2e5e1f9f14d5787494'
            '3147f02fe9fb557c7dee4d332db9626da4ac4b563ad3d00fc68c6f955afd0a41')

_pkgname=rstudio

prepare() {
	unzip -o "$srcdir/gin-$_ginver.zip" -d "gin-$_ginver"
}

build() {
	cd "$srcdir/$_pkgname-$_pkgname-"*
	
	patch -p 1 -i "$srcdir/qdatastream.patch"
	
	install -d src/gwt/lib/{gin/$_ginver,gwt/$_gwtver}
	
	cp -r "$srcdir/gin-$_ginver/"* "src/gwt/lib/gin/$_ginver"
	cp -r "$srcdir/gwt-$_gwtver/"* "src/gwt/lib/gwt/$_gwtver"
	
	(
		cd "dependencies/common"
		install -d dictionaries libclang/{3.5,builtin-headers}
		
		unzip -qfod "dictionaries" "$srcdir/core-dictionaries.zip"
		
		ln -sfT "/usr/share/mathjax"                mathjax-23
		ln -sfT "/usr/bin"                          pandoc
		ln -sfT "/usr/lib/libclang.so"              libclang/3.5/libclang.so
		ln -sfT "/usr/lib/clang/$_clangver/include" libclang/builtin-headers/3.5
		
		bash "install-packages"
	)
	
	cmake -DRSTUDIO_TARGET=Desktop \
		-DCMAKE_BUILD_TYPE=Release \
		-DQT_QMAKE_EXECUTABLE=/usr/lib/qt/bin/qmake \
		-DCMAKE_INSTALL_PREFIX=/usr/lib/rstudio
}

package() {
	cd "$srcdir/$_pkgname-$_pkgname-"*
	
	make DESTDIR="$pkgdir/" install
	
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
