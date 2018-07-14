# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=extempore-git
pkgver=0.7.0.r390.g853a442a
pkgrel=1
pkgdesc="A cyber-physical programming environment for live coding"
arch=('i686' 'x86_64')
url="http://extempore.moso.com.au"
license=('BSD')
depends=('mesa' 'pcre' 'alsa-lib')
makedepends=('git' 'cmake' 'gcc' 'perl')
optdepends=('jack')
provides=('extempore')
conflicts=('extempore')
source=("git+https://github.com/digego/extempore.git"
        "fix-llvm-build.patch")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  git --git-dir="${srcdir}/extempore/.git" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/extempore"
  patch -p1 -i "${srcdir}/fix-llvm-build.patch"
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt \
        -DJACK=ON                   \
        -DBUILD_DEPS=ON             \
        -DPACKAGE=ON                \
        ../extempore

  make
  make assets
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install

  # emacs and vim files
  install -D "${srcdir}/extempore/extras/extempore.el" "${pkgdir}/usr/share/emacs/site-lisp/extempore/extempore.el"

  # NOTE: The vim file interferes with vim, overriding global bindings.
  # install -D "${srcdir}/extempore/extras/extempore.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/extempore.vim"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/extempore/extempore "${pkgdir}/usr/bin/extempore"
}


# vim:set ts=2 sw=2 et:
