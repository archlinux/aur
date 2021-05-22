# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=extempore-git
pkgver=v0.8.9.r0.g0368489b
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
source=("git+https://github.com/digego/extempore.git")
sha256sums=('SKIP')

pkgver() {
  git --git-dir="${srcdir}/extempore/.git" describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # I was unable to compile portaudio with jack backend
  cd "${srcdir}/extempore"
  patch -p0 < ../../disable_jack.patch
}

build() {  
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  # NOTE: set ASSETS to OFF you you don't want to download ~500MB of assets
  # NOTE: building with debug symbols for easy reporting of bugs
  cmake -DCMAKE_INSTALL_PREFIX=/opt/${pkgname} \
        -DBUILD_DEPS=ON             	       \
        -DPACKAGE=ON                	       \
        -DJACK=OFF                           \
        -DCMAKE_BUILD_TYPE=Debug   \
        ../extempore

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install

  # NOTE: emacs extempore-mode was moved, left here because someone upgrading might get the message
  install -D "${srcdir}/extempore/extras/extempore.el" "${pkgdir}/usr/share/emacs/site-lisp/extempore/extempore.el"

  # NOTE: The vim file interferes with vim, overriding global bindings.
  # install -D "${srcdir}/extempore/extras/extempore.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/extempore.vim"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/extempore" "${pkgdir}/usr/bin/extempore"
}


# vim:set ts=2 sw=2 et:
