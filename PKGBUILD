# Maintainer: Tyler Cook <tcc@sandpolis.com>
pkgbase=sandpolis-git
pkgname=('sandpolis-server-git' 'sandpolis-viewer-git' 'sandpolis-viewer-cli-git')
pkgver=r750.4a370c73
pkgrel=1
pkgdesc='Ultimate remote management utility'
arch=('any')
url='https://github.com/Subterranean-Security/Sandpolis'
license=('Apache 2')
depends=('java-runtime>=13')
makedepends=('java-environment>=13' 'git')
source=("git+https://github.com/Subterranean-Security/Sandpolis.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/Sandpolis"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Sandpolis"
  ./gradlew --no-daemon -g "$startdir/.gradle" jar
}

check() {
  cd "$srcdir/Sandpolis"
  ./gradlew --no-daemon -g "$startdir/.gradle" test
}

package_sandpolis-server-git() {
  conflicts=('sandpolis-server')
  provides=('sandpolis-server')
  install=sandpolis-server.install

  cd "$srcdir/Sandpolis"

  # Install libraries
  ./gradlew --no-daemon -q -g "$startdir/.gradle" \
      -Dlib_dest="$pkgdir/usr/share/java/sandpolis-server/lib" :com.sandpolis.server.vanilla:install

  # Install scripts
  install -m755 -D "$startdir/sandpolis-server.sh" "$pkgdir/usr/bin/sandpolis-server"

  # Setup database directory
  install -d "$pkgdir/var/lib/sandpolis-server/db"

  # Setup gen directory
  install -d "$pkgdir/var/lib/sandpolis-server/gen"

  # Setup log directory
  install -d "$pkgdir/var/log/sandpolis-server"

  # Setup plugin directory
  install -d "$pkgdir/usr/share/java/sandpolis-server/plugin"

  # Install systemd unit
  install -m644 -D "$startdir/sandpolis-server.service" "$pkgdir/usr/lib/systemd/system/sandpolisd.service"
}

package_sandpolis-viewer-git() {
  conflicts=('sandpolis-viewer')
  provides=('sandpolis-viewer')

  cd "$srcdir/Sandpolis"

  # Install libraries
  ./gradlew --no-daemon -q -g "$startdir/.gradle" \
      -Dlib_dest="$pkgdir/usr/share/java/sandpolis-viewer/lib" :com.sandpolis.viewer.jfx:install

  # Install scripts
  install -m755 -D "$startdir/sandpolis-viewer.sh" "$pkgdir/usr/bin/sandpolis-viewer"

  # Setup log directory
  install -d "$pkgdir/var/log/sandpolis-viewer"

  # Setup plugin directory
  install -d "$pkgdir/usr/share/java/sandpolis-viewer/plugin"
}

package_sandpolis-viewer-cli-git() {
  conflicts=('sandpolis-viewer-cli')
  provides=('sandpolis-viewer-cli')

  cd "$srcdir/Sandpolis"

  # Install libraries
  ./gradlew --no-daemon -q -g "$startdir/.gradle" \
      -Dlib_dest="$pkgdir/usr/share/java/sandpolis-viewer-cli/lib" :com.sandpolis.viewer.cli:install

  # Install scripts
  install -m755 -D "$startdir/sandpolis-viewer-cli.sh" "$pkgdir/usr/bin/sandpolis-viewer-cli"

  # Setup log directory
  install -d "$pkgdir/var/log/sandpolis-viewer-cli"

  # Setup plugin directory
  install -d "$pkgdir/usr/share/java/sandpolis-viewer-cli/plugin"
}
