# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-pretest
_pkgname=emacs
pkgver=27.0
_pkgver=27.0.90
pkgrel=0.90
pkgdesc="The extensible, customizable, self-documenting real-time display editor -- pretest version"
arch=('x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('gpm' 'm17n-lib' 'gtk3' 'imagemagick')
provides=('emacs')
conflicts=('emacs')
source=(https://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$_pkgver.tar.xz{,.sig})
sha512sums=('1a6f319e964f20ad35574eb2d2e18ae8c86d9d2ab9ae038334f0f468c40602d1f9b20880cfa704ea2067bdd7a3952ea3e6b565d5bb3d6d304922ad1d98c1c76b'
            'SKIP')
validpgpkeys=('B29426DEFB07724C3C35E5D36592E9A3A0B0F199' '28D3BED851FDF3AB57FEF93C233587A47C207910' 'D405AA2C862C54F17EEE6BE0E8BCD7866AFCF978')

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
                  --with-modules
                  --without-compress-install
# Beware https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25228
# dconf and gconf break font settings set in ~/.emacs
# If you insist you'll need to play gymnastics with
# set-frame-font and set-menu-font. Good luck!
# Might be fixed in master, but you can't be be too cautious. Try emacs-git first.
                  --without-gsettings
                  --without-gconf
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

