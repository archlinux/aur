# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=dwm-jfchevrette
_pkgname=dwm
pkgver=6.2
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'st' 'dmenu')
provides=(dwm)
conflicts=(dwm)
install=dwm.install
source=(http://dl.suckless.org/dwm/dwm-${pkgver}.tar.gz
        config.h
        dwm.desktop
        dwm-attachaside-6.1.diff
        dwm-rotatestack-20161021-ab9571b.diff
        dwm-uselessgap-6.2.diff)
sha256sums=('97902e2e007aaeaa3c6e3bed1f81785b817b7413947f1db1d3b62b8da4cd110e'
            '1aa35c0d21fc32263b3eb484df76b5cc883255201c817dfc3c89f3e4266e8295'
            'bc36426772e1471d6dd8c8aed91f288e16949e3463a9933fee6390ee0ccd3f81'
            '86bdb4291c0f8f9b0c6fbbac9f05403224872b786fc5e74f3b141c8f2ce6c7a1'
            '27c889d424e1b539cd8b113d0c4f9693be521a0a2ef5adf246ecf3efb4208f3c'
            '5667251372a5f3e8f297a2b458637ead9627f608b8e86e7a517baf791106a237')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cp "${srcdir}/config.h" config.h

  # https://dwm.suckless.org/patches/attachaside/
  patch -p1 < "${srcdir}/dwm-attachaside-6.1.diff"
  # https://dwm.suckless.org/patches/rotatestack/
  patch -p1 < "${srcdir}/dwm-rotatestack-20161021-ab9571b.diff"
  # https://dwm.suckless.org/patches/uselessgap/
  patch -p1 < "${srcdir}/dwm-uselessgap-6.2.diff"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/${_pkgname}/README"
  install -m644 -D "${srcdir}/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}
