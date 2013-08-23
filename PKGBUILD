# Maintainer: Your Name <youremail@domain.com>
pkgname=befungee-git
pkgver=20111120
pkgrel=1
pkgdesc="Befunge-93 interpreter written in Python with a built-in debugger"
arch=("any")
url="https://github.com/programble/befungee"
license=("GPL")
depends=("python2")
makedepends=("git")
# provides=()
# conflicts=()
# replaces=()
# backup=()
options=(!emptydirs)
# install=
source=()
md5sums=()

_gitroot=https://github.com/programble/befungee.git
_gitname=befungee

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
	cd "$_gitname" && git pull origin
	msg "The local files are updated."
    else
	git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
    cd "$srcdir/$_gitname-build"

    sed -e "1s/python/python2/" -i befungee.py
    sed -e "1d" -i boards.py funge.py
    sed -e "/import sys/asys.path.append(\"/usr/lib/befungee\")" -i befungee.py

    install -m755 -d "$pkgdir/usr/share/befungee"
    cp -R examples "$pkgdir/usr/share/befungee"
    install -m755 -D befungee.py "$pkgdir/usr/bin/befungee"
    install -m644 -D boards.py "$pkgdir/usr/lib/befungee/boards.py"
    install -m644 funge.py "$pkgdir/usr/lib/befungee/funge.py"
}
