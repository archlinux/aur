# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-pretest
_pkgname=emacs
pkgver=28.0
_pkgver=28.0.91
pkgrel=0.91
pkgdesc="The extensible, customizable, self-documenting real-time display editor -- pretest version"
arch=('x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=(
  'gpm'
  'gtk3'
  'jansson'
  'giflib'
  'libgccjit'
)
provides=('emacs')
conflicts=('emacs')
# PGP keyservers are all but dead. PGP signatures are useless for all practical purpose. Kudos to the EU.
#source=(https://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$_pkgver.tar.xz{,.sig}) # PGP keyserver are all but dead.
#validpgpkeys=('28D3BED851FDF3AB57FEF93C233587A47C207910')
source=(https://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$_pkgver.tar.xz)
b2sums=('94cfd907cb602ab698ffaa5c29aa1db2ff1b8538e1d6a0e20aa72ac1cb77e3c07759cf28cbe47027b155a08ce305c9c6ae01a6b82eb3468b2f4d4b49d51a3430')

build() {
  cd "$srcdir"/$_pkgname-$_pkgver

  local confopts=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib
    --localstatedir=/var
    --with-gameuser=root:games
    --with-x-toolkit=gtk3
    --with-xft
    --with-harfbuzz
    --with-modules
    --without-compress-install
    --without-m17n-flt
    --without-libotf
    --without-imagemagick
# Beware https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25228
# dconf and gconf break font settings set in ~/.emacs
# If you insist you'll need to play gymnastics with
# set-frame-font and set-menu-font. Good luck!
# Might be fixed in master, but you can't be be too cautious. Try emacs-git first.
    --without-gsettings
    --without-gconf
# Welcome to the new world.
    --with-native-compilation
)
  ./configure "${confopts[@]}"
  make
}

package() {
  cd "$srcdir"/$_pkgname-$_pkgver
  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  #mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/ | xargs chown root:root
  # fix permssions on /var/games
  mkdir -p "$pkgdir"/var/games/emacs
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chown -R root:games "$pkgdir"/var/games
}


################################################################################
# vim:set ft=bash ts=2 sw=2 et:
