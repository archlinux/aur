# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=bedrock
_gitname=Bedrock
pkgver=r340.8a823b7
pkgrel=1
pkgdesc="Rock solid distributed database specializing in active/active automatic failover and WAN replication."
url="http://bedrockdb.com"
license=("GPL")
arch=('i686' 'x86_64')
source=(
  'git://github.com/Expensify/Bedrock'
  'bedrock.service'
)
sha512sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git log | head -n 1 | cut -d" " -f2 | awk '{print substr($0,0,7)}')"
  )
}

build() {
  cd "${srcdir}/${_gitname}"

  GXX=g++ CC=gcc make
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm755 bedrock $pkgdir/usr/bin/bedrock

  install -d ${pkgdir}/var/lib/bedrock/

  touch ${pkgdir}/var/lib/bedrock/bedrock.db

  install -d "$pkgdir/usr/share/doc/$pkgname"

  cp -r docs/* $pkgdir/usr/share/doc/$pkgname/

  cd ../../

  install -Dm755 bedrock.service $pkgdir/usr/lib/systemd/system/bedrock.service
}
