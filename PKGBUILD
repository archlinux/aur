# Maintainer: Drew Noel <dnoel@gdssecurity.com>
pkgname=ysoserial-git
pkgrel=1
pkgver=v0.0.6.r2.g2874a69
pkgdesc="Tool to generate payloads that exploit unsafe Java object deserialization"
arch=("any")
url="https://github.com/frohoff/ysoserial"
license=('MIT')
depends=("java-environment=8")
makedepends=("maven")
provides=("ysoserial")
source=("git+https://github.com/frohoff/ysoserial.git" "0001-Force-1.8.patch" "ysoserial.command")
md5sums=('SKIP'
         'af0fe7db4bd0c93d89f03fc8188930bd'
         'd9fb33a927b0ee7864b80257ab6a2269')

pkgver() {
  cd "ysoserial"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "ysoserial"
    patch --forward --strip=1 --input="${srcdir}/0001-Force-1.8.patch"
}

build() {
    cd "ysoserial"
    mvn clean package -DskipTests -DoutputDirectory="ysoserial/maven"
}

package() {
    install -Dm644 ysoserial/target/ysoserial-0.0.6-SNAPSHOT-all.jar "$pkgdir/usr/share/java/ysoserial.jar"
    install -Dm755 ysoserial.command "$pkgdir/usr/bin/ysoserial"
}
