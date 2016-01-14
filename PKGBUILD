# Maintainer: Bastien Traverse <firstname at lastname dot email>
# Contributor: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Caleb Reach <jtxx000@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Based on community/morituri and aur/morituri-git PKGBUILDs

pkgname=whipper-git
_gitname=whipper
pkgver=0.2.3.r43.g89f3ba3
pkgrel=1
pkgdesc="A Unix CD ripper aiming for accuracy over speed -- forked from morituri"
arch=('any')
url="https://github.com/JoeLametta/whipper"
license=('GPL3')
depends=(
    'cdparanoia'                    # for the actual ripping
    'cdrdao'                        # for session, TOC, pregap, and ISRC extraction
    'gstreamer0.10-base'            # for encoding
    'gstreamer0.10-base-plugins'    # for appsink
    'gstreamer0.10-good-plugins'    # for wav encoding
    'gstreamer0.10-python'          # for encoding
    )
makedepends=(
    'git'
    'python2-gobject2'
    'python2-musicbrainzngs'
    'python2-setuptools'
    )
optdepends=(
    'cddb-py: for showing but not using disc info if not in MusicBrainz'
    'python2-musicbrainzngs: for metadata lookup'
    'python2-pycdio: for storing drive identification in config file'
    'python2-setuptools: for plugin support'
)
provides=('morituri')
conflicts=('morituri' 'morituri-git')
source=('git+https://github.com/JoeLametta/whipper.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    # Cutting off "v" prefix present in the git tag
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_gitname"
    git submodule init
    git submodule update
}

build() {
    cd "$srcdir/$_gitname"
    export PYTHON=$(which python2)
    ./autogen.sh --prefix=/usr --sysconfdir=/etc
    ./configure --prefix=/usr --sysconfdir=/etc 
    make
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir/" install
    install -Dm 0644 "README.md" "$pkgdir/usr/share/doc/$_gitname/README"
}

# vim: ft=sh:ts=4:sw=4:et
