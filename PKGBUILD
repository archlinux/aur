# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Maintainer: alienzj <alienchuj@gmail.com>
# Maintainer: Steven Tang <xosdy.t@gmail.com>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

_basename=emacs-ng
pkgname=${_basename}-git
pkgver=28.0.5
pkgrel=1
pkgdesc="A new approach to Emacs - Including TypeScript, Threading, Async I/O, and WebRender"
arch=('x86_64')
url="https://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('texinfo' 'libjpeg-turbo' 'libtiff' 'librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'gnutls' 'jansson' 'cairo' 'harfbuzz' 'ncurses' 'libxml2' 'libxt' 'rustup' 'zlib' 'libgccjit')
provides=(${_basename}=${pkgver})
conflicts=("emacs" "emacs-ng")
source=("emacs-ng::git+https://github.com/emacs-ng/emacs-ng.git")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${_basename}"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --with-x-toolkit=gtk3 \
              --with-xft \
              --with-wide-int \
              --with-modules \
              --with-cairo \
              --with-harfbuzz \
              --with-nativecomp \
              --with-webrender
  make -j8
}

package() {
  cd "${srcdir}/${_basename}"
  make DESTDIR="${pkgdir}/" install

  # remove conflict with ctags package
  mv "${pkgdir}/usr/bin/ctags" "${pkgdir}/usr/bin/ctags.emacs"
  mv "${pkgdir}/usr/share/man/man1/ctags.1.gz" "${pkgdir}/usr/share/man/man1/ctags.emacs.1"
  
  # fix user/root permissions on usr/share files
  find "${pkgdir}/usr/share/emacs/${pkgver}" -exec chown root:root {} \;
}
