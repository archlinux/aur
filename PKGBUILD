# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-lucid-git
pkgver=27.0.50.r136622
pkgrel=1
pkgdesc="GNU Emacs. Official git master."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/"
license=('GPL')
depends=('alsa-lib' 'gpm' 'hicolor-icon-theme' 'm17n-lib' 'libxrandr'
	 'libxinerama' 'librsvg' 'gnutls' 'xaw3d' 'libdbus' 'libxfixes'
	 'jansson' 'libmagick' 'desktop-file-utils')
makedepends=('git' 'texlive-core')
conflicts=('emacs')
options=('docs' '!emptydirs')
provides=('emacs' 'emacs-seq')
source=("git://git.savannah.gnu.org/emacs.git")
sha256sums=('SKIP')

pkgver() {
  cd emacs
  _mainver=$(grep AC_INIT configure.ac | sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\).\+$/\1/')
  printf "%s.r%s" "$(echo $_mainver)" "$(git rev-list --count HEAD)"
}
  
build() {
  cd emacs
  [[ -x configure ]] || ( ./autogen.sh git && ./autogen.sh autoconf )
  ac_cv_lib_gif_EGifPutExtensionLast=yes PKG_CONFIG_PATH="/usr/lib/imagemagick/pkgconfig" \
    ./configure --program-transform-name='s/^ctags$/ctags.emacs/' \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/usr/share \
    --with-x-toolkit=lucid \
    --mandir=/usr/share/man \
    --pdfdir=/usr/share/doc/emacs \
    --with-modules \
    --with-xft \
    --without-gconf \
    --without-gsettings \
    --with-imagemagick \
    --without-xwidgets \
    --without-pop \
    --with-gameuser=:games \
    --disable-build-details
  make
  make pdf
}

package() {
  cd emacs
  _mainver=$(grep AC_INIT configure.ac | sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\).\+$/\1/')
  make DESTDIR="$pkgdir/" install install-pdf
  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/ -exec chown root:root {} \;
  # Delete compressed .el.gz files. Comment out if needed.
  # find "$pkgdir"/usr/share/emacs/ -name "*.el.gz" -exec rm {} \;
  chmod g+w "$pkgdir"/usr/share/games
  chmod 775 "$pkgdir"/usr/lib/emacs/*/*/update-game-score
}
