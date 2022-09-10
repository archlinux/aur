# Maintainer: Thaodan <me@thaodan.de>

_pkgname=libegit2
pkgname=emacs-${_pkgname}-wbundled-git
pkgver=r464.3f3d600
pkgrel=1
pkgdesc='Emacs bindings for libgit2 without bundled libgit2'
arch=('i686' 'x86_64')
url="https://github.com/magit/libegit2"
license=('GPL3')
conflicts=("${_pkgname}-git" "${_pkgname}" "emacs-${_pkgname}" "emacs-${_pkgname}-git")
provides=("${_pkgname}" "emacs-${_pkgname}")
makedepends=('cmake' 'git' 'libgit2')
depends=('emacs')
source=("git+${url}.git"
       'https://patch-diff.githubusercontent.com/raw/magit/libegit2/pull/96.patch')
sha256sums=('SKIP'
            '447be7ec0b603cd260d4b612692280430e11ccf0a644db204a999a01eabe6908')


pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  patch -p1 -i "$srcdir"/96.patch

  # Patch libgit.el to find libegit.so
  sed -e 's|(expand-file-name "build" libgit--root)|\"/usr/lib/emacs/site-lisp\"|'  \
      -i libgit.el

  mkdir -p build
}

build() {
  cd "${_pkgname}"/build
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_SYSTEM_LIBGIT2=ON \
        -S "${srcdir}/${_pkgname}"
  make

  cd "${srcdir}/${_pkgname}"
  make "$MAKEFLAGS" loaddefs libgit.elc

 # emacs -batch -f batch-byte-compile *.el
}

package() {
  depends+=('libgit2.so')
  cd "${_pkgname}"

  install -dm755 "$pkgdir"/usr/lib/emacs/site-lisp
  install -Dm755 build/libegit2.so \
          "$pkgdir"/usr/lib/emacs/site-lisp/libegit2.so

  install -dm755 "$pkgdir"/usr/share/emacs/site-lisp
  install -Dm755 libgit.el{,c} libgit-autoloads.el\
          "$pkgdir"/usr/share/emacs/site-lisp


}

# vim:set ts=2 sw=2 et:
