# Maintainer: mrdotx <klassiker@gmx.de>
_pkgname=rxvt-unicode
pkgname=rxvt-unicode-truecolor-wide-glyphs
pkgver=9.26
pkgrel=2
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with true color, enhanced glyphs and improved font rendering support'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=(
    'libxft'
    'libxt'
    'perl'
    'startup-notification'
)
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=(
    'rxvt-unicode'
    'rxvt-unicode-terminfo'
    'urxvt-resize-font'
    'urxvt-keyboard-select'
)
conflicts=(
    'rxvt-unicode'
    'rxvt-unicode-terminfo'
    'urxvt-resize-font'
    'urxvt-perls'
    'urxvt-perls-git'
)
source=(
    http://dist.schmorp.de/rxvt-unicode/Attic/$_pkgname-$pkgver.tar.bz2
    'urxvt.desktop'
    'urxvtc.desktop'
    'urxvt-tabbed.desktop'
    'resize-font'
    'keyboard-select'
    '24-bit-color.patch'
    'enable-wide-glyphs.patch'
    'improve-font-rendering.patch'
)
sha1sums=('d325d8cdea6bcb8e0b8b219b8451bf5c690b6c62'
          'b5a4507f85ebb7bac589db2e07d9bc40106720d9'
          '62c4ffecfce6967def394dd4d418b68652372ea2'
          'cd204d608d114d39c80331efe0af0231ad6b7e18'
          'a61366659c73bd551fa99a8415bb71e033897598'
          '9883d0c31b45f8521829ea6a2041f2e9eb7abe6a'
          '560097c0d6377461fcbe4c109f3113a6bcb38982'
          'c5ee4a50902d8c8d278938b080464a16d2c6af56'
          '772b62071d73c0021adf334f037b95ef13d34317')

prepare() {
    cd $_pkgname-$pkgver

    # The repo with original 24-bit-color.patch is no longer available:
    # https://gist.githubusercontent.com/dan-santana/63271adf12171e0fc0bc/raw/70c6343d1c0b3bca0aba4f587ed501e6cbd98d00/24-bit-color.patch
    # I have rewritten the patch to work with version 9.26.
    # If someone has a better solution, please contact me!
    patch -p0 -i ../24-bit-color.patch

    # If you have problems with character rendering, try installing libxft-bgra from aur.
    # https://aur.archlinux.org/packages/rxvt-unicode-cvs-patched-wideglyphs
    patch -p0 -i ../enable-wide-glyphs.patch

    # https://aur.archlinux.org/packages/rxvt-unicode-improve-font-rendering
    patch -p0 -i ../improve-font-rendering.patch
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

    # install perl script resize-font (https://github.com/simmel/urxvt-resize-font)
    install -Dm 644 resize-font "$pkgdir/usr/lib/urxvt/perl/resize-font"

    # install perl script keyboard-select (https://github.com/muennich/urxvt-perls)
    install -Dm 644 keyboard-select "$pkgdir/usr/lib/urxvt/perl/keyboard-select"

    cd $_pkgname-$pkgver

    # install terminfo
    export TERMINFO="$pkgdir/usr/share/terminfo"
    install -dm 755 "$TERMINFO"

    make DESTDIR="$pkgdir" install

    # install the tabbing wrapper (requires gtk2-perl)
    sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
    install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}
