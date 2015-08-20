# Maintainer: Sebastien Duthil <duthils@free.fr>
pkgname='dnds-git'
pkgver=20140328
pkgrel=1
epoch=
pkgdesc="Dynamic Network Directory Service - easy to use VPN"
arch=('i686' 'x86_64')
url="https://github.com/nicboul/DNDS"
license=('GPL2')
groups=()
depends=('qt4')
makedepends=('git' 'cmake' 'scons')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='dnds-git.install'
changelog=
noextract=()
source=('dnds-git.patch'
        'dnds-git-tapcfg.patch')
md5sums=('09f1f49cd6b5317e11698495668f26bb'
         '17d70917c22e1792303f86c8c13aa62f')

_dnds_gitroot="git://github.com/nicboul/DNDS.git"
_dnds_gitname="DNDS"

_udt4_gitroot="git://github.com/nicboul/udt4.git"
_udt4_gitname="udt4"

_tapcfg_gitroot="git://github.com/nicboul/tapcfg.git"
_tapcfg_gitname="tapcfg"

_libconfig_gitroot="git://github.com/nicboul/libconfig.git"
_libconfig_gitname="libconfig"

_clone_or_pull() {
    gitname="$1"
    gitroot="$2"
    if [ -d "$srcdir/$gitname" ] ; then
        cd "$srcdir/$gitname" && git pull origin
        msg2 "$gitname - The local files are updated."
    else
        git clone "$gitroot" "$srcdir/$gitname" --depth=1
    fi
}

_fix_libconfig_git () {
    # git creates files in alphabetic order, messing with dependency detection
    # of make. Specifically, *.y files are created after *.c files, which are
    # generated from *.y files
    touch "$srcdir/$_libconfig_gitname"/lib/*.c
}


build() {
    cd "$srcdir"
    msg "Connecting to the git repositories..."

    _clone_or_pull "$_dnds_gitname" "$_dnds_gitroot"
    _clone_or_pull "$_libconfig_gitname" "$_libconfig_gitroot"
    _clone_or_pull "$_udt4_gitname" "$_udt4_gitroot"
    _clone_or_pull "$_tapcfg_gitname" "$_tapcfg_gitroot"
    ln -sf "$srcdir/$_libconfig_gitname" "$srcdir/$_dnds_gitname/libconfig-linux"
    ln -sf "$srcdir/$_udt4_gitname" "$srcdir/$_dnds_gitname/udt4"
    ln -sf "$srcdir/$_tapcfg_gitname" "$srcdir/$_dnds_gitname/tapcfg-linux"

    cd "$srcdir/$_udt4_gitname"
    if [ "$CARCH" == 'i686' ] ; then
      make_arch='arch=IA32'
    else
      make_arch='arch=AMD64'
    fi
    make "$make_arch" src.all

    cd "$srcdir/$_tapcfg_gitname"
    git apply "$srcdir/dnds-git-tapcfg.patch" || true
    ./buildall.sh

    cd "$srcdir/$_libconfig_gitname"
    _fix_libconfig_git
    ./configure 'CFLAGS=-fPIC'
    make

    cd "$srcdir/$_dnds_gitname/"
    git apply "$srcdir/dnds-git.patch" || true
    rm -rf build.archlinux
    mkdir build.archlinux
    cd build.archlinux
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
    make dnc
}

package() {
    cd "$srcdir/$_dnds_gitname/build.archlinux/libdnds"
    make DESTDIR="$pkgdir/" install

    cd "$srcdir/$_dnds_gitname/build.archlinux/dnc"
    make DESTDIR="$pkgdir/" install
}
