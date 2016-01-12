# $Id$
# Contributor: Christian Hopps <chopps@gmail.com>
#
# To enable 24 bit color in the terminal one must define the environment
# variable ITERM_24BIT=1 or KONSOLE_DBUS_SESSION=1
#
# Derived from standard emacs PKGBUILD

pkgname=emacs-24bit
pkgver=24.5
pkgrel=2
pkgdesc="The extensible, customizable, self-documenting real-time display editor"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'gmime' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'hicolor-icon-theme' 'gconf' 'desktop-file-utils' 'alsa-lib' 'imagemagick' 'gnutls')
install=emacs.install
validpgpkeys=('BE216115' 'B29426DEFB07724C3C35E5D36592E9A3A0B0F199' '28D3BED851FDF3AB57FEF93C233587A47C207910')
source=(ftp://ftp.gnu.org/gnu/emacs/emacs-$pkgver.tar.xz{,.sig}
        https://gist.githubusercontent.com/choppsv1/e8198df70cb1778b04d6/raw/99b9c436c5b7dc96f2d4645b7b2cdeec614f7698/emacs-24.5-24bit.diff)
md5sums=('50560ee00bac9bb9cf0e822764cd0832'
         'SKIP'
         '426a9b2993fe0f834cd2740987d67dfe')
conflicts=(emacs)

prepare() {
        cd "$srcdir/emacs-${pkgver/_/}"
        patch -Np1 -i ../emacs-24.5-24bit.diff
}

build() {
  cd "$srcdir"/emacs-$pkgver
  ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --with-x-toolkit=gtk3 --with-xft
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
