# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

_pkgbasename=jack-git
pkgname=lib32-$_pkgbasename
pkgver=0.124.1.35.g6685cc7
pkgrel=1

pkgdesc="A low-latency audio server (32-bit client libs)"
url="http://jackaudio.org"
arch=('x86_64')
license=('GPL' 'LGPL')

depends=($_pkgbasename=$pkgver 'lib32-db' 'lib32-libsamplerate' 'lib32-readline')
makedepends=('git' 'gcc-multilib')

provides=('lib32-jack')
conflicts=('lib32-jack' 'lib32-jack2')

source=("$_pkgbasename::git://github.com/jackaudio/jack1.git"
        'tools-git::git://github.com/jackaudio/tools.git'
        'example-clients-git::git://github.com/jackaudio/example-clients.git')

md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgbasename"
  git describe --tags --always | sed 's|-|.|g'
}

prepare()
{
  cd "$_pkgbasename"
  git submodule init
  git config submodule.tools/master.url "$srcdir"/tools
  git config submodule.example-clients/master.url "$srcdir"/example-clients
  git submodule update jack tools example-clients
}

build() {
  cd "$_pkgbasename"
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib32
  make -C libjack
}

package() {
  cd "$_pkgbasename"
  make DESTDIR="$pkgdir" install-pkgconfigDATA
  make -C libjack DESTDIR="$pkgdir" install
}
