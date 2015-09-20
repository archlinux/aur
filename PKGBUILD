# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.3.2
pkgrel=3
pkgdesc='A cross-platform open-source make system'
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info' 'jsoncpp')
makedepends=('qt5-base' 'python-sphinx' 'emacs')
optdepends=('qt5-base: cmake-gui'
            'libxkbcommon-x11: cmake-gui')
install="${pkgname}.install"
source=("http://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}.tar.gz" 'kdelibs-4.14.11.patch' 'python-3.5.patch')
md5sums=('5febbd11bcaac854a27eebaf4a124be2'
         '1eeec67ab4bff6d92430d52acdbde142'
         'c172343ccd88551f8858de1c8806ab79')

prepare() {
  cd ${pkgname}-${pkgver}

# fix build of KDE4 applications with kdelibs 4.14.11 http://www.cmake.org/gitweb?p=cmake.git;a=commit;h=b9ec9392da21a3421e48c6961976060d872faffb
  patch -p1 -i ../kdelibs-4.14.11.patch

# fix detection of Python 3.5
  patch -p1 --no-backup-if-mismatch -i ../python-3.5.patch
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
