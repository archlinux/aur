# Maintainer: PAPPY <pappy _AT_ a s c e l i o n _DOT_ com>

_version=2.14.13
_patch=01

pkgname=nexus
pkgver=${_version}.${_patch}
pkgrel=1
pkgdesc="Nexus 2 Repository Manager (OSS)"
url="http://nexus.sonatype.org"
arch=('any')
license=('GPL3')
depends=('java-environment')
optdepends=('apache: a full featured webserver'
            'maven: a java project management and project comprehension tool')

install=nexus.install
backup=(opt/nexus/bin/jsw/conf/wrapper.conf)
conflicts=(nexus2 nexus3 nexus-oss)
provides=(nexus2 nexus)
options=(!strip !docs)

source=("http://www.sonatype.org/downloads/nexus-$_version-$_patch-bundle.tar.gz"
        'http://wrapper.tanukisoftware.com/download/3.5.26/wrapper-delta-pack-3.5.26.tar.gz'
        'nexus'
        'nexus.service')	

sha256sums=('66e2ae803af26c6af34a82cc510d7fa2037080f35a72b4398f65d2f157fd3afc'
            '635e545fde9c8728e4d7126859cab286637d565f041ce63596f5361fb85fc924'
            '945e2fa64d6096416edd60c2a98c0ed385aee00f6bb3b33f6cbbc428b6b47d07'
            'b89aaee6f035d7be20af5b738ed3b892df7f4db6538f9b7ec3c3f54685bbe7f8')

package() {
  cd ${srcdir}

  # Create directories
  install -d $pkgdir/opt/nexus
 

  # move documentation to the right location
  mkdir -p $pkgdir/usr/share/doc/nexus
  install $srcdir/nexus-$pkgver-$patchver/*.txt $pkgdir/usr/share/doc/nexus
  rm $srcdir/nexus-$pkgver-$patchver/*.txt

  # move example configuration to the right location
  mkdir -p $pkgdir/usr/share/doc/nexus/conf

  mkdir -p $pkgdir/opt/sonatype-work
  mkdir -p $pkgdir/opt/nexus/run

  # copy the source to the final directory
  cp -a $srcdir/nexus-${pkgver}-${patchver}/* $pkgdir/opt/nexus || return 1
  install $srcdir/nexus $pkgdir/opt/nexus/bin/nexus

    #install $srcdir/nexus.properties $pkgdir/opt/nexus/conf/nexus.properties || return 1

  install -Dm644 "${srcdir}/nexus.service" "${pkgdir}/usr/lib/systemd/system/nexus.service"

}
