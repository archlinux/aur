# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-lucid-git
pkgver=30.0.50.166064
pkgrel=1
pkgdesc="GNU Emacs. Official git master."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/"
license=('GPL')
depends=('alsa-lib' 'gpm' 'hicolor-icon-theme' 'libxrandr'
	 'libxinerama' 'librsvg' 'gnutls' 'xaw3d' 'libdbus' 'libxfixes'
	 'jansson' 'desktop-file-utils')
makedepends=('git' 'texlive-core')
conflicts=('emacs')
options=('docs' '!emptydirs')
provides=('emacs' 'emacs-seq')
source=("emacs-git::git+https://git.savannah.gnu.org/git/emacs.git")
sha256sums=('SKIP')

pkgver() {
  cd emacs-git
  printf "%s.%s" \
    $(grep AC_INIT configure.ac | \
    awk -F',' '{ gsub("[ \\[\\]]","",$2); print $2 }') \
    $(git rev-list --count HEAD)
}

prepare() {
  cd emacs-git/lisp/org
  sed -i -e 's/org-assert-version/org-assert-version-old/g' *.el
}

build() {
  cd emacs-git
  [[ -x configure ]] || ( ./autogen.sh git && ./autogen.sh autoconf )
    ./configure --program-transform-name='s/^ctags$/ctags.emacs/' \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/usr/share \
    --with-x-toolkit=lucid \
    --mandir=/usr/share/man \
    --pdfdir=/usr/share/doc/emacs \
    --with-modules \
    --with-cairo \
    --without-xft \
    --without-gconf \
    --without-gsettings \
    --without-imagemagick \
    --without-xwidgets \
    --without-pop \
    --with-sqlite3 \
    --with-gameuser=:games \
    --with-native-compilation \
    --disable-build-details
    make 
    make pdf
}

package() {
  cd emacs-git
  _mainver=$(grep AC_INIT configure.ac | sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\).\+$/\1/')
  make DESTDIR="$pkgdir/" install install-pdf
  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/ -exec chown root:root {} \;
  # Delete compressed .el.gz files. Comment out if needed.
  # find "$pkgdir"/usr/share/emacs/ -name "*.el.gz" -exec rm {} \;
  chmod g+w "$pkgdir"/usr/share/games
  chmod 775 "$pkgdir"/usr/lib/emacs/*/*/update-game-score
}
