# Maintainer: Stuart Reilly <stu@reilly-family.co.uk>
_pkgname=ukulele
pkgname=$_pkgname-git
pkgver=r129.553d2d4
pkgrel=1
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
            'f7eeabdc2fdf4d2b14006a0eb36c0b3a99caf806eac5495ab07f23b49b599bfdc791423e14bd569f98fec80aa93f50292a6d0fef374658b1f3dbbd1cbbf1fa4d')

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
