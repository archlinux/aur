# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.1.0
pkgrel=2
pkgdesc='A cross-platform open-source make system'
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info')
makedepends=('qt5-base' 'python-sphinx' 'emacs')
optdepends=('qt5-base: cmake-gui'
            'libxkbcommon-x11: cmake-gui')
install="${pkgname}.install"
source=("http://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"
        0001-FindRuby-Fix-output-check-in-_RUBY_CONFIG_VAR.patch)
md5sums=('188eb7dc9b1b82b363bc51c0d3f1d461'
         'c21e3e63501e1ee7aa6092851089f8ad')

prepare() {
  cd ${pkgname}-${pkgver}

  # http://public.kitware.com/pipermail/cmake-developers/2014-December/024044.html
  patch -Np1 -i ../0001-FindRuby-Fix-output-check-in-_RUBY_CONFIG_VAR.patch
}

build() {
  cd ${pkgname}-${pkgver}

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --sphinx-man \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  vimpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${vimpath}"/{help,indent,syntax}
  ln -s /usr/share/cmake-${pkgver%.*}/editors/vim/cmake-help.vim \
    "${vimpath}"/help/
  ln -s /usr/share/cmake-${pkgver%.*}/editors/vim/cmake-indent.vim \
    "${vimpath}"/indent/
  ln -s /usr/share/cmake-${pkgver%.*}/editors/vim/cmake-syntax.vim \
    "${vimpath}"/syntax/

  install -d "${pkgdir}"/usr/share/emacs/site-lisp/
  emacs -batch -f batch-byte-compile \
    "${pkgdir}"/usr/share/cmake-${pkgver%.*}/editors/emacs/cmake-mode.el
  ln -s /usr/share/cmake-${pkgver%.*}/editors/emacs/cmake-mode.el \
    "${pkgdir}"/usr/share/emacs/site-lisp/

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
