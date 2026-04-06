# Maintainer:  Hildigerr Vergaray <maintainer at Ymir Systems dot com>
# Contributor: Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Rickard Gustafsson <rickard@allyourbase.se>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Joel Klinghed <the_jk@yahoo.com>
# Contributor: Paweł Tomak <pawel@tomak.eu>

pkgname=pike
pkgver=8.0.1956
pkgrel=1
pkgdesc='Dynamic programming language with a syntax similar to Java and C'
arch=('x86_64')
url='http://pike.lysator.liu.se'
license=('GPL-2.0-only AND LGPL-2.1-only AND MPL-1.1')
depends=('nettle')
options=('!makeflags')
source=("${url}/pub/${pkgname}/all/${pkgver}/Pike-v${pkgver}.tar.gz")
sha256sums=('6a0f2677eb579865321bd75118c638c335860157a420a96e52e2765513dad4c0')

prepare() {
  cd "Pike-v${pkgver}"

  # Don't use true and false as variable names.
  sed -i 's/true/enable/' src/modules/HTTPLoop/requestobject.c
  sed -i 's/false/disable/' src/modules/HTTPLoop/requestobject.c
}

build() {
  cd "Pike-v${pkgver}"

  #LTO reports false positives concludes we are macOS
  #gnu90 enables older standard, but still allows c++ style comments
  export CFLAGS="-O2 -fno-lto -std=gnu90"
  export CXXFLAGS="-O2 -fno-lto"
  export LDFLAGS="-fno-lto"

  make CONFIGUREARGS=" \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-crypt \
    --with-gif \
    --with-gmp \
    --with-bignums"
}

package() {
  cd "Pike-v${pkgver}"

  make buildroot="${pkgdir}" INSTALLARGS='--traditional' install_nodoc
  install -Dm644 man/pike.1 "${pkgdir}/usr/share/man/man1/pike.1"

  # Use the correct lib dir
  if [ -d "$pkgdir/usr/lib64" ]; then
    mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
  fi
}
