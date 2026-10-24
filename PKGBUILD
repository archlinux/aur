# Maintainer: Gergely Imreh <gergely at imreh dot net>

pkgname=xshogi
pkgver=1.4.2
pkgrel=3
pkgdesc="X11 frontend for GNU Shogi (Japanese chess)"
arch=('x86_64' 'aarch64')
url="https://www.gnu.org/software/gnushogi/"
# GPL for xshogi itself, DEC's permission notice for the XBoard code it derives from
license=('GPL-1.0-or-later AND HPND-DEC')
depends=('glibc' 'libx11' 'libxt' 'libxaw' 'hicolor-icon-theme' 'gnushogi')
# Helvetica is hardcoded in the default fonts
optdepends=('xorg-fonts-75dpi: default fonts'
            'xorg-fonts-100dpi: default fonts')
source=("https://ftp.gnu.org/gnu/gnushogi/${pkgname}-${pkgver}.tar.gz"{,.sig}
        "0001-implicit-declaration.patch"
        "0002-Fix-declaration-of-yyerror.patch"
        "xshogi.desktop"
        "xshogi.png")
validpgpkeys=('F9113B1F55336A8B4376E3B0029820396BC37E36') # Yann Dirson
sha256sums=('2e2f1145e3317143615a764411178f538bd54945646b14fc2264aaeaa105dab6'
            'SKIP'
            '10e82a9d24003299a4ed2f50cafe9e4eca8bfec9257101e3eadd75d83b72cb8a'
            '7e9fc5337531f8e161beab82123ebf370440cf49af75d3fac3e91308f6948b4c'
            'ec82e583c8a4494169fc3b2aee8755ca007031a6be27bafc6e2cd5927ea98ff2'
            '22930c8cc7996bacbda9e16fda1965c17cbd4d8c0b60785c17c7a0a6027a82fc')
b2sums=('1a8f814802d0ee94788abc5c4a936da5d64e73135d6161f2afd8875cb4a645915ec82e98ad28c84fa3420d07e7074383a4a09fc6653916791d58f8b5b60578dc'
        'SKIP'
        '94e519bffe0b5265ca5af5af408741b35b327dcbb8f56c88ca700116c05669fa8307541b600883670f732c82b1c797b27ebdd6f04c86ef825fa3733f7f5dccf9'
        'de3b1801f24b7441172c50887b3b58847f02891024c9536af31d0971dd731b5cd61ba9541950b20c471f2421dfe63fcefa87f406c3f83438441481f5424d9239'
        'ffb146e8eb981bc09904752b2c2e9c8268e97f6ae08388b7ac691bb646c918ac7bc9b58e8d97934f0e58c4dc6a0f5ec43d50a1f6f5fdcfe2116da37ead910de9'
        '0ab9ebb88b433a081c5876911d7b6c802a0f09c0a508f91af7b27e0e98adebf039613284f6c0139d13ce79b89dedae129b6b17e42d5ec1c36cea674cb78f045f')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Patches from Debian 1.4.2-4 to build with modern compilers
  # (C99 implicit declarations and C23 empty-parameter prototypes)
  patch -Np1 -i "${srcdir}/0001-implicit-declaration.patch"
  patch -Np1 -i "${srcdir}/0002-Fix-declaration-of-yyerror.patch"
  # Drop the pre-generated parser/scanner so they are rebuilt from the patched
  # sources; make can't tell they are stale when makepkg normalises mtimes
  rm parser.c parser.h scanner.c
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" NEWS README
  install -Dm644 "${srcdir}/xshogi.desktop" "${pkgdir}/usr/share/applications/xshogi.desktop"
  # Icon made from eastern_bitmaps/king.xbm, as in Debian
  install -Dm644 "${srcdir}/xshogi.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/xshogi.png"

  # The DEC notice is only in the source headers, so extract it
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  sed -n '/Copyright 1991 by Digital/,/^ \* SOFTWARE\.$/s/^ \* \{0,1\}//p' xshogi.h \
    > "${pkgdir}/usr/share/licenses/${pkgname}/HPND-DEC"
}
