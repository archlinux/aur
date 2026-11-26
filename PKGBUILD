# Maintainer: mrdotx <klassiker@gmx.de>
# Contributor: ferdig <ferdinand.goldmann@jku.at>
_pkgname=rxvt-unicode
pkgname=rxvt-unicode-truecolor-wide-glyphs
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with true color, enhanced glyphs and improved font rendering support'
pkgver=9.32
pkgrel=1
url='https://software.schmorp.de/pkg/rxvt-unicode.html'
arch=('i686' 'x86_64')
license=('GPL-3.0-only')
makedepends=(
    'signify'
)
depends=(
    'libxft'
    'libxt'
    'libxext'
    'libxmu'
    'perl'
    'startup-notification'
    'libnsl'
    'libptytty'
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
)
_archive="$_pkgname-$pkgver"
source=(
    "https://dist.schmorp.de/$_pkgname/Attic/$_archive.tar.bz2"
    "$_archive.tar.bz2.signature::https://dist.schmorp.de/$_pkgname/Attic/$_archive.tar.bz2.sig"
    'dist.schmorp.de.pub::https://dist.schmorp.de/signing-key.pub'
    'urxvt.desktop'
    'urxvtc.desktop'
    'urxvt-tabbed.desktop'
    'resize-font'
    'keyboard-select'
    '24-bit-color.patch'
    'enable-wide-glyphs.patch'
    'improve-font-rendering.patch'
    'osc-110-112-reset.patch'
    'lines-rewrap.patch'
)
b2sums=('eef4121fb698cef5b00abfd7d976672ecc844ca49b3d1ea9f3e64b6968a8e5edd1009b74b8059116d2424bc7092c2cddd779893f7dac1085bd35fbfda9e47d75'
        'b54ae6183d46ae091a01b6a43779270564e852282f552f1fdf2f7c9e75cec7f4aa8d6cf78daaae466b9545d90b6392ce29d9429d370d2f8a6ae5d28d98df9cc8'
        '6d6bd90b77e67ccb876f0c78c710c9e1b82767a19aeadaac9310e5628b791586fc8475ad5179eaa2fee386ae80aae916226167ec92c5af309bba4052238326c8'
        'eff2407a1551d57d7a9e9000a9bad760afd4d9b7a0fa15c375ec821d185561a99c3761319c1cbed5cdd512b39faf339fb78387220eae161c9a33a859fc4733d2'
        '2c4bc054e89b1bbd9ebce18cee64728b5ebb3aa915ce3ec7957e1a95da34c26ea757d324041b6c65db5902b60d0009176ff6aabc5093c5b2665c4b6997a3f60f'
        '71072f1f262b0759f0251654b7563e0dc5b3f73bc3705321d4e75230c51692541a8f5aa289657714baeab93a9e7b404a0b3ce0eecafb116c389a640209916916'
        '7f760beda37d781ae5bfff280fb912b3210ed4e60c82d279706feb023e5e10e9c5abe8eaa9bef6d7da460df39808c56de91ee2d5ffc63ea0c2e402810fa3dfb5'
        '9e3c03390d44a53b933fd6e11f3b644c43f377d3848975d9a5d1b964b042aca08995c968ada22b143bdc014691282242c8e718820f16086b35588242eb71a15b'
        'd327b406ce41a54f5ec2e902131f02a6f5d6b4052d00e85ccb4c48d78ca7e084b5a897fb8a9623a8e6a1ecc5e36bc5e75fd2c24f67b3b28c405c6cca7c216464'
        'da76aad4ef1f2b5ae462b512128323ae62dee85a8340fb4897dcb5fe5765c4953ad16108c41742c929d64593adb6a8b09c38080e3eb7f3e4a57738b58b43cf65'
        '875017f3964b473d866aebf75a08de50b945b60c266576a0883807e8811ef48767b50bd866ab0debdb0ff8c226ec04a8b0fa38ca3ffa7130a1695990ff1b047e'
        'cce19be10cad7271b48dc54dbe8256052f7176a64cae9974786d1c8fafd6a0930adc5fe366b2521804adb8db183e7cbeb2bbd0c940942f57222ac432d4796a27'
        '136ffb38a0a5820a413ddf85a88556d57dc5ab9944454596402692f336cbc5ec96180534eba04f0921dfb9dcbe59a0849197842e12c65eab59ef0741e6ee3b91')

