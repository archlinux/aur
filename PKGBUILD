# Maintainer: mrdotx <klassiker@gmx.de>
# Contributor: ferdig <ferdinand.goldmann@jku.at>
_pkgname=rxvt-unicode
pkgname=rxvt-unicode-truecolor-wide-glyphs
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with true color, enhanced glyphs and improved font rendering support'
pkgver=9.31
pkgrel=9
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')
makedepends=('signify')
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
    "http://dist.schmorp.de/$_pkgname/Attic/$_archive.tar.bz2"
    "$_archive.tar.bz2.signature::http://dist.schmorp.de/$_pkgname/Attic/$_archive.tar.bz2.sig"
    'dist.schmorp.de.pub::http://dist.schmorp.de/signing-key.pub'
    'urxvt.desktop'
    'urxvtc.desktop'
    'urxvt-tabbed.desktop'
    'resize-font'
    'keyboard-select'
    '7-bit-queries.patch'
    'lines-rewrap.patch'
    '24-bit-color.patch'
    'enable-wide-glyphs.patch'
    'improve-font-rendering.patch'
)
b2sums=('439a8c33b7260e0f2fd68b8a4409773c06c3bb7623b5dfbbb0742cc198c9fd25e8a247907878639db5fac3dcd3b6be3d839347787bcf08ca602ae246607f750b'
        '1c58b1d53c72dbfae4f9302f5903365f84e85b2a1e9846d9dd9c712a7900e73a94621a41bee6dd75d690df8ae95d1d987d93ca4355eb8d8c423c57680df0edcf'
        '6d6bd90b77e67ccb876f0c78c710c9e1b82767a19aeadaac9310e5628b791586fc8475ad5179eaa2fee386ae80aae916226167ec92c5af309bba4052238326c8'
        'eff2407a1551d57d7a9e9000a9bad760afd4d9b7a0fa15c375ec821d185561a99c3761319c1cbed5cdd512b39faf339fb78387220eae161c9a33a859fc4733d2'
        '2c4bc054e89b1bbd9ebce18cee64728b5ebb3aa915ce3ec7957e1a95da34c26ea757d324041b6c65db5902b60d0009176ff6aabc5093c5b2665c4b6997a3f60f'
        '71072f1f262b0759f0251654b7563e0dc5b3f73bc3705321d4e75230c51692541a8f5aa289657714baeab93a9e7b404a0b3ce0eecafb116c389a640209916916'
        '7f760beda37d781ae5bfff280fb912b3210ed4e60c82d279706feb023e5e10e9c5abe8eaa9bef6d7da460df39808c56de91ee2d5ffc63ea0c2e402810fa3dfb5'
        '9e3c03390d44a53b933fd6e11f3b644c43f377d3848975d9a5d1b964b042aca08995c968ada22b143bdc014691282242c8e718820f16086b35588242eb71a15b'
        '94b110f9901786c398c313199da17b5981644241de2385208d36a3cccbf029c518ee619bbadff0348405bc01cd8f24abf41aa361b2f140178345197c2b476e03'
        '06b8a321a59c92ad781f882e454a4868a5b9e6bf482217568a6ed8a2e82e5e2e604bcea1efd79aa6dbaffb6c1e12416f4232966e718b2001142082a57e15468f'
        'ba382f5b1b2d7494a2faee2674530fae21aa36ce9e6aea7375c354fa8036ef37f34759b164658856cb4bebbc8f34be79dc26eca83670b945e956dae1d54bf842'
        '83cad5f2583ea152c7da1fc804a9ce7e7ee8d7b9735645b647172a8d0512c8cdcf44b45e16ccd3b8770c971749aecfc8d172009bffb479ca00d12b7697b012cd'
        '05faae03a36b71fa5a9105f143b8e2d084014857cc4012c25a531808392c5a6e48ea72cd0857beb494d76b7b0a7943ec8da3e28e411d800e29b8ac6ae4e21788')

prepare() {
    mv -v "$_archive.tar.bz2.signature" "$_archive.tar.bz2.sig"
    signify -V -p "dist.schmorp.de.pub" -m "$_archive.tar.bz2"

    cd "$_archive"

    # WORKAROUND: multiple-char sequence for 7-bit queries
    # http://lists.schmorp.de/pipermail/rxvt-unicode/2023q1/002640.html
    patch -p0 -i ../7-bit-queries.patch

    # WORKAROUND: prompt position (revert lines-rewrap update in screen.C to 9.30)
    # http://lists.schmorp.de/pipermail/rxvt-unicode/2023q2/002661.html
    # https://wiki.archlinux.org/title/Rxvt-unicode#Wrong_shell_prompt_placement_after_upgrading_to_9.31
    patch -p0 -i ../lines-rewrap.patch

    ################################################################
    #                                                              #
    #  If someone has better solutions for the rewritten patches,  #
    #                      please contact me!                      #
    #                                                              #
    ################################################################

    # the repo with original 24-bit-color.patch is no longer available:
    # https://gist.githubusercontent.com/dan-santana/63271adf12171e0fc0bc/raw/70c6343d1c0b3bca0aba4f587ed501e6cbd98d00/24-bit-color.patch
    # patch rewritten to work with version ≥ 9.26
    patch -p0 -i ../24-bit-color.patch

    # https://aur.archlinux.org/packages/rxvt-unicode-cvs-patched-wideglyphs
    patch -p0 -i ../enable-wide-glyphs.patch

    # https://gist.githubusercontent.com/emonkak/28bbc5474697695321452b6d9bf1d0bd/raw/a888c37ae10376598e663cf989132648f89219c0/rxvt-unicode-9.22-improve-font-endering.patch
    # patch rewritten to work with version ≥ 9.29
    patch -p0 -i ../improve-font-rendering.patch
}

build() {
    cd "$_archive"

    ################################################################
    #                                                              #
    #   This is an opinionated build. If you miss features, feel   #
    #   free to enable them below before you build the package.    #
    #          (e.g. --enable-pixbuf and --enable-fading)          #
    #                                                              #
    ################################################################

    # disable smart-resize (FS#34807)
    # do not specify --with-terminfo (FS#46424)
    # do not specify --disable-frills (FS#77474)
    # workaround ncurses --disable-root-access (FS#79143)
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
