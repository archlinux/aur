# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-xwidget-git
pkgver=25.1.50.r125750
pkgrel=1
pkgdesc="The famous editor from xwidget_mvp branch"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/"
license=('GPL3')
depends=('alsa-lib' 'gpm' 'desktop-file-utils' 'hicolor-icon-theme'
	 'webkitgtk' 'gobject-introspection-runtime' 'libxrandr'
	 'libxinerama' 'm17n-lib' 'imagemagick' 'librsvg' 'gconf'
	 'atk' 'libxcomposite')
makedepends=('git' 'texinfo' 'glproto')
options=('docs' '!emptydirs' '!makeflags')
provides=('emacs')
conflicts=('emacs')
install=emacs.install
source=("git://git.savannah.gnu.org/emacs.git")
md5sums=('SKIP')
_gitname="emacs"

pkgver() {
  cd "$srcdir/$_gitname"
  _mainver=$(grep AC_INIT configure.ac | sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\).\+$/\1/')
  printf "%s.r%s" "$(echo $_mainver)" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir"/"$_gitname"
  ./autogen.sh
  LDFLAGS="`pkg-config --libs MagickWand `" \
	 ac_cv_lib_gif_EGifPutExtensionLast=yes \
	 ./configure \
	 --prefix=/usr \
	 --sysconfdir=/etc \
	 --libexecdir=/usr/lib \
	 --localstatedir=/var \
	 --with-x-toolkit=gtk3 \
	 --with-sound \
	 --with-xwidgets \
	 --with-rsvg \
	 --with-gconf
  make 
}

package() {
  cd "$srcdir"/"$_gitname"
  _mainver=$(grep AC_INIT configure.ac | sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\).\+$/\1/')
  make DESTDIR=$pkgdir install
  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1.gz}
  # remove conflict with the texinfo-package
  rm $pkgdir/usr/share/info/info.info.gz
  # Delete uncompressed .el.gz files. Comment out if needed.
  find "$pkgdir"/usr/share/emacs/ -name "*.el.gz" -exec rm {} \;
  # Adjust permissions
  find "${pkgdir}"/usr/share/emacs -type d -exec chmod 755 {} \;
  find "${pkgdir}"/usr/share/emacs -exec chown root.root {} \;
  # fix perms on /var/games
  chgrp -R games "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
}
