# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=ripme
pkgver=2.1.4
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=11')
makedepends=('java-environment>=11')
source=("https://github.com/ripmeapp2/ripme/archive/$pkgver.tar.gz"
        ripme-gradle.patch)
sha256sums=('8c5884dabb4eb8342db63de03c81880f7556a735752b52cf6ad9e423e23025ba'
            '35f69383565fd3a19b1cae105be84c7b6632990253b2ead7bfd39ecb22324e48')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/ripme-gradle.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./gradlew clean build -x test
  cat <<EOF >ripme.sh
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "build/libs/ripme-2.1.3.jar" "$pkgdir/usr/share/java/ripme.jar"
  install -Dm755 ripme.sh "$pkgdir/usr/bin/ripme"
}
