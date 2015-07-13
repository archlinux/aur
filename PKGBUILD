# Maintainer: Jonathan Kotta <jpkotta AT gmail DOT com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
# Based on emacs from [extra] and emacs-bzr from the AUR

pkgname=emacs-lucid
pkgver=24.5
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor (Lucid toolkit version)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'imagemagick' 'gnutls' 'libxaw')
install=emacs.install
conflicts=('emacs')
provides=('emacs')
source=(ftp://ftp.gnu.org/gnu/emacs/emacs-$pkgver.tar.xz)
md5sums=('50560ee00bac9bb9cf0e822764cd0832')

prepare() {
  cd "$srcdir"/emacs-$pkgver
}

build() {
  cd "$srcdir"/emacs-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --with-x-toolkit=lucid --with-xft --without-gconf --without-gsettings
  make
}

package() {
  cd "$srcdir"/emacs-$pkgver
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
