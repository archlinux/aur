# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
pkgname=emacs-gtk2
_pkgname=emacs
pkgver=26.1
pkgrel=3
pkgdesc="The extensible, customizable, self-documenting real-time display editor"
arch=('x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk2'
         'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'libmagick6' 'gnutls')
conflicts=('emacs')
provides=('emacs')
validpgpkeys=('B29426DEFB07724C3C35E5D36592E9A3A0B0F199' '28D3BED851FDF3AB57FEF93C233587A47C207910')
source=(ftp://ftp.gnu.org/gnu/emacs/$_pkgname-$pkgver.tar.xz{,.sig}
        0001-Ignore-color-fonts-when-using-Xft.patch
        0001-Port-FC_COLOR-change-to-older-fontconfig.patch
        0001-src-ftfont.c-ftfont_spec_pattern-Fix-whitespace.patch)
sha256sums=('1cf4fc240cd77c25309d15e18593789c8dbfba5c2b44d8f77c886542300fd32c'
            'SKIP'
            '5bc53171bbb82e6dea26950f14da6a06f4371162b3bccb624397365e6e02f480'
            '6d16de2078108d742a8935044926f439869e231cc18ec23777bbed4857625f96'
            'ca48398d6a83e9a22a4117beca151f476e6286a9abbfddd0f7c0f187ebfc50d7')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -Np1 -i "$srcdir/0001-Ignore-color-fonts-when-using-Xft.patch"
    patch -Np1 -i "$srcdir/0001-Port-FC_COLOR-change-to-older-fontconfig.patch"
    patch -Np1 -i "$srcdir/0001-src-ftfont.c-ftfont_spec_pattern-Fix-whitespace.patch"
}

build() {
    cd "$_pkgname-$pkgver"
    PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" \
    ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure \
        --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
        --localstatedir=/var --with-x-toolkit=gtk2 --with-xft \
        --with-modules --without-gconf
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    # remove conflict with ctags package
    mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
    mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

    # fix user/root permissions on usr/share files
    find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
}
