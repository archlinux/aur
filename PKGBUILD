# Maintainer: DustVoice <info@dustvoice.de>

pkgname=st-dustvoice-git
pkgver=0.8.4.4.r1.gd9d1180
pkgrel=1
pkgdesc="DustVoice's custom, heavily patched st (suckless.org) version"

arch=('i686' 'x86_64')

license=('MIT')

depends=(ttf-hack libxft)
makedepends=('ncurses' 'libxext' 'git')

provides=(st)
conflicts=(st)

url=https://git.dustvoice.de/DustVoice/st.git
source=("git+$url"
        README.terminfo.rst)

sha256sums=(SKIP
            SKIP)

_gitname="st"
_sourcedir="$_gitname"
_makeopts="--directory=$_sourcedir"
_gitdir=${pkgname%'-git'}
_startdir=$PWD

pkgver() {
    cd "${srcdir}/st"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    echo 'Applying patches from $_startdir if they exist...'
    if [ -d "$_startdir/patches" ]; then
        for patch in $_startdir/patches/*.diff; do
            echo "Applying $patch ..."
            patch -p1 -s -i "$patch"
        done;
    fi;

# This package provides a mechanism to provide a custom config.h. Multiple
# configuration states are determined by the presence of two files in
# $BUILDDIR:
#
# config.h  config.def.h  state
# ========  ============  =====
# absent    absent        Initial state. The user receives a message on how
#                         to configure this package.
# absent    present       The user was previously made aware of the
#                         configuration options and has not made any
#                         configuration changes. The package is built using
#                         default values.
# present                 The user has supplied his or her configuration. The
#                         file will be copied to $srcdir and used during
#                         build.
#
# After this test, config.def.h is copied from $srcdir to $BUILDDIR to
# provide an up to date template for the user.
    if [ -e "$BUILDDIR/config.h" ]; then
        cp "$BUILDDIR/config.h" "$_sourcedir"
    elif [ ! -e "$BUILDDIR/config.def.h" ]; then
        msg='This package can be configured in config.h. Copy the config.def.h '
        msg+='that was just placed into the package directory to config.h and '
        msg+='modify it to change the configuration. Or just leave it alone to '
        msg+='continue to use default values.'
        warning "$msg"
    fi

    cp "$_sourcedir/config.def.h" "$BUILDDIR"
}

build() {
    make $_makeopts X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    local installopts='--mode 0644 -D --target-directory'
    local shrdir="$pkgdir/usr/share"
    local licdir="$shrdir/licenses/$pkgname"
    local docdir="$shrdir/doc/$pkgname"

    make $_makeopts PREFIX=/usr DESTDIR="$pkgdir" install

    install $installopts "$licdir" "$_sourcedir/LICENSE"
    install $installopts "$docdir" "$_sourcedir/README"
    install $installopts "$docdir" README.terminfo.rst
    install $installopts "$shrdir/$pkgname" "$_sourcedir/st.info"
}
