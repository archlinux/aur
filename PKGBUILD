# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: Robert Gonciarz <goncairz (malpa) gmail (kropka) com>
# Maintainer: Kevin Baxmann <kvbx@kvbx.de>

pkgname=micronaut
pkgver=1.2.9
pkgrel=1
pkgdesc="Application Framework"
arch=('x86_64')
url="https://github.com/micronaut-projects/micronaut-core"
license=(Apache)
depends=('java-environment>=8')
source=(https://github.com/micronaut-projects/micronaut-core/archive/v${pkgver}.tar.gz)
sha512sums=('e235a8d75b36d648704e140682b7e0e0a93adfcc664b5276bce9966601536c068c75bebab1619731e093917918a11bfc80f3f96a390a67dd0c1c3cd378528272')

build() {

  function build_failed {
    if [ "$?" != "0" ]; then
      tput bold
      echo
      echo "Building may have failed due to an incompatible JDK."
      echo "Please set JAVA_HOME to a JDK compatible with gradle 4.6."
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
