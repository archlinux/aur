# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philipp Kühn <p dot kuehn at posteo dot de>

pkgname=sioyek-git
pkgver=1.4.0.r4.gd65898a
pkgrel=1
epoch=1
pkgdesc="PDF viewer for research papers and technical books."
arch=(x86_64)
license=(GPL3)
url="https://github.com/ahrm/sioyek"
depends=(qt5-base harfbuzz gumbo-parser openjpeg2 jbig2dec)
makedepends=(git qt5-3d libmupdf mujs)
provides=(sioyek)
conflicts=(sioyek)
source=("git+https://github.com/ahrm/sioyek.git"
        "git+https://github.com/ArtifexSoftware/mupdf.git"
        "git+https://github.com/madler/zlib.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "sioyek"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "sioyek"
	git submodule init
    git config submodule.mupdf.url "${srcdir}/mupdf"
    git config submodule.zlib.url "${srcdir}/zlib"
	git submodule update
}

build() {
	#cd "sioyek/mupdf"
    #make USE_SYSTEM_HARFBUZZ=yes
    #cd ..
	cd "sioyek"

    sed -i 's/-lmupdf-third -lmupdf-threads -lharfbuzz/-lmupdf-third -lharfbuzz -lfreetype -lgumbo -ljbig2dec -lopenjp2 -ljpeg/' pdf_viewer_build_config.pro
    qmake-qt5 pdf_viewer_build_config.pro DEFINES+="LINUX_STANDARD_PATHS"
    make
}

package() {
	cd "sioyek"
    make INSTALL_ROOT="${pkgdir}/" install
    install -D tutorial.pdf -t "${pkgdir}/usr/share/sioyek"
    install -d "${pkgdir}/usr/share/sioyek/shaders"
    cp -r pdf_viewer/shaders/* "${pkgdir}/usr/share/sioyek/shaders"
}
