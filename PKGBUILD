# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=audiotools
pkgver=3.1.1
pkgrel=8
pkgdesc="A collection of Python-based command-line audio handling programs"
arch=('i686' 'x86_64')
url="http://audiotools.sourceforge.net"
license=('GPL')
depends=('python-urwid' 'libcdio-paranoia' 'libdvd-audio' 'lame' 'twolame'
'vorbis-tools' 'faad2' 'faac' 'opus-tools' 'opusfile' 'libpulse' 'wavpack'
'mpg123')
makedepends=('python-setuptools')
optdepends=('cdrkit: CD burning without cuesheet support'
            'cdrdao: CD burning with cuesheeet support')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
b2sums=('065b5dc23796ea8d1dc72dc581a8929fe26e08180af2f0719470d80d5c82be2455ffda28fe8fd5ca63ae078f7fa5c6b5153e8fae496736da8f97a4eae38c4876')
options=(!lto !debug)

build() {
  cd $srcdir/$pkgname-$pkgver
  sed 's/#include <cdio\/cdda.h>/#include <cdio\/paranoia\/cdda.h>/' -i src/cdiomodule.h
  sed 's/#include <cdio\/paranoia.h>/#include <cdio\/paranoia\/paranoia.h>/' -i src/cdiomodule.h
  sed 's/urwid.version.VERSION/urwid.VERSION/' -i audiotools/ui.py
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir
  cd docs
  install -d $pkgdir/usr/share/man/man1
  install -d $pkgdir/usr/share/man/man5
  make install -e MAN_PATH=$pkgdir/usr/share/man
}
