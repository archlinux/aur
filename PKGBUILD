# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=mpc-git
pkgver=20091005
pkgrel=1
pkgdesc="A minimalist command line interface to MPD"
arch=('i686' 'x86_64')
url="http://mpd.wikia.com"
license=('GPL2')
depends=('libmpdclient-git')
makedepends=('git')
optdepends=('bash-completion')
conflicts=('mpc')
provides=('mpc')
replaces=('mpc-svn')
source=()
md5sums=()

_gitroot="git://git.musicpd.org/master/mpc.git"
_gitname="mpc"

build() {
    cd ${srcdir}

    msg "Connecting to GIT server..."

    if [ -d ${srcdir}/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    # Copy Latest files to Build Directory
    rm -rf ${srcdir}/$_gitname-build
    git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build
    cd ${srcdir}/$_gitname-build

    # Configure Source
    ./autogen.sh --prefix=/usr

    # Build Source
	make || return 1

    # Install Source
	make prefix=${pkgdir}/usr install || return 1

    # Install Bash Completion File
    install -D -m 644 ${srcdir}/$_gitname/doc/mpc-bashrc \
        ${pkgdir}/etc/bash_completion.d/mpc
}
	
