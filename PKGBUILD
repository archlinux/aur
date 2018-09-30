# Maintainer: Glowpelt <myst AT focks DOT pw>
pkgname=wit-svn
pkgver=r7603
pkgrel=1
pkgdesc="A set of command line tools to manipulate Wii and Gamecube ISO images and WBFS containers"
arch=('x86_64')
url="https://wit.wiimm.de/"
license=('GPL')
depends=('zlib' 'fuse')
makedepends=('subversion')
source=("wit-svn::svn+https://opensvn.wiimm.de/wii/trunk/wiimms-iso-tools/")
md5sums=('SKIP')

# There's a proper version number, but it's embedded in the Makefile - figure out how to extract?
pkgver() {
    cd "$pkgname"
    local svnver="$(svnversion)"
    printf "r%s" "${svnver//[[:alpha:]]}"
}

build() {
    cd "$pkgname"
    # The setup script isn't executable, as SVN is writing it, for some reason.
    chmod +x ./setup.sh
    INSTALL_PATH="/usr/bin" ./setup.sh
    make
}

package() {
    cd "$pkgname"

    # The builtin install script can't easily be used without worse hacks, so just
    # manually install everything.
    install -p -D -m755 -t "$pkgdir/usr/bin" wit wwt wdf wfuse

    ln -s /usr/bin/wdf "$pkgdir/usr/bin/wdf-cat"
    ln -s /usr/bin/wdf "$pkgdir/usr/bin/wdf-dump"

    # Data files it uses. Unsure if it's wise to include the root-needed update script.
    install -p -D -m644 -t "$pkgdir/usr/share/wit" share/titles.txt share/titles-*.txt share/system-menu.txt share/magic.txt
}
