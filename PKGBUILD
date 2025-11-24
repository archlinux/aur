# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
# Contributor: William Luc Ritchie <luc dot ritchie at gmail dot com>

_pkgname=fernflower
pkgname=$_pkgname-git
pkgver=r812.7261c6b7
pkgrel=1
pkgdesc='An analytical decompiler for Java'
arch=('any')
url='https://github.com/fesh0r/fernflower'
license=('Apache-2.0')
depends=('java-runtime>=8' 'bash')
makedepends=('git' 'apache-ant' 'java-runtime<=17')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./gradlew jar
}

package() {
  cd $_pkgname
  install -Dm644 "build/libs/$_pkgname.jar" "$pkgdir/usr/share/java/$_pkgname/$pkgname.jar"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -d "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec java -jar /usr/share/java/%s/%s.jar "$@"\n' $_pkgname $pkgname > "$pkgdir/usr/bin/$_pkgname"
  chmod 755 "$pkgdir/usr/bin/$_pkgname"
}
