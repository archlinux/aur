# Maintainer: Fabian Maurer <dark.shadow4@web.de>

pkgname=sdfs
pkgver=3.6.0.10
pkgrel=1
pkgdesc="Deduplication file system from Opendedup"
arch=('x86_64')
url="http://opendedup.org"
license=('GPL2')
makedepends=('maven')
depends=('libxml2' 'java-runtime' 'fuse')
source=(https://github.com/opendedup/sdfs/archive/${pkgver}.zip
        https://raw.githubusercontent.com/opendedup/sdfs/3.7/install-packages/deb/usr/share/sdfs/mount.sdfs)
md5sums=('144ea71338a8250216dbe446b1940eec'
         '591288969f6b79b4557b2ca8a1ac78f6')

build () {
  cd "${srcdir}/$pkgname-$pkgver"
  JAVA_HOME=/usr/lib/jvm/default/jre mvn package
}

package() {
  cd "${srcdir}/$pkgname-$pkgver/install-packages/deb"
  
  if [ ! -d usr/share/sdfs/bin/jre ]; then
    ln -s /usr/lib/jvm/default-runtime usr/share/sdfs/bin/jre
  fi

  cp -dr --no-preserve=ownership etc "${pkgdir}"
  cp -dr --no-preserve=ownership usr "${pkgdir}"

  install -d "${pkgdir}/usr/bin/"
  cp -dr --no-preserve=ownership sbin/* "${pkgdir}/usr/bin"

  cd "${srcdir}/$pkgname-$pkgver/target"
  cp -dr --no-preserve=ownership lib/* "${pkgdir}/usr/share/sdfs/lib"
  rm sdfs-*-with-dependencies.jar
  cp --no-preserve=ownership sdfs-*.jar "${pkgdir}/usr/share/sdfs/lib/sdfs.jar"

  #Take newer version of 'mount.sdfs' since current version is broken
  cp "${srcdir}/mount.sdfs" "${pkgdir}/usr/share/sdfs/"
}
