# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-pretest
_pkgname=emacs
pkgver=24.4rc1
_pkgver=24.4
_rc=-rc1
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor -- pretest version"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'hicolor-icon-theme' 'gconf' 'desktop-file-utils' 'alsa-lib' 'imagemagick' 'gnutls')
install=emacs.install
provides=("emacs==$pkgver")
conflicts=('emacs')
source=(ftp://alpha.gnu.org/gnu/emacs/pretest/$_pkgname-$_pkgver$_rc.tar.xz{,.sig})
md5sums=('ad487658ad7421ad8d7b5152192eb945'
         'SKIP')
sha256sums=('47e391170db4ca0a3c724530c7050655f6d573a711956b4cd84693c194a9d4fd'
            'SKIP')

build() {
  cd "$srcdir"/$_pkgname-$_pkgver
  ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --with-x-toolkit=gtk3 --with-xft
  make
}

package() {
  cd "$srcdir"/$_pkgname-$_pkgver
  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}
  # remove conflict with texinfo
  rm "$pkgdir"/usr/share/info/info.info.gz
  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$_pkgver -exec chown root:root {} \;
  # fix perms on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games
}
