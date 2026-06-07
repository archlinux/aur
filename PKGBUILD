# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-pretest
_pkgname=emacs
pkgver=31.0
_pkgver=31.0.90
pkgrel=0.90
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
#
#    gpg --keyserver hkps://keys.openpgp.org --recv-keys 8DC2487E51ABDD90B5C4753F0F56D0553B6D411B
# 
validpgpkeys=('8DC2487E51ABDD90B5C4753F0F56D0553B6D411B')
#
source=(https://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$_pkgver.tar.xz{,.sig}
        nemacs)
b2sums=('cb7cf526a5e1efa2843af9e46b16953966a509457e88b87e3568bef9c39e4e05ae302fc880096d1b85e217f68f8cb1cbf4c5086c8387e08a382b76bd31793e6d'
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
# Support Wayland.
    --with-pgtk
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
# This will make emacsclient faster, so why not?
    --with-dbus
)
  ./configure "${confopts[@]}"
  make
}

package() {
  #cd "$srcdir"/$_pkgname-$_pkgver
  cd "$srcdir"/$_pkgname-${_pkgver%-rc1}

  make DESTDIR="$pkgdir" install

  # Emacs ctags is gone! I'm leaving this as historical reference.
  #
  # remove conflict with ctags package
  #mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  #mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}
  #mv "$pkgdir"/usr/share/man/man1/{ctags.1,ctags.emacs.1}

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
