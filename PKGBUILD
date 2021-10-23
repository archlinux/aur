# Contributor: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

_pkgbasename=jack-git
pkgname=lib32-$_pkgbasename
pkgver=0.125.0rc1.65.g6172c1b
pkgrel=1
pkgdesc="A low-latency audio server (32-bit)"
arch=('x86_64')
url="http://jackaudio.org/"
license=('GPL' 'LGPL')
depends=('jack' 'lib32-db' 'lib32-glibc')
makedepends=('gcc-multilib' 'git' 'lib32-libsamplerate' 'lib32-readline')
conflicts=('lib32-jack' 'lib32-jack2')
provides=('lib32-jack2' 'libjack.so')
source=("$_pkgbasename::git+https://github.com/jackaudio/jack1.git"
        "git+https://github.com/jackaudio/example-clients"
        "git+https://github.com/jackaudio/headers"
        "git+https://github.com/jackaudio/tools")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$_pkgbasename"
  git describe --tags --always | sed 's|-|.|g'
}

prepare() {
  cd "$_pkgbasename"
  git submodule init
  git config submodule.example-clients.url "${srcdir}/example-clients"
  git config submodule.jack.url "${srcdir}/headers"
  git config submodule.tools.url "${srcdir}/tools"
  git submodule update
  autoreconf -vfi
}

build() {
  cd "$_pkgbasename"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make -C libjack
}

package() {
  cd "$_pkgbasename"
  make DESTDIR="${pkgdir}" install-pkgconfigDATA
  make -C libjack DESTDIR="${pkgdir}" install
}
