# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-lucid-git
pkgver=30.0.50.167230
pkgrel=1
pkgdesc="GNU Emacs. Official git master."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/"
license=('GPL')
depends=('alsa-lib' 'gpm' 'hicolor-icon-theme' 'libxrandr' 'lcms2' 'libxi'
	 'libxinerama' 'librsvg' 'gnutls' 'xaw3d' 'libdbus' 'libxfixes'
	 'jansson' 'desktop-file-utils' 'libsm' 'xcb-util' 'libxcb' 'libxpm'
	 'tree-sitter' 'sqlite' 'libgccjit' 'giflib' 'acl' 'libwebp'
	 'attr' 'libxcomposite' 'gcc-libs')
makedepends=('git' 'texlive-basic')
conflicts=('emacs' 'emacs-seq')
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
    --with-tree-sitter \
    --without-m17n-flt \
    --without-libotf \
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