prepare() {
    mv -v "$_archive.tar.bz2.signature" "$_archive.tar.bz2.sig"
    signify -V -p "dist.schmorp.de.pub" -m "$_archive.tar.bz2"

    cd "$_archive"

    ################################################################
    #                                                              #
    #  If someone has better solutions for the rewritten patches,  #
    #                      please contact me!                      #
    #                                                              #
    ################################################################

    # the repo with original 24-bit-color.patch is no longer available:
    # https://gist.githubusercontent.com/dan-santana/63271adf12171e0fc0bc/raw/70c6343d1c0b3bca0aba4f587ed501e6cbd98d00/24-bit-color.patch
    # patch rewritten to work with version ≥ 9.26
    patch -p1 -i ../24-bit-color.patch

    # https://aur.archlinux.org/packages/rxvt-unicode-cvs-patched-wideglyphs
    patch -p1 -i ../enable-wide-glyphs.patch

    # https://gist.githubusercontent.com/emonkak/28bbc5474697695321452b6d9bf1d0bd/raw/a888c37ae10376598e663cf989132648f89219c0/rxvt-unicode-9.22-improve-font-endering.patch
    # patch rewritten to work with version ≥ 9.29
    patch -p1 -i ../improve-font-rendering.patch

    # WORKAROUND: reset the terminal bg/fg/cursor colors via OSC 110/111/112
    # https://patch-diff.githubusercontent.com/raw/exg/rxvt-unicode/pull/6.patch
    patch -p1 -i ../osc-110-112-reset.patch

    # WORKAROUND: prompt position (revert lines-rewrap update in screen.C to 9.30)
    # https://lists.schmorp.de/pipermail/rxvt-unicode/2023q2/002661.html
    # https://wiki.archlinux.org/title/Rxvt-unicode#Wrong_shell_prompt_placement_after_upgrading_to_9.31
    patch -p1 -i ../lines-rewrap.patch
}

build() {
    cd "$_archive"

    # With >=GCC-16 memsets before constructor invocation are optimized away.
    # Together with LTO this breaks internal assumptions about object initialization,
    # leading to segfaults.
    # WORKAROUND: Disable those optimizations.
    export CXXFLAGS+=" -fno-lifetime-dse"

    ################################################################
    #                                                              #
    #   This is an opinionated build. If you miss features, feel   #
    #   free to enable them below before you build the package.    #
    #          (e.g. --enable-pixbuf and --enable-fading)          #
    #                                                              #
    ################################################################

    # WORKAROUND: disable --smart-resize (FS#34807)
    # WORKAROUND: do not specify --with-terminfo (FS#46424)
    # WORKAROUND: do not specify --disable-frills (FS#77474)
    # WORKAROUND: ncurses --disable-root-access (FS#79143)
    export TIC="/usr/bin/tic -o $srcdir/terminfo"
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

    # compile terminfo to custom directory (quick fix ncurses CVE-2023-29491)
    tic -x -o "terminfo" doc/etc/rxvt-unicode.terminfo
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

    cd "$_archive"

    # install the compiled terminfos from custom directory (quick fix ncurses CVE-2023-29491)
    install -Dm 644 terminfo/r/rxvt-unicode "$pkgdir/usr/share/terminfo/r/rxvt-unicode"
    install -Dm 644 terminfo/r/rxvt-unicode-256color "$pkgdir/usr/share/terminfo/r/rxvt-unicode-256color"

    make DESTDIR="$pkgdir" install

    # install the tabbing wrapper (requires gtk2-perl)
    sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
    install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}
