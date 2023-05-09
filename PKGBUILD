# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-pretest
_pkgname=emacs
pkgver=29.0
_pkgver=29.0.91
pkgrel=0.91
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
#
# You'll need to grab this key and add it BY HAND to your local keyring.
# All PGP Keyservers are all but dead thanks to the EU. 
#
#    gpg --keyserver hkps://keys.openpgp.org --recv-keys 17E90D521672C04631B1183EE78DAE0F3115E06B
# 
validpgpkeys=('17E90D521672C04631B1183EE78DAE0F3115E06B')
#
# Hmmm.... As of today. 2023-04-10, the alpha.gnu.org server has no HTTPS service.
#
source=(http://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$_pkgver.tar.xz{,.sig}
        nemacs readme_or_weep.txt)
b2sums=('363c6ce29e04fca383b803fc9b7eced8966ee428fd18dd8a5199720e7b2d0b794328b0184cd6be9452f99989a16e23a3bfc48aabf644fa461a3d17d0d3a18fe1'
        'SKIP'
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
    --with-native-compilation=aot
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
