# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Konstantinos Pachnis <kpachnis@mes-direct.com>

pkgname=cmake
pkgver=2.8.2
pkgrel=3
pkgdesc="A cross-platform open-source make system"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.cmake.org"
depends=('expat' 'curl' 'gcc-libs' 'shared-mime-info')
makedepends=('qt')
optdepends=('qt: cmake-gui')
install=${pkgname}.install
source=("http://www.cmake.org/files/v2.8/${pkgname}-${pkgver}.tar.gz"
	'python2.7.patch')
md5sums=('8c967d5264657a798f22ee23976ff0d9'
	'61e1cc4373ee577d277dab0857b883e4')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/python2.7.patch

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --system-libs \
    --qt-gui \
    --parallel=2
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  vimpath="$pkgdir/usr/share/vim/vimfiles"
  install -Dm644 Docs/cmake-indent.vim ${vimpath}/indent/cmake-indent.vim
  install -Dm644 Docs/cmake-syntax.vim ${vimpath}/syntax/cmake-syntax.vim
  install -Dm644 Docs/cmake-mode.el ${pkgdir}/usr/share/emacs/site-lisp/cmake-mode.el
  install -Dm644 Copyright.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
