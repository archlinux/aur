# Maintainer: mrdotx <klassiker@gmx.de>
_pkgname=rxvt-unicode
pkgname=rxvt-unicode-truecolor-wide-glyphs
pkgver=9.22
pkgrel=1
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with truecolor and wide glyphs support'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('libxft' 'perl' 'startup-notification')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=('rxvt-unicode' 'rxvt-unicode-terminfo')
conflicts=('rxvt-unicode' 'rxvt-unicode-terminfo')
source=(http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2
    'urxvt.desktop'
    'urxvtc.desktop'
    'urxvt-tabbed.desktop'
    'resize-font'
    'sgr-mouse-mode.patch'
    '24-bit-color.patch'
    'enable-wide-glyphs.patch'
    'improve-font-rendering.patch'
    'perl-segfault.patch'
    )
sha1sums=('e575b869782fbfed955f84f48b204ec888d91ba1'
          'b5a4507f85ebb7bac589db2e07d9bc40106720d9'
          '62c4ffecfce6967def394dd4d418b68652372ea2'
          'cd204d608d114d39c80331efe0af0231ad6b7e18'
          'a61366659c73bd551fa99a8415bb71e033897598'
          'dfbc8729c545105eff21e20ef3a4a3841a68a192'
          '9f5db305863b17175e72f9e2d4a78d0d7f25fd34'
          'd9f3b52b273d13fbd4089a7869ab2e70bf190bc9'
          '2f976cfbb4ae092d331e169b56ec6423b198f462'
          '361f4649596342d07311c2590b809b85b3a918ee')

prepare() {
    cd $_pkgname-$pkgver

    # https://aur.archlinux.org/packages/rxvt-unicode-patched
    patch -p0 -i ../sgr-mouse-mode.patch

    # https://aur.archlinux.org/packages/rxvt-unicode-truecolor
    patch -p0 -i ../24-bit-color.patch

    # https://aur.archlinux.org/packages/rxvt-unicode-cvs-patched-wideglyphs
    patch -p1 -i ../enable-wide-glyphs.patch

    # https://aur.archlinux.org/packages/rxvt-unicode-improve-font-rendering
    patch -p1 -i ../improve-font-rendering.patch

    # https://bugs.archlinux.org/task/67691
    patch -p1 -i ../perl-segfault.patch
}

build() {
    cd $_pkgname-$pkgver

    # do not specify --with-terminfo (FS#46424)
    ./configure \
        --prefix=/usr \
        --enable-24-bit-color \
        --enable-256-color \
        --enable-combining \
        --disable-fading \
        --disable-fallback \
        --enable-font-styles \
        --enable-frills \
        --disable-iso14755 \
        --disable-keepscrolling \
        --enable-lastlog \
        --enable-mousewheel \
        --disable-next-scroll \
        --enable-perl \
        --disable-pixbuf \
        --enable-pointer-blank \
        --disable-rxvt-scroll \
        --enable-selectionscrolling \
        --disable-slipwheeling \
        --disable-smart-resize \
        --disable-startup-notification \
        --enable-text-blink \
        --enable-transparency \
        --enable-unicode3 \
        --enable-utmp \
        --enable-wide-glyphs \
        --enable-wtmp \
        --enable-xft \
        --enable-xim \
        --disable-xterm-scroll
    make
}

package() {
    # install freedesktop menu
    for _f in urxvt urxvtc urxvt-tabbed; do
        install -Dm 644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
    done

    # install perl script resize-font
    install -Dm 644 resize-font "$pkgdir/usr/lib/urxvt/perl/resize-font"

    cd $_pkgname-$pkgver

    # install terminfo
    export TERMINFO="$pkgdir/usr/share/terminfo"
    install -dm 755 "$TERMINFO"

    make DESTDIR="$pkgdir" install

    # install the tabbing wrapper (requires gtk2-perl)
    sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
    install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}
