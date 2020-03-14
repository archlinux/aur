# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Julien Machiels <julien.machiels@protonmail.com>
# Contributor: Erik Sonnleitner <es@delta-xi.net>
_pkgname=ripme
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=3
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/RipMeApp/ripme"
license=('MIT')
depends=('java-runtime')
makedepends=('git' 'maven')
provides=('ripme')
conflicts=('ripme')
source=("git+https://github.com/RipMeApp/ripme")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  mvn clean compile assembly:single
  cat << EOF > "$_pkgname.sh"
#!/bin/sh
exec java -jar /usr/share/java/$_pkgname.jar "\$@"
EOF
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 "target/$_pkgname-$(git describe --tags --abbrev=0)-jar-with-dependencies.jar" \
    "$pkgdir/usr/share/java/$_pkgname.jar"
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
