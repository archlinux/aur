# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philipp Kühn <p dot kuehn at posteo dot de>
# Contributor: Krut Patel <kroot.patel@gmail.com>

pkgname=sioyek-git
pkgver=2.0.0.r103.g5517425
pkgrel=2
epoch=1
pkgdesc="PDF viewer for research papers and technical books."
arch=(x86_64)
license=(GPL3)
url="https://github.com/ahrm/sioyek"
depends=(qt5-base  libmupdf)
makedepends=(git qt5-3d mujs ) #gumbo-parser openjpeg2 jbig2dec harfbuzz
provides=(sioyek)
conflicts=(sioyek)
# patch retreived from https://paste.debian.net/plain/1290973 (source: https://aur.archlinux.org/packages/sioyek-git#comment-932428)
source=("git+https://github.com/ahrm/sioyek.git"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/sioyek-mupdf-1.23.0.patch")
sha256sums=('SKIP'
            'b71f3658803c80bd7a5cf59b38bb80418fd85cec06ee631a14d39736f2bfe39c')

pkgver() {
  cd "sioyek"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "sioyek"

  patch --forward --strip=1 --input="${srcdir}/sioyek-mupdf-1.23.0.patch"
  sed -i 's/-lmupdf-threads/-lfreetype -lgumbo -ljbig2dec -lopenjp2 -ljpeg/' pdf_viewer_build_config.pro
  sed -i '/#define LINUX_STANDARD_PATHS/s/\/\///' pdf_viewer/main.cpp
  sed -i 's/-lmupdf-third//' pdf_viewer_build_config.pro
}

build() {
  cd sioyek
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
