# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-lucid-git
pkgver=25.0.50.r122133
pkgrel=1
pkgdesc="GNU Emacs. Official git trunk."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/"
license=('GPL')
depends=('alsa-lib' 'gpm' 'desktop-file-utils' 'hicolor-icon-theme' 'giflib'
	 'libxfixes' 'm17n-lib' 'libxrandr' 'libxinerama'  'libdbus'
	 'imagemagick'  'librsvg' 'gnutls')
makedepends=('git')
conflicts=('emacs')
provides=('emacs')
options=('docs' '!emptydirs' '!makeflags')
install=emacs.install
source=("$pkgname::git://git.savannah.gnu.org/emacs.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s" \
    "$(grep AC_INIT configure.ac | sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\).\+$/\1/')" \
    "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh                                                            
  ac_cv_lib_gif_EGifPutExtensionLast=yes \
    ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-x-toolkit=lucid \
    --mandir=/usr/share/man \
    --pdfdir=/usr/share/doc/emacs/pdf \
    --with-sound \
    --without-gconf \
    --with-xft 
  make bootstrap
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1.gz}
  # remove conflict with texinfo
  rm "$pkgdir"/usr/share/info/info.info.gz
  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/ -exec chown root:root {} \;
  # Delete compressed .el.gz files. Comment out if needed.
  find "$pkgdir"/usr/share/emacs/ -name "*.el.gz" -exec rm {} \;
  # fix perms on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games
}

