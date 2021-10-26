# Maintainer: Stuart Reilly <stu@reilly-family.co.uk>
_pkgname=ukulele
pkgname=$_pkgname-git
pkgver=r129.553d2d4
pkgrel=2
pkgdesc="Simple self-contained Discord music bot"
arch=('any')
url="https://github.com/freyacodes/ukulele"
license=('MIT')
groups=()
depends=('java-runtime>=11')
makedepends=('java-environment>=11' 'gradle' 'git' 'sed')
provides=()
conflicts=()
backup=('etc/ukulele/ukulele.yml')
install="ukulele.install"
source=('git+https://github.com/freyacodes/ukulele.git' 'ukulele.service')
sha512sums=('SKIP'
            '566ae27160a02f2318e2f7211fe074c7429cf462762b568014e4fc666f94f51c27af2a1600a6f73e03d378dfc255b7b8a0038f55b5ceb71232e5c6c0b73ba653')

build() {
  cd "$srcdir/$_pkgname"

  _daemon_flag=""
  if [[ `./gradlew --status | grep "No Gradle daemons are running"` ]]; then
    _daemon_flag="--no-daemon"
  fi

  ./gradlew $_daemon_flag build
}

package() {
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "$srcdir/ukulele.service"

  cd "$srcdir/$_pkgname"

  install -Dm0644 -t "$pkgdir/usr/share/java/$_pkgname/" "build/libs/$_pkgname.jar"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
  install -TDm0644 "$_pkgname.example.yml" "$pkgdir/etc/$_pkgname/$_pkgname.yml"
  sed -i "s|.*database:.*|  database: \"/usr/share/ukulele/ukuklele.database\"|g" "$pkgdir/etc/$_pkgname/$_pkgname.yml"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
