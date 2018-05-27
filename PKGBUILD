#
# Maintainer: Romain Gautier <romain.gautier at nimamoh dot net>
#
pkgname=emacs-xwidgets
pkgver=26.1_rc1
pkgrel=1

# custom variable. the underlying true pkgname
appname=emacs
appver=${pkgver::-4}

pkgdesc="Good old emacs with xwidgets support"
arch=('x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'webkit2gtk' 'hicolor-icon-theme' 'gconf' 'desktop-file-utils' 'alsa-lib' 'libmagick6' 'gnutls')
conflicts=('emacs')
provides=('emacs')
validpgpkeys=('B29426DEFB07724C3C35E5D36592E9A3A0B0F199' '28D3BED851FDF3AB57FEF93C233587A47C207910')
# ftp://alpha.gnu.org/gnu/emacs/pretest/
source=(ftp://alpha.gnu.org/gnu/emacs/pretest/$appname-${pkgver//_/-}.tar.xz{,.sig})
sha1sums=('8ba00629a1799c14e02c643e26bb9fa5009ae8fa'
         'SKIP')

build() {
  cd "$srcdir"/$appname-${appver}
  PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" \
  ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure \
                                    --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
                                    --localstatedir=/var --mandir=/usr/share/man \
                                    --with-gameuser=:games \
                                    --with-mailutils \
                                    --with-x-toolkit=gtk3 --with-xft \
                                    --with-xwidgets \
                                    --with-modules
  make
}

package() {
  cd "$srcdir"/$appname-${appver}
  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  # XXX: emacs stores using major version. Since we build a rc we have to strip things down
  find "$pkgdir"/usr/share/emacs/${appver} -exec chown root:root {} \;
  # fix perms on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games
}
