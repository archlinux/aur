# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=ripme
pkgver=2.1.3
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=11')
makedepends=('java-environment>=11')
source=("https://github.com/ripmeapp2/ripme/archive/$pkgver.tar.gz"
        ripme-gradle.patch)
sha256sums=('bda7ab04dd3e45f7a81e9e9f068aba65a92686a003a0823655240319e8949bd8'
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
  install -Dm644 "build/libs/ripme-$pkgver.jar" "$pkgdir/usr/share/java/ripme.jar"
  install -Dm755 ripme.sh "$pkgdir/usr/bin/ripme"
}
