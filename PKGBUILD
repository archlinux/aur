# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=2.8.8
pkgrel=2
pkgdesc="A cross-platform open-source make system"
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info')
makedepends=('qt')
optdepends=('qt: cmake-gui')
install="${pkgname}.install"
source=("http://www.cmake.org/files/v2.8/${pkgname}-${pkgver}.tar.gz"
        'fix-pkg-config.patch')
md5sums=('ba74b22c788a0c8547976b880cd02b17'
         '32c6a4360a2ba12dc77b6a840fa7672b')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # FS#29545
  patch -p1 -i "${srcdir}"/fix-pkg-config.patch

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  vimpath="$pkgdir/usr/share/vim/vimfiles"
  install -Dm644 Docs/cmake-indent.vim ${vimpath}/indent/cmake-indent.vim
  install -Dm644 Docs/cmake-syntax.vim ${vimpath}/syntax/cmake-syntax.vim
  install -Dm644 Docs/cmake-mode.el ${pkgdir}/usr/share/emacs/site-lisp/cmake-mode.el

  install -Dm644 Copyright.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
