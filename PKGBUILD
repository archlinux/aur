# Maintainer: Jáchym Tomášek <jachym.tomasek@tutanota.com>

pkgname=emacs-xwidgets
pkgver=27.1
pkgrel=2
pkgdesc="The extensible, customizable, self-documenting real-time display editor with xwidgets support"
arch=('x86_64')
url="https://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'webkit2gtk' 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'gnutls' 'jansson')
source=(https://ftp.gnu.org/gnu/emacs/emacs-$pkgver.tar.xz)
sha1sums=('SKIP')
conflicts=('emacs')
provides=('emacs')

build() {
  cd "$srcdir"/emacs-$pkgver
  ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
                                    --localstatedir=/var --with-x-toolkit=gtk3 --with-xft --with-wide-int \
                                    --with-modules --with-xwidgets
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
}
