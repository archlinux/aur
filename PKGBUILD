# Maintainer: hrdl <git@hrdl.eu>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philipp Kühn <p dot kuehn at posteo dot de>
# Contributor: Krut Patel <kroot.patel@gmail.com>

pkgname=sioyek-git
pkgver=2.0.0.r111.g779b52e
pkgrel=1
pkgdesc="PDF viewer for research papers and technical books."
arch=(x86_64)
license=(GPL3)
url="https://github.com/ahrm/sioyek"
depends=(qt5-base libmupdf)
makedepends=(git qt5-3d mujs)
provides=(sioyek)
conflicts=(sioyek)
source=("git+https://github.com/ahrm/sioyek.git"
        "sioyek-mupdf-1.23.patch"
        "standard-path-mupdf-build.patch")
sha256sums=('SKIP'
            '30021646fda45c40af4579067ccb098bff4b2934ff42ace7b02a61fd1c8bc573'
            '3f781450b34cf06bb3d9f5499c197f8be1fb6b9d25a77f98b03a226149a096c1')

pkgver() {
  cd "sioyek"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "sioyek"

  patch --forward --strip=1 --input="${srcdir}/standard-path-mupdf-build.patch"
  patch --forward --strip=1 --input="${srcdir}/sioyek-mupdf-1.23.patch"
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
