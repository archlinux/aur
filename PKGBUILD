# Maintainer: Trashlord <dornenreich666 at gmail dot com>
# Patch contributed by Ailin Nemui (Nei on irc.freenode.org #irssi)

pkgname=irssi-python
pkgver=test3
pkgrel=4
pkgdesc="Provides Python scripting support for Irssi"
url="http://irssi.org/"
arch=('x86_64' 'i686')
install='irssi-python.install'
depends=('python2')
license=('GPL2')

source=('http://irssi.org/files/irssi-0.8.17.tar.gz' 
        'https://github.com/downloads/danielrichman/irssi_rstatus/irssi-python-ac.tar.gz'
        'http://anti.teamidiot.de/static/nei/*/Code/Irssi/python-256color.diff')

	
md5sums=('00cde2ba7ba37af9e3df451f430ecdea'
	 '92f95ae4f6b48e0b661c361fc90e0638'
         '4c777c2e589bd8df33f0a5b6f7d9dd10')

build() {  
    # The following line makes "configure" look for python2 instead of python,
    # since python on Arch refers to Python 3, which would cause an error.
    export PYTHON_VERSION=2

    # Extract sources
    tar xvf irssi-0.8.17.tar.gz
    tar xvf irssi-python-ac.tar.gz
    # Apply patch
    cd "irssi-python"
    mv ../python-256color.diff ./src/
    patch -p1 <src/python-256color.diff
    # Build
    ./configure --with-irssi=../irssi-0.8.17 --prefix=/usr
    make -C src constants
    make
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



