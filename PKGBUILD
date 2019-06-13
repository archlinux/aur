# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-pretest
_pkgname=emacs
_pkgver=26.2.90
pkgver=$_pkgver
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor -- pretest version"
arch=('x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('gpm' 'm17n-lib' 'gtk3' 'libmagick6' 'gnutls')
provides=('emacs')
conflicts=('emacs')
source=(https://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$_pkgver.tar.xz{,.sig})
sha512sums=('66e53ae2a6d89505111e7bc9b7a6e6324a9a5577d1ad8905244dbc8619b21ea410b20bd8bab0442ec226f7a0d5f2292e01171189517736e4fa5e0e15eba51074'
            'SKIP')
validpgpkeys=('B29426DEFB07724C3C35E5D36592E9A3A0B0F199' '28D3BED851FDF3AB57FEF93C233587A47C207910')

build() {
  cd "$srcdir"/$_pkgname-$__pkgver

# Else imagemagick is not detected.
export PKG_CONFIG_PATH=/usr/lib/imagemagick6/pkgconfig

  local confopts=(
                  --prefix=/usr
                  --sysconfdir=/etc
                  --libexecdir=/usr/lib
                  --localstatedir=/var
                  --with-gameuser=root:games
                  --with-x-toolkit=gtk3
                  --with-xft
# Beware https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25228
# dconf and gconf break font settings set in ~/.emacs
# If you insist you'll need to play gymnastics with
# set-frame-font and set-menu-font. Good luck!
# Psst! Seems to be fixed in master. Try emacs-git.
                  --without-gsettings
                  --without-gconf
                  )
  ./configure "${confopts[@]}"
  make
}

package() {
  cd "$srcdir"/$_pkgname-$__pkgver
  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/ | xargs chown root:root
  # fix permssions on /var/games
  mkdir -p "$pkgdir"/var/games/emacs
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chown -R root:games "$pkgdir"/var/games
}

