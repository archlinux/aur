# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-lucid-git
pkgver=26.0.50.r128272
pkgrel=1
pkgdesc="GNU Emacs. Official git master."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/"
license=('GPL')
depends=('alsa-lib' 'gpm' 'hicolor-icon-theme' 'm17n-lib'
	 'libxrandr' 'libxinerama' 'imagemagick' 'librsvg'
	 'gnutls' 'xaw3d' 'libdbus' 'libxfixes')
makedepends=('git' 'texlive-core')
conflicts=('emacs')
options=('docs' '!emptydirs' '!makeflags')
provides=('emacs')
source=("git://git.savannah.gnu.org/emacs.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/emacs"
  _mainver=$(grep AC_INIT configure.ac | sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\).\+$/\1/')
  printf "%s.r%s" "$(echo $_mainver)" "$(git rev-list --count HEAD)"
}

prepare() {
  sed -i 's+SYSTEM_PURESIZE_EXTRA 0+SYSTEM_PURESIZE_EXTRA 512000+' emacs/src/puresize.h
}

build() {
  cd "$srcdir/emacs"
  ./autogen.sh                                                            
  ac_cv_lib_gif_EGifPutExtensionLast=yes \
    ./configure --program-transform-name='s/^ctags$/ctags.emacs/' \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-x-toolkit=lucid \
    --mandir=/usr/share/man \
    --pdfdir=/usr/share/doc/emacs \
    --with-sound \
    --without-gconf \
    --with-xft \
    --without-xwidgets \
    --with-gameuser=:games 
  make
  make pdf
}

package() {
  cd "$srcdir/emacs"
  _mainver=$(grep AC_INIT configure.ac | sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\).\+$/\1/')
  make DESTDIR="$pkgdir/" install install-pdf
  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/ -exec chown root:root {} \;
  # Delete compressed .el.gz files. Comment out if needed.
  # find "$pkgdir"/usr/share/emacs/ -name "*.el.gz" -exec rm {} \;
  chmod g+w "$pkgdir"/var/games
    # The logic used to install systemd's user service is partially broken
  # under Arch Linux model, because it adds $DESTDIR as prefix to the 
  # final Exec targets. The fix is to hack it with an axe.
  install -Dm644 etc/emacs.service "$pkgdir"/usr/lib/systemd/user/emacs.service
  sed -i -e 's#\(ExecStart\=\)#\1\/usr\/bin\/#' -e 's#\(ExecStop\=\)#\1\/usr\/bin\/#' \
    "$pkgdir"/usr/lib/systemd/user/emacs.service
}
