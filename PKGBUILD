# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=bedrock
_gitname=Bedrock
pkgver=r2546.6570215
pkgrel=1
pkgdesc="Rock solid distributed database specializing in active/active automatic failover and WAN replication."
url="http://bedrockdb.com"
license=("GPL")
arch=('i686' 'x86_64' 'aarch64')
install=$pkgname.install
makedepends=('git')
source=(
  'git://github.com/Expensify/Bedrock'
  'bedrock.conf'
  'bedrock.service'
)
sha512sums=('SKIP' 'SKIP' 'SKIP')
backup=('etc/bedrock.conf')

pkgver() {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git log | head -n 1 | cut -d" " -f2 | awk '{print substr($0,0,7)}')"
  )
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Fix compilation errors
  sed -i "s|#include <atomic>|#include <atomic>\n#include <functional>|" \
    libstuff/libstuff.h

  sed -i "s|/mbedtls/include -Werror -Wno-unu|/mbedtls/include -Wno-unu|" \
    Makefile

  if [[ $CARCH == "armv7h" ]]; then
    sed -i 's|"Timestamp"), 1ul)|"Timestamp"), 1ull)|' \
      libstuff/STCPNode.cpp
  fi
}

build() {
  cd "${srcdir}/${_gitname}"

  GXX=g++ CC=gcc make
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm755 bedrock $pkgdir/usr/bin/bedrock

  install -d ${pkgdir}/etc/

  install -d ${pkgdir}/var/lib/bedrock/

  install -d "$pkgdir/usr/share/doc/$pkgname"

  cp -r docs/* $pkgdir/usr/share/doc/$pkgname/

  cd ../../

  install -Dm644 bedrock.conf $pkgdir/etc/bedrock.conf
  install -Dm755 bedrock.service $pkgdir/usr/lib/systemd/system/bedrock.service
}
