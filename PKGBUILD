# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Michael Taboada <michael@2mb.solutions>

_pkgname="tintin"
pkgname="tintin-beta"
pkgver=2021.01.10
pkgrel=1
epoch=1
pkgdesc="A console-based MUD client beta version"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="http://tintin.sourceforge.net/"
license=('GPL2')
depends=('zlib' 'pcre' 'gnutls')
options=('strip')
source=('http://tintin.sourceforge.net/download/tintin-beta.tar.gz')
conflicts=("tt++" "tintin")
provides=("tt++" "tintin")
md5sums=('SKIP')

pkgver() {
    # Because there is no version number, the date of last modification will be used in yymmdd format.
    date="$(date '+%Y.%m.%d' -d "$(curl -L -s -i -I 'http://tintin.sourceforge.net/download/tintin-beta.tar.gz' | grep 'last-modified' | cut -d: -f2 | cut -d\  -f2-)")"
    if [[ "$date" =~ ^[0-9]{4}\.[0-9]{2}\.[0-9]{2}$ ]] ; then
        echo "$date"
    else
        echo "Error getting last modified date" >&2
        exit 1
    fi
}

build() {
  cd $srcdir/tt/src
  sh configure --prefix=/usr --enable-big5
  make

}

package() {
  cd $srcdir/tt/src
  install -m755 -D tt++ $pkgdir/usr/bin/tt++
  ln -sf tt++ $pkgdir/usr/bin/tintin
}
