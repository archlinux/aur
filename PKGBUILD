# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-pretest
_pkgname=emacs
pkgver=25.0.91
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor -- pretest version"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'hicolor-icon-theme' 'gconf' 'desktop-file-utils' 'alsa-lib' 'imagemagick' 'gnutls')
install=$pkgname.install
provides=('emacs')
conflicts=('emacs')
source=(ftp://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$pkgver$_rc.tar.xz{,.sig})
whirlpoolsums=('2d136d7f0e814d5dcffed614d850c03d3653f53a9d1d8e3aa4f7d94f2bc91e528ff63efd2376f42e91285770558fa1ddf375a570618b6fdb2b3fd9a64423b2ad'
               'SKIP')
validpgkkeys=('28D3BED851FDF3AB57FEF93C233587A47C207910')

build() {
  cd "$srcdir"/$_pkgname-$pkgver

  local confopts=(--prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib
    --localstatedir=/var --with-x-toolkit=gtk3 --with-xft)
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
