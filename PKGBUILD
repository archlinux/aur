# Maintainer: 64bitman <chen.foxe@gmail.com>
# Contributor: mrdotx <klassiker@gmx.de>
# Contributor: ferdig <ferdinand.goldmann@jku.at>
_pkgname=rxvt-unicode
pkgname=rxvt-unicode-truecolor-secondaryscroll-clear
pkgver=9.31
pkgrel=4
pkgdesc="Unicode enabled rxvt-clone terminal emulator (urxvt) with true color, enhanced glyphs and improved font rendering support, secondary wheel scrolling, and VTE-like clear"
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
makedepends=(
    'signify'
)
depends=(
    'libxft'
    'libxt'
    'perl'
    'startup-notification'
    'libnsl'
    'libptytty'
    'libxext'
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
)
_archive="$_pkgname-$pkgver"
source=(
    "http://dist.schmorp.de/$_pkgname/Attic/$_archive.tar.bz2"
    "$_archive.tar.bz2.signature::http://dist.schmorp.de/$_pkgname/Attic/$_archive.tar.bz2.sig"
    'dist.schmorp.de.pub::http://dist.schmorp.de/signing-key.pub'
    'urxvt.desktop'
    'urxvtc.desktop'
    'resize-font'
    'keyboard-select'
    '7-bit-queries.patch'
    'perl-5.38.patch'
    '24-bit-color.patch'
    'enable-wide-glyphs.patch'
    'improve-font-rendering.patch'
    'secondaryWheel.patch'
    'clear.patch'
    'starttop.patch'
    'popup-menu-hang.diff'
    'noinc.diff'
    'searchable-scrollback-color.patch'
    'cursorstyle.patch'
)

prepare() {
    mv -v "$_archive.tar.bz2.signature" "$_archive.tar.bz2.sig"
    signify -V -p "dist.schmorp.de.pub" -m "$_archive.tar.bz2"

    cd "$_archive"

    # workaround: multiple-char sequence for 7-bit queries
    patch -p0 -i ../7-bit-queries.patch

    # workaround: locale for perl 5.38
    patch -p0 -i ../perl-5.38.patch

    ################################################################
    #                                                              #
    #  If someone has better solutions for the rewritten patches,  #
    #                      please contact me!                      #
    #                                                              #
    ################################################################
    patch -p0 -i ../popup-menu-hang.diff
    patch -p1 -i ../noinc.diff
    patch -p1 -i ../clear.patch
    patch -p1 -i ../secondaryWheel.patch
    patch -p1 -i ../starttop.patch
    patch -p0 -i ../searchable-scrollback-color.patch

    # the repo with original 24-bit-color.patch is no longer available:
    # https://gist.githubusercontent.com/dan-santana/63271adf12171e0fc0bc/raw/70c6343d1c0b3bca0aba4f587ed501e6cbd98d00/24-bit-color.patch
    # patch rewritten to work with version ≥ 9.26
    patch -p0 -i ../24-bit-color.patch

    # https://aur.archlinux.org/packages/rxvt-unicode-cvs-patched-wideglyphs
    patch -p0 -i ../enable-wide-glyphs.patch

    # https://gist.githubusercontent.com/emonkak/28bbc5474697695321452b6d9bf1d0bd/raw/a888c37ae10376598e663cf989132648f89219c0/rxvt-unicode-9.22-improve-font-endering.patch
    # patch rewritten to work with version ≥ 9.29
    patch -p0 -i ../improve-font-rendering.patch

    patch -p1 -i ../cursorstyle.patch
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
        --disable-fallback \
        --disable-pixbuf \
        --disable-startup-notification \
        --disable-transparency \
        --disable-fading \
        --disable-rxvt-scroll \
        --disable-next-scroll \
        --disable-xterm-scroll \
        --disable-iso14755 \
        --disable-smart-resize \
        --enable-xft \
        --enable-font-styles \
        --enable-xim \
        --enable-unicode3 \
        --enable-combining \
        --enable-frills \
        --enable-selectionscrolling \
        --enable-mousewheel \
        --enable-slipwheeling \
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
    for _f in urxvt urxvtc; do
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
}
sha256sums=('aaa13fcbc149fe0f3f391f933279580f74a96fd312d6ed06b8ff03c2d46672e8'
            'afea78dc25db8cd15da9959baf347b0634f4ef62dd3eeaff0c0a3389986b6a3e'
            '48ef5720d77a870f25737b8f66fe2c1f88a01810013df70cb8155add904288e4'
            '2e0670a40add8de408b8dc8646ef16c86382a23111694038cf4b21dc7c02d649'
            'c9862f4d0005bbb90ee47f63718693e08ca3f7ccec34d20e6710a8fe9cf7ce97'
            'd84ab0a99f03a985465d93c5290ae9570ae073575e5045e446f467465d331552'
            '9c07bbe378679a9427a2cfe576aba0bc5a8b81bcedf407509dfdbb0e88208c12'
            '6f427e4b0199531ccf0ff165fbcd2f34f383c1ec0975b368f8ca0fcfbc599f24'
            'edc3f84b522aef3e556497e1ad44fb2f4ac88d7abee082bec8e3aa38584a9764'
            '2731905b206758b9206caabb0443cba0840780d2eff0164544d46e02ee8f5e0f'
            'c91fff4e490d32fb1fdd23deda51a0f70aec488cf47f642e8b263f11b107761c'
            'ef5b6b9a872c267d8b2c41180f341dfd3aac666a6ebe841f1aa9845c632b621f'
            '70b2c60887df3b335cd9b26a8ec3964845f75cca98099c7c5a6be4fa74770f57'
            '9df34ba141a9e32d785f63b050ab82e6e6c745b391c5b16e17bec4dcd4a2b087'
            '26bcc874e17db6ab676649dab12f6afd308754fb77673df5e6b5a74d0b89efc7'
            '64afd103527ce2cb2a8c51fefd815615afd0a63bbb810f2fb5ea38f6280def03'
            '0ee0434eb84b3ce1f62a4e02c0ba6d0940f4c62477e8982eb9219186feb393e3'
            '9445f5c1e0d823c5ecbc31a8532fdb80c318903113a8a507034d52b04bd247dc'
            'e73592406d90cee0d062154464d9a5678c6812a55ee1e31ac4d02c503f4b2ebe')
