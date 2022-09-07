# Maintainer: mrdotx <klassiker@gmx.de>
# Contributor: ferdig <ferdinand.goldmann@jku.at>
_pkgname=rxvt-unicode
pkgname=rxvt-unicode-truecolor-wide-glyphs
pkgver=9.30
pkgrel=6
pkgdesc="Unicode enabled rxvt-clone terminal emulator (urxvt) with true color, enhanced glyphs and improved font rendering support"
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=(
    'libxft'
    'libxt'
    'perl'
    'startup-notification'
    'libptytty'
)
optdepends=(
    'gtk2-perl: to use the urxvt-tabbed'
)
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
    http://dist.schmorp.de/$_pkgname/$_pkgname-$pkgver.tar.bz2
    'urxvt.desktop'
    'urxvtc.desktop'
    'urxvt-tabbed.desktop'
    'resize-font'
    'keyboard-select'
    '24-bit-color.patch'
    'enable-wide-glyphs.patch'
    'improve-font-rendering.patch'
    'perl-background-fix.patch'
)
b2sums=('645164e37e9e484c66f5047836689e4e4727575dfdcbefc64affb70d9110497529fdcc7d476f77737efed5cee4af314e1e1ccbcb42b506bb7e653b827c24a0c7'
        'eff2407a1551d57d7a9e9000a9bad760afd4d9b7a0fa15c375ec821d185561a99c3761319c1cbed5cdd512b39faf339fb78387220eae161c9a33a859fc4733d2'
        '2c4bc054e89b1bbd9ebce18cee64728b5ebb3aa915ce3ec7957e1a95da34c26ea757d324041b6c65db5902b60d0009176ff6aabc5093c5b2665c4b6997a3f60f'
        '71072f1f262b0759f0251654b7563e0dc5b3f73bc3705321d4e75230c51692541a8f5aa289657714baeab93a9e7b404a0b3ce0eecafb116c389a640209916916'
        '7f760beda37d781ae5bfff280fb912b3210ed4e60c82d279706feb023e5e10e9c5abe8eaa9bef6d7da460df39808c56de91ee2d5ffc63ea0c2e402810fa3dfb5'
        '9e3c03390d44a53b933fd6e11f3b644c43f377d3848975d9a5d1b964b042aca08995c968ada22b143bdc014691282242c8e718820f16086b35588242eb71a15b'
        '714c6f6b25dded535be85107ff1495175fbec1568f46eac7f59a0ef1af873bf3ac73bc312611c4a4443127f66d5fde48f30f342ca1f632541066d1bd6e11b560'
        'f9c56c35579155f33f2c09a580554a58e82e1de328d3bf3037386ab1cecb2970abeffe215ad9909706c398c506e369936584024672aac379f78a7f5bbcecc560'
        'c2e0b6be3df3cf037ffa1db9a5acff92dacd8ad6244b152bcb83cfd13bc3fc7a72dbd39b0ee97855c27ba960f2de5d5558516d12e4ec876d5d8bdba9eef11e1a'
        'd7f8b1472de6563d329f0edac6839a1625af4b74a782fb7080d30b804a5bb7292cf8b136c0682e535e5806092eddbe970399f3591e9150c6929ab85056c30be1')
_dir="$_pkgname-$pkgver"

prepare() {
    cd $_dir

    # the repo with original 24-bit-color.patch is no longer available:
    # https://gist.githubusercontent.com/dan-santana/63271adf12171e0fc0bc/raw/70c6343d1c0b3bca0aba4f587ed501e6cbd98d00/24-bit-color.patch
    # patch rewritten to work with version ≥ 9.26
    patch -p0 -i ../24-bit-color.patch

    # https://aur.archlinux.org/packages/rxvt-unicode-cvs-patched-wideglyphs
    patch -p0 -i ../enable-wide-glyphs.patch

    # https://gist.githubusercontent.com/emonkak/28bbc5474697695321452b6d9bf1d0bd/raw/a888c37ae10376598e663cf989132648f89219c0/rxvt-unicode-9.22-improve-font-endering.patch
    # patch rewritten to work with version ≥ 9.29
    patch -p0 -i ../improve-font-rendering.patch

    ################################################################
    #                                                              #
    #  If someone has better solutions for the rewritten patches,  #
    #                      please contact me!                      #
    #                                                              #
    ################################################################

    # patch to fix perl module background by ferdig
    patch -p0 -i ../perl-background-fix.patch
}

build() {
    cd $_dir

    ################################################################
    #                                                              #
    #   This is an opinionated build. If you miss features, feel   #
    #   free to enable them below before you build the package.    #
    #           (eg. --enable-pixbuf and --enable-fading)          #
    #                                                              #
    ################################################################

    # disable smart-resize (FS#34807)
    # do not specify --with-terminfo (FS#46424)
    ./configure \
        --prefix=/usr \
        --enable-xft \
        --enable-font-styles \
        --enable-xim \
        --enable-unicode3 \
        --enable-combining \
        --disable-fallback \
        --disable-pixbuf \
        --disable-startup-notification \
        --enable-transparency \
        --disable-fading \
        --disable-rxvt-scroll \
        --disable-next-scroll \
        --disable-xterm-scroll \
        --enable-frills \
        --disable-iso14755 \
        --disable-keepscrolling \
        --enable-selectionscrolling \
        --enable-mousewheel \
        --disable-slipwheeling \
        --disable-smart-resize \
        --enable-text-blink \
        --enable-pointer-blank \
        --enable-perl \
        --enable-256-color \
        --enable-24-bit-color \
        --enable-wide-glyphs
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

    cd $_dir

    # install terminfo
    export TERMINFO="$pkgdir/usr/share/terminfo"
    install -dm 755 "$TERMINFO"

    make DESTDIR="$pkgdir" install

    # install the tabbing wrapper (requires gtk2-perl)
    sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
    install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}
