# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=2.8.11.2
pkgrel=2
pkgdesc="A cross-platform open-source make system"
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info')
makedepends=('qt4' 'emacs')
optdepends=('qt4: cmake-gui')
install="${pkgname}.install"
source=("http://www.cmake.org/files/v2.8/${pkgname}-${pkgver}.tar.gz"
        'imagemagick.patch')
md5sums=('6f5d7b8e7534a5d9e1a7664ba63cf882'
         '19c4cf0e6e9c9a890f3698c9df8062f1')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/imagemagick.patch
  sed -i 's/Magick++-6.Q16/Magick++-6.Q16 Magick++-6.Q16HDRI/' Modules/FindImageMagick.cmake
  sed -i 's/MagickWand-6.Q16/MagickWand-6.Q16 MagickWand-6.Q16HDRI/' Modules/FindImageMagick.cmake
  sed -i 's/MagickCore-6.Q16/MagickCore-6.Q16 MagickCore-6.Q16HDRI/' Modules/FindImageMagick.cmake
}

build() {
  cd ${pkgname}-${pkgver}

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  vimpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 Docs/cmake-indent.vim "${vimpath}"/indent/cmake-indent.vim
  install -Dm644 Docs/cmake-syntax.vim "${vimpath}"/syntax/cmake-syntax.vim

  install -Dm644 Docs/cmake-mode.el \
    "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
