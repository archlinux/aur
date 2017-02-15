# Maintainer: Trashlord <dornenreich666 at gmail dot com>
# Patch contributed by Ailin Nemui (Nei on irc.freenode.org #irssi)

pkgname=irssi-python
pkgver=test4
pkgrel=9
pkgdesc="Provides Python scripting support for Irssi"
url="http://irssi.org/"
arch=('x86_64' 'i686')
install='irssi-python.install'
makedepends=('git')
depends=('python2')
license=('GPL2')

source=('https://github.com/irssi/irssi/releases/download/1.0.1/irssi-1.0.1.tar.gz')	
md5sums=('2bc15e8262285a79eb24d96df2aad12f')

build() {  
    # The following line makes "configure" look for python2 instead of python,
    # since python on Arch refers to Python 3, which would cause an error.
    export PYTHON_VERSION=2
    
    # Get irssi-python with git
    git clone https://github.com/irssi-import/irssi-python
    # Extract irssi sources and generate ./configure file
    tar xvf irssi-1.0.1.tar.gz
    cd "irssi-python"
    autoreconf -ivf -I.
    # Build
    ./configure --with-irssi=../irssi-1.0.1 --prefix=/usr
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
