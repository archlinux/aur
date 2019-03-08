# Maintainer: Drew Noel <drewmnoel@gmail.com>
pkgname=jpf-core-git
pkgver=jpf.8.0.r67.ge734381
pkgrel=1
pkgdesc="Explicit state software model checker for Java bytecode"
arch=('any')
url="https://github.com/javapathfinder/jpf-core"
license=('APACHE')
depends=('java-environment-openjdk>=7')
makedepends=('gradle')
provides=('jpf')
source=('git+https://github.com/javapathfinder/jpf-core'
        'jpf.properties'
        'jpf')

md5sums=('SKIP'
         'e25814db7a0c0efb45ff737a538e49a4'
         '6f96fef6cc825e9823c7daa8fb5d4460')

pkgver() {
  cd $srcdir/jpf-core
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | tr '[:upper:]' '[:lower:]'
}

build() {
  cd $srcdir/jpf-core

  # Compile
  ./gradlew buildJars
}

package() {
  # Copy the mandatory config
  install -D -m644 -t $pkgdir/usr/share/java/jpf/ $srcdir/jpf.properties

  # Copy all the .JAR files
  install -D -m644 -t $pkgdir/usr/share/java/jpf/ $srcdir/jpf-core/build/*.jar

  # Copy the jpf executable
  install -D -m755 -t $pkgdir/usr/local/bin/ $srcdir/jpf
}
