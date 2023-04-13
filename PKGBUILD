# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Julien Machiels <julien.machiels@protonmail.com>
# Contributor: Erik Sonnleitner <es@delta-xi.net>
_pkgname=ripme
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=4
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime')
makedepends=('git')
provides=('ripme')
conflicts=('ripme')
source=("git+https://github.com/ripmeapp2/ripme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./gradlew clean build -x test
  cat <<EOF >ripme.sh
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 build/libs/ripme-*.jar "$pkgdir/usr/share/java/ripme.jar"
  install -Dm755 ripme.sh "$pkgdir/usr/bin/ripme"
}
