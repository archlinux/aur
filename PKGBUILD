# Maintainer: Fabian Maurer <dark.shadow4@web.de>

pkgname=sdfs
pkgver=3.10.8.0
_pkgver=b914fcfbd10198552a1c892dede83b16774ffb03
pkgrel=2
pkgdesc="Deduplication file system from Opendedup"
arch=('x86_64')
url="http://opendedup.org"
license=('GPL2')
makedepends=('maven')
depends=('libxml2' 'java-runtime' 'fuse')
source=(https://github.com/opendedup/sdfs/archive/$_pkgver.zip
	'build-fix.patch'
)
md5sums=('6d230c16d98e41e42753cf275f718936'
         'f5435f9f678e9858512527f9211d3fdd')

build () {
  cd "${srcdir}/$pkgname-$_pkgver"
  patch -Np1 -i ${srcdir}/build-fix.patch
  JAVA_HOME=/usr/lib/jvm/default/jre mvn package
}

package() {
  cd "${srcdir}/$pkgname-$_pkgver/install-packages/deb"
  
  if [ ! -d usr/share/sdfs/bin/jre ]; then
    ln -s /usr/lib/jvm/default-runtime usr/share/sdfs/bin/jre
  fi

  cp -dr --no-preserve=ownership etc "${pkgdir}"
  cp -dr --no-preserve=ownership usr "${pkgdir}"

  install -d "${pkgdir}/usr/bin/"
  cp -dr --no-preserve=ownership sbin/* "${pkgdir}/usr/bin"

  cd "${srcdir}/$pkgname-$_pkgver/target"
  cp -dr --no-preserve=ownership lib/* "${pkgdir}/usr/share/sdfs/lib"
  rm sdfs-*-with-dependencies.jar
  cp --no-preserve=ownership sdfs-*.jar "${pkgdir}/usr/share/sdfs/lib/sdfs.jar"
}
