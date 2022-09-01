# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philipp Kühn <p dot kuehn at posteo dot de>

pkgname=sioyek-git
pkgver=1.5.0.r34.g95fe563
pkgrel=2
epoch=1
pkgdesc="PDF viewer for research papers and technical books."
arch=(x86_64)
license=(GPL3)
url="https://github.com/ahrm/sioyek"
depends=(qt5-base harfbuzz gumbo-parser openjpeg2 jbig2dec)
makedepends=(git qt5-3d mujs libmupdf)
provides=(sioyek)
conflicts=(sioyek)
source=("git+https://github.com/ahrm/sioyek.git")
sha256sums=('SKIP')

pkgver() {
	cd "sioyek"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd sioyek
  sed -i 's/\/\/#define LINUX_STANDARD_PATHS/#define LINUX_STANDARD_PATHS/' pdf_viewer/main.cpp
  sed -i 's/-lmupdf-third -lmupdf-threads -lharfbuzz/-lmupdf-third -lharfbuzz -lfreetype -lgumbo -ljbig2dec -lopenjp2 -ljpeg/' pdf_viewer_build_config.pro
  qmake "CONFIG+=linux_app_image" pdf_viewer_build_config.pro
  make
}

package() {
    cd "sioyek"
    make INSTALL_ROOT="${pkgdir}/" install
    install -D tutorial.pdf -t "${pkgdir}/usr/share/sioyek"
    install -Dm644 -t "${pkgdir}/etc/sioyek" pdf_viewer/keys.config pdf_viewer/prefs.config
    install -Dm644 -t "${pkgdir}/usr/share/man/man1" resources/sioyek.1
    install -d "${pkgdir}/usr/share/sioyek/shaders"
    cp -r pdf_viewer/shaders/* "${pkgdir}/usr/share/sioyek/shaders"
}
