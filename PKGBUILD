# $Id$
# Maintainer: Christian Hopps <chopps@gmail.com>
# Contributor: Christian Hopps <chopps@gmail.com>
#
# To enable 24 bit color in the terminal one must define the environment
# variable ITERM_24BIT=1 or KONSOLE_DBUS_SESSION=1
#
# Derived from standard emacs PKGBUILD

pkgname=emacs-24bit
pkgver=25.3
pkgrel=4
pkgdesc="The extensible, customizable, self-documenting real-time display editor"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'hicolor-icon-theme' 'gconf' 'desktop-file-utils' 'alsa-lib' 'libmagick6' 'gnutls')
validpgpkeys=('B29426DEFB07724C3C35E5D36592E9A3A0B0F199' '28D3BED851FDF3AB57FEF93C233587A47C207910')
source=(ftp://ftp.gnu.org/gnu/emacs/emacs-$pkgver.tar.xz{,.sig}
        https://gist.githubusercontent.com/choppsv1/3364fd6658ef498b5e06151217187017/raw/b9ba9e9000685abecf7ad954050b182eaef823e1/emacs-25.1-24bit.diff)
sha1sums=('1cb4f39e9c0a3305fd62f936c7c95ff8e2924323'
          'SKIP'
          '3cdc4c178bf0f79042709ff32a472359d82b109e')
provides=('emacs=25.3')
conflicts=(emacs emacs-nox)

prepare() {
        cd "$srcdir/emacs-${pkgver/_/}"
        patch -Np1 -i ../emacs-25.1-24bit.diff
}

build() {
  cd "$srcdir"/emacs-$pkgver
  PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" \
  ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --with-x-toolkit=gtk3 --with-xft \
    --with-modules
  make
}

package() {
  cd "$srcdir"/emacs-$pkgver
  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
  # fix perms on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games
}
