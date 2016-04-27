# See AUR interface for current maintainer.

#
# TIP: Don't run this on a tmpfs unless you have oodles of RAM.
#      When the official git repo started, the size was about
#      200MB. As time passes, it will grow more and more.
#

pkgname=emacs24-git
pkgver=24.5.50.r116792
pkgrel=7
pkgdesc="GNU Emacs. Official git stable 24 branch."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/"
license=('GPL')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 
	 'gtk3' 'hicolor-icon-theme' 'desktop-file-utils' 
	 'alsa-lib' 'imagemagick' 'gnutls')
makedepends=('git')
conflicts=('emacs')
provides=('emacs')
source=("$pkgname::git://git.savannah.gnu.org/emacs.git#branch=emacs-24")
#source=("$pkgname::git+http://git.savannah.gnu.org/r/emacs.git#branch=emacs-24")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s" \
    "$(grep AC_INIT configure.ac | sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\).\+$/\1/')" \
    "$(git rev-list --count HEAD)"
}


# There is no need to run autogen.sh after first checkout.
# Doing so, breaks incremental recompilation.
prepare() {
  cd "$srcdir/$pkgname"
  if ! [ -f configure ]; then 
    ./autogen.sh
  fi 
}

build() {
  cd "$srcdir/$pkgname"

  local _conf=(
    --prefix=/usr 
    --sysconfdir=/etc 
    --libexecdir=/usr/lib 
    --localstatedir=/var 
    --mandir=/usr/share/man 
    --pdfdir=/usr/share/doc/emacs/pdf 
    --with-sound=alsa 
    --without-gconf 
    --with-x-toolkit=gtk3 
    --with-xft)

  ac_cv_lib_gif_EGifPutExtensionLast=yes \
  ./configure ${_conf[@]}

  # Using "make" instead of "make bootstrap" makes incremental
  # compiling work. Less time recompiling. Yay! But if you may 
  # need to use bootstrap sometime, just add it below.
  make

  # You may need to run this if loaddefs.el files become
  # corrupt.
  #cd "$srcdir/$pkgname/lisp"
  #make autoloads

  # Before enabling "make docs" you need to install texlive, either from
  # the repos or locally while using texlive-dummy from AUR.
  #make docs
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install

  # Before enabling "make install-doc" you need to install texlive, either
  # from the repos or locally while using texlive-dummy from AUR.
  # make DESTDIR="$pkgdir/" install-doc

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1.gz}

  # remove conflict with texinfo
  rm "$pkgdir"/usr/share/info/info.info.gz

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/ | xargs chown root:root

  # fix permssions on /var/games
  mkdir -p "$pkgdir"/var/games/emacs
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chown -R root:games "$pkgdir"/var/games
}

# vim:set ft=sh ts=2 sw=2 et:
