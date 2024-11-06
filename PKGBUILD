# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gv
pkgver=3.7.4
pkgrel=6
pkgdesc="A program to view PostScript and PDF documents"
arch=('x86_64')
url="https://www.gnu.org/software/gv/"
license=('GPL-3.0-or-later')
depends=('xaw3d' 'ghostscript')
optdepends=('perl: gv-update-userconfig')
options=('emptydirs')
source=(
  https://ftp.gnu.org/gnu/gv/${pkgname}-${pkgver}.tar.gz
  gv.desktop
  0001-Do-not-segfault-on-buggy-postscript-files-i.-e.-file.patch
  0002-Fix-crash-in-zoom.c.patch
)
sha256sums=('2162b3b3a95481d3855b3c4e28f974617eef67824523e56e20b56f12fe201a61'
            '9b272fe86a7bdfbb170dfd850ae18204ef1ed0982bd88a8b2b3db7a7f5e87eb7'
            'ce9a6f5df3967ad17fa528c40f06e84b27df09ac4cf1f3ef379b7b6e5a071b6e'
            'dbddd6a1e5d7a198a012af89c1585c4824eb1b3a4712790c63d48be7a28935d9')


prepare() {
  cd ${pkgname}-${pkgver}
  sed -i -e "s:-dGraphicsAlphaBits=2:\0 -dAlignToPixels=0:" src/Makefile.{am,in}
  # patches from debian http://deb.debian.org/debian/pool/main/g/gv/gv_3.7.4-3.debian.tar.xz
  patch -p1 -i ../0001-Do-not-segfault-on-buggy-postscript-files-i.-e.-file.patch
  patch -p1 -i ../0002-Fix-crash-in-zoom.c.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 ../gv.desktop "${pkgdir}/usr/share/applications/gv.desktop"
  install -D -m644 src/gv_icon.xbm "${pkgdir}/usr/share/pixmaps/gv.xbm"
}
