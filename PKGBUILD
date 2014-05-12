# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-pretest
_pkgname=emacs
pkgver=24.3.91
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor -- pretest version"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'hicolor-icon-theme' 'gconf' 'desktop-file-utils' 'alsa-lib' 'imagemagick' 'gnutls')
install=emacs.install
provides=("emacs==$pkgver")
conflicts=('emacs')
source=(ftp://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$pkgver.tar.xz{,.sig})
md5sums=('f14b1b0d56aac1da8abb37f30ab70dc3'
         'SKIP')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --with-x-toolkit=gtk3 --with-xft
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}
  # remove conflict with texinfo
  rm "$pkgdir"/usr/share/info/info.info.gz
  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
  # fix perms on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games
}
