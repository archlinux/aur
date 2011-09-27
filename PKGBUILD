# $Id: PKGBUILD 137977 2011-09-13 15:26:07Z juergen $
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
pkgname=emacs-pretest
_pkgname=emacs
pkgver=24.0.90
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor -- pretest version"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'gtk2' 'hicolor-icon-theme' 'gconf' 'desktop-file-utils' 'alsa-lib')
provides=("emacs=$pkgver")
conflicts=("emacs" "emacs-nox" "emacs-bzr" "emacs-git" "emacs-cvs")
install=emacs.install
source=(ftp://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$pkgver.tar.gz emacs.desktop)
md5sums=('93a7963f38a30e65c1af96f591e416d9'
         '8af038d2ba4561271e935bb444ceb4e3')
sha256sums=('629ca66cfa529a783a9e372e010a8b8d8b3d65e1e5105ef94f1621a403b9cb83'
            'dba3652cdfd4193d264cf9ebafcef3e6be4af3f83bdf187d421f8e4c07f94b39')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --with-x-toolkit=gtk --with-xft
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1,ctags.emacs.1}.gz
  # fix all the 777 perms on directories
  find "$pkgdir"/usr/share/emacs/$pkgver -type d -exec chmod 755 {} \;
  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
  # fix perms on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games

  # fix  FS#9253
  mkdir -p "$pkgdir"/usr/share/pixmaps "$pkgdir"/usr/share/applications
  install -D -m644 "$srcdir"/$_pkgname.desktop   "$pkgdir"/usr/share/applications
  ln -s  ../emacs/$pkgver/etc/images/icons/hicolor/48x48/apps/emacs.png "$pkgdir"/usr/share/pixmaps/emacs-icon.png
}
