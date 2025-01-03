# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-pretest
_pkgname=emacs
pkgver=30.0
_pkgver=30.0.93
pkgrel=0.93
pkgdesc="The extensible, customizable, self-documenting real-time display editor. Pretest version"
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
  'tree-sitter'
)
provides=('emacs' 'emacs-nativecomp')
conflicts=('emacs-nox')
#
# You'll need to grab this key and add it BY HAND to your local keyring.
# All PGP Keyservers are all but dead thanks to the EU. 
#
#    gpg --keyserver hkps://keys.openpgp.org --recv-keys 12BB9B400EE3F77282864D18272B5C54E015416A
# 
validpgpkeys=('12BB9B400EE3F77282864D18272B5C54E015416A')
#
source=(https://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$_pkgver.tar.xz{,.sig}
        nemacs)
b2sums=('5c9a48eae9beaaa1a2ab2c4f3d4e3c4d1f4d71c180c07dfe1569df79d750479f7d96bbb6786608a2da748de89fdbd870b25ef04d27fec2c8f0642be76b945dc2'
        'SKIP'
        '58e028b439d3c7cf03ea0be617b429a2c54e7aa1b8ca32b5ed489214daaa71e22c323de9662761ad2ce4de58e21dbe45ce6ce198f402686828574f8043d053d0')

build() {
  #cd "$srcdir"/$_pkgname-$_pkgver
  cd "$srcdir"/$_pkgname-${_pkgver%-rc1}

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
    --with-native-compilation=aot
# welcome to the new syntax highlighting world.
    --with-tree-sitter
)
  ./configure "${confopts[@]}"
  make
}

package() {
  #cd "$srcdir"/$_pkgname-$_pkgver
  cd "$srcdir"/$_pkgname-${_pkgver%-rc1}

  make DESTDIR="$pkgdir" install

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
