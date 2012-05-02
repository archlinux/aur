# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
pkgname=emacs-pretest
_pkgname=emacs
pkgver=24.0.96
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
md5sums=('ff4c16f4cee4a97abfa4dd051c4c460b'
         '8af038d2ba4561271e935bb444ceb4e3')
sha256sums=('18ed15ff63cfa1ae929ccdb3a39cdc589420bd17dacc5af144c5eb717200f21a'
            'dba3652cdfd4193d264cf9ebafcef3e6be4af3f83bdf187d421f8e4c07f94b39')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --with-x-toolkit=gtk --with-xft
  # Alternatives: --with-x-toolkit=lucid, --with-x-toolkit=gtk3
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
