# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Thomas Oster <thomas.oster@rwth-aachen.de>

pkgname=libonion-git
pkgver=0.8.r191.gde8ea93
pkgrel=1
pkgdesc='lightweight C library that facilitate to create simple HTTP servers'
arch=(x86_64)
url='https://github.com/davidmoreno/onion/'
license=('GPL-2.0-or-later' 'Apache-2.0')
depends=('mailcap' 'libpng' 'libjpeg-turbo' 'hiredis' 'sqlite' 'libgcrypt'
         'pam' 'systemd-libs' 'libxml2' 'gnutls' 'cairo')
makedepends=('git' 'cmake' 'go-md2man')
options=(!lto)
source=("git+$url")
sha1sums=('SKIP')

pkgver() {
  cd onion
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  # use `extra/go-md2man` instead of `aur/ruby-md2man` (*) to build man pages
  # cmake expects a program called `md2man-roff`
  # (*) it's broken as of now.
  echo -e '#!/bin/bash\n\nexec go-md2man -in $1' > md2man-roff
  chmod +x md2man-roff
}

build() {
  export PATH="$PWD:$PATH"
  cmake -DONION_USE_SYSTEMD=ON -DONION_USE_TESTS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -B build -S onion
  cmake --build build
}

# Tests are broken
#check() {
#  cd onion/build
#  make test
#}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
