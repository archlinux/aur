# Maintainer: Trashlord <dornenreich666 at gmail dot com>
# Maintainer notes:
# I've forked the irssi-python GitHub repo and made some backwards compatibility changes to two files.
# This is so that I can avoid having to distribute a patch with the package.
# The package now works exclusively with Python 3. Python 2 is no longer supported.
# Special thanks to Ailin Nemui for the help with building it against 1.3.2-an.

pkgname=irssi-python
pkgver=test5
pkgrel=3
pkgdesc="Provides Python scripting support for Irssi"
url="http://irssi.org/"
arch=('x86_64')
install='irssi-python.install'
makedepends=('git')
depends=('python' 'irssi')
license=('GPL2')

build() {     
    # Get irssi-python with git
    git clone https://github.com/SpiritualForest/irssi-python
    # Generate configure file
    cd "irssi-python"
    # Set the pkgconfig path to our source dir, so that it finds irssi-1.pc
    export PKG_CONFIG_PATH="$srcdir/irssi-python"
    autoreconf -ivf -I.
    # Build
    ./configure --prefix=/usr
    make -C src constants
    make
    libtool --finish /usr/lib/irssi/modules
}

package() {
    # libpython.so will be installed in /usr/lib/irssi/modules
    # Scripts will be installed in /usr/share/irssi/scripts
    # Documentation will be installed in /usr/share/doc/irssi
    cd "$srcdir/irssi-python/"
    mkdir -p "$pkgdir/usr/share/doc/irssi"
    install -m644 "docs/irssi-python.html" "$pkgdir/usr/share/doc/irssi"
    make DESTDIR="$pkgdir" install
}
