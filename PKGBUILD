# Contributor: Andreas Baumann <mail@andreasbauman.cc>
pkgname=adtpro-git
_pkgname=adtpro
pkgver=2.1.0.r12.g2e18f43
pkgrel=1
pkgdesc="Apple Disk Transfer ProDOS for transfering disk images between Apple II-era computers and the modern world."
arch=('x86_64')
url="https://adtpro.com/"
license=('GPL2')
depends=(java-runtime-common)
optdepends=(java-environment)
makedepends=('cc65')
source=(
  "${_pkgname}::git+https://github.com/ADTPro/adtpro.git"
  "adtpro-system-property-propertyfile.patch"
  "adtpro-path.patch"
)
sha256sums=('SKIP'
            '5a63d85f9d3d532350c12af276f7792d661948e53639a97a9dfc38931571d35e'
            'b770f5ceb0bd26106f2476b4dd91b3c972d3d86459535594c1666bddf12a272a')

pkgver() {
  cd "$_pkgname"
  VERSION=$(git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g' | tr '_' '.')
  echo $VERSION
}

prepare() {
  cd "$_pkgname"

  # set version number to last tag number and patch level
  cd build
  VERSION=$(git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g' | tr '_' '.')
  sed -i "s|<property name=\"versionString\" value=\"v.r.m\" />|<property name=\"versionString\" value=\"$VERSION\" />|g" build.xml
  cd ..

  # assume cc65 has been installed via the AUR
  cd build
  cp ADTProBuild-default.properties ADTProBuild.properties
  sed -i 's|^assemblerPath=.*|assemblerPath=/usr/bin|g' ADTProBuild.properties
  cd ..

  # add a system property where we can set the name of the system property
  patch -N -p1 -i "$srcdir/adtpro-system-property-propertyfile.patch"

  # adapt starter script and systemproperty to fit to our more standard Arch
  # directory layout
  patch -N -p1 -i "$srcdir/adtpro-path.patch"
}

build() {
  cd "$_pkgname"

  cd build
  ant all
}

package() {
  cd "$_pkgname"

  # we get the ADTPro-v.r.m directory which contains the same stuff as the
  # release tarball ADTPro-v.r.m.tar.gz
  VERSION=$(git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g' | tr '_' '.')
  cd build/ADTPro-$VERSION

  install -d -m0755 "$pkgdir/usr/bin"
  install -Dm755 "adtpro.sh" "$pkgdir/usr/bin/adtpro"
  install -d -m0755 "$pkgdir/usr/share/java/$_pkgname"
  install -Dm644 lib/ADTPro-$VERSION.jar "$pkgdir/usr/share/java/$_pkgname"
  install -Dm644 lib/jssc/slf4j-nop-1.7.36.jar "$pkgdir/usr/share/java/$_pkgname"
  install -Dm644 lib/jssc/jssc-2.9.4.jar "$pkgdir/usr/share/java/$_pkgname"
  install -Dm644 lib/AppleCommander/AppleCommander-ant-1.8.0-SNAPSHOT.jar "$pkgdir/usr/share/java/$_pkgname"

  install -d -m0755 "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 ADTPro.html "$pkgdir/usr/share/doc/$_pkgname/"

  install -d -m0755 "$pkgdir/usr/share/$_pkgname/"
  install -Dm644 disks/* "$pkgdir/usr/share/$_pkgname/"

  install -d -m0755 "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
