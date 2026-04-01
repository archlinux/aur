# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
# Contributor: William Luc Ritchie <luc dot ritchie at gmail dot com>

_pkgname=fernflower
pkgname=$_pkgname-git
pkgver=261.22158.277
pkgrel=1
pkgdesc='An analytical decompiler for Java'
arch=('any')
url='https://github.com/fesh0r/fernflower'
license=('Apache-2.0')
depends=('java-runtime>=8' 'bash')
makedepends=('git' 'apache-ant')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname || exit
  git describe --long --tags --abbrev=7 | sed 's/^idea\///;s/^pycharm\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname || exit
  ./gradlew jar
}

package() {
  cd $_pkgname || exit
  install -Dm644 "build/libs/$_pkgname.jar" "$pkgdir/usr/share/java/$_pkgname/$pkgname.jar"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -d "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec java -jar /usr/share/java/%s/%s.jar "$@"\n' $_pkgname $pkgname > "$pkgdir/usr/bin/$_pkgname"
  chmod 755 "$pkgdir/usr/bin/$_pkgname"
}
