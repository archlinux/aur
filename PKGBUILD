# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: Robert Gonciarz <goncairz (malpa) gmail (kropka) com>
# Maintainer: Kevin Baxmann <kvbx@kvbx.de>

pkgname=micronaut
pkgver=1.3.5
pkgrel=1
pkgdesc="Application Framework"
arch=('x86_64')
url="https://github.com/micronaut-projects/micronaut-core"
license=(Apache)
depends=('java-environment>=8')
source=(https://github.com/micronaut-projects/micronaut-core/archive/v${pkgver}.tar.gz)
sha512sums=('e3d84e36157eb6b9156d0037a415f6c748b63bcf94ad610b58a1384b977feee728bd94ef520a59fcc3096350c6cef1702bdcc4a6beb0053bd5f701f231c9c43b')

build() {

  function build_failed {
    if [ "$?" != "0" ]; then
      tput bold
      echo
      echo "Building may have failed due to an incompatible JDK."
      echo "Please set JAVA_HOME to a JDK compatible with gradle 6.1 (between 8 and 13)."
      echo "(e.g. install 'jdk8-openjdk' and run 'archlinux-java set java-8-openjdk')"
      echo "After building the package you may set it back to a newer version"
      echo
      tput sgr0
    fi
  }

  trap build_failed EXIT

  cd "$srcdir/micronaut-core-$pkgver"
  ./gradlew cli:fatJar
}

package() {
  cd "$srcdir/micronaut-core-$pkgver"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/lib/micronaut
  cp -r cli/build/* "$pkgdir"/usr/lib/micronaut

  mv "$pkgdir"/usr/lib/micronaut/bin/mn "$pkgdir"/usr/bin/mn
  sed -i "s|^APP_HOME.*$|APP_HOME=/usr/lib/micronaut|" "$pkgdir"/usr/bin/mn
}

# vim:set ts=2 sw=2 et:
