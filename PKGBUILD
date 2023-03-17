# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-pretest
_pkgname=emacs
pkgver=28.3
_pkgver=28.3-rc1
pkgrel=0.1
pkgdesc="The extensible, customizable, self-documenting real-time display editor -- pretest version."
arch=('x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=(
  'gpm'
  'gtk3'
  'jansson'
  'giflib'
  'libotf'
  'libgccjit'
)
provides=('emacs' 'emacs-nativecomp')
conflicts=('emacs-nox')
# PGP keyservers are all but dead. PGP signatures are useless for all practical purpose. Kudos to the EU.
#source=(https://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$_pkgver.tar.xz{,.sig}) # PGP keyserver are all but dead.
#validpgpkeys=('28D3BED851FDF3AB57FEF93C233587A47C207910')
source=(https://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$_pkgver.tar.xz
        nemacs readme_or_weep.txt)
b2sums=('2d7da4a72cc1256c7b9d1157cd379a5373b6b55c01d94254d6aee25887991a8da694f3239a7f443adef0debbc300043ad4595b5934b6aa383daed10257bcbae0'
        '58e028b439d3c7cf03ea0be617b429a2c54e7aa1b8ca32b5ed489214daaa71e22c323de9662761ad2ce4de58e21dbe45ce6ce198f402686828574f8043d053d0'
        '98cb6458eebfa1440eea1318c6974c135d1b9e1a559fb1ca4bca35fb4697cc8cd6d33b19427efead0f3e061556ba19e774eee4f4566673494ac2470da4725b28')

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
    --with-libotf
    --without-imagemagick
# Beware https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25228
# dconf and gconf break font settings set in ~/.emacs
# If you insist you'll need to play gymnastics with
# set-frame-font and set-menu-font. Good luck!
# Might be fixed in master, but you can't be be too cautious. Try 
# emacs-git first.
    --without-gsettings
    --without-gconf
# Welcome to the JIT new world.
# To compile all extra site-lisp on demand (repos, AUR, ELPA, MELPA packages),
# add
#    (setq comp-deferred-compilation t)
# to your .emacs file.
    --with-native-compilation
)
  ./configure "${confopts[@]}"
  make
}

package() {
  cd "$srcdir"/$_pkgname-$_pkgver
  make DESTDIR="$pkgdir" install FULL_NATIVE_AOT=1

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  #mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1,ctags.emacs.1}

  install -D -m 755 "$srcdir"/nemacs "$pkgdir"/usr/bin/nemacs

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
