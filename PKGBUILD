# PKGBUILD for ArchLinux
# Uses the main git repository as source
# Not using _gitroot and _gitname, since this PKGBUILD
# is for installing tagged and released versions,
# not the latest release.
# Contributor: halhen <halhen at k2h dot se>

pkgname=xmlfs
pkgver=0.1.1
pkgrel=1
pkgdesc="mount xml files as directory structures"
license=(GPL)
arch=('i686' 'x86_64')
url=http://github.com/halhen/xmlfs
depends=('fuse>=2.6' libxml2)
source=()

build() {
    cd "$srcdir"
    msg "Connecting to git server..."

    if [[ -d "$srcdir/$pkgname" ]]; then
        (cd "$pkgname" && git pull origin master) || return 1
        msg "Repository updated"
    else
        git clone "http://github.com/halhen/xmlfs.git" || return 1
        msg "Repository cloned"
    fi

    rm -rf "$srcdir/$pkgname-build"
    cp -R "$srcdir/$pkgname"{,"-build"}
    cd "$srcdir/$pkgname-build"

    msg "Using version $pkgver..."
    git checkout $pkgver || return 1

    msg "Starting make ..."
    make PREFIX=/usr MANPREFIX=/usr/man DESTDIR=$startdir/pkg install || return 1
    install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
