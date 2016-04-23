# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-pretest
_pkgname=emacs
pkgver=25.0.93
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor -- pretest version"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('gtk3' 'gpm' 'giflib' 'm17n-lib' 'desktop-file-utils' 'alsa-lib' 'imagemagick' 'zlib')
install=$pkgname.install
provides=('emacs')
conflicts=('emacs')
source=(ftp://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$pkgver.tar.xz{,.sig})
sha384sums=('b2fc25d2018573161bd2745d568189b276109c0d1eeec275093be19a0cffce0cfc6db045bac9bb8a4c80c0ab4e825abb'
            'SKIP')
validpgkkeys=('28D3BED851FDF3AB57FEF93C233587A47C207910')

build() {
  cd "$srcdir"/$_pkgname-$pkgver

  local confopts=(--prefix=/usr 
                  --sysconfdir=/etc 
                  --libexecdir=/usr/lib 
                  --localstatedir=/var 
                  --without-gconf
                  --with-sound=alsa
                  --with-x-toolkit=gtk3
                  --with-game-user=:games
                  --with-modules)
  ./configure "${confopts[@]}"
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1.gz}

  # remove conflict with texinfo
  rm "$pkgdir"/usr/share/info/info.info.gz

  # fix ownership on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;

  # fix access permissions on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games
}
