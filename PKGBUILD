# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Official Arch Linux package repository [gtk3 version] maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Official Arch Linux package repository [gtk3 version] contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

_pkgname=emacs
pkgname=$_pkgname-gtk2
pkgver=24.5
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor. GTK2 version"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk2' 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'imagemagick>=6.8.4.7')
install=emacs-gtk2.install
source=(ftp://ftp.gnu.org/gnu/emacs/$_pkgname-$pkgver.tar.xz)
sha256sums=(dd47d71dd2a526cf6b47cb49af793ec2e26af69a0951cc40e43ae290eacfc34e)
provides=('emacs')
conflicts=('emacs')

build() {
  cd "$srcdir"/emacs-$pkgver
  export ac_cv_lib_gif_EGifPutExtensionLast=yes
  ./configure --without-gif \
      --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
      --localstatedir=/var --with-x-toolkit=gtk2 --with-xft \
      --without-gconf
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  
  # fix file conflicts
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs} || true
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1} || true
  rm "$pkgdir"/usr/share/info/info.info.gz || true

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
  
  # fix perms on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games
}
