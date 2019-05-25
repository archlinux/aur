# Maintainer: Tyler Cook <tcc@sandpolis.com>
pkgbase=sandpolis-git
pkgname=('sandpolis-server-git' 'sandpolis-viewer-git' 'sandpolis-viewer-cli-git')
pkgver=r509.4a6d3e8
pkgrel=1
pkgdesc='Ultimate remote management utility'
arch=('any')
url='https://github.com/Subterranean-Security/Sandpolis'
license=('Apache 2')
depends=('java-runtime>=11')
makedepends=('java-environment>=11' 'git')
source=("git+https://github.com/Subterranean-Security/Sandpolis.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/Sandpolis"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Sandpolis"
  ./gradlew -g "$startdir/.gradle" assemble

  # Get Gradle to output all dependencies
  ./gradlew -g "$startdir/.gradle" -q \
      :com.sandpolis.server.vanilla:installDependencies <<< "$startdir/lib_sandpolis-server"
  ./gradlew -g "$startdir/.gradle" -q \
      :com.sandpolis.viewer.jfx:installDependencies <<< "$startdir/lib_sandpolis-viewer"
  ./gradlew -g "$startdir/.gradle" -q \
      :com.sandpolis.viewer.cli:installDependencies <<< "$startdir/lib_sandpolis-viewer-cli"
}

check() {
  cd "$srcdir/Sandpolis"
  ./gradlew -g "$startdir/.gradle" test
}

package_sandpolis-server-git() {
  conflicts=('sandpolis-server')
  provides=('sandpolis-server')
  install=sandpolis-server.install

  # Install binaries to /usr/share/java/sandpolis-server
  install -m644 -D "$srcdir"/Sandpolis/com.sandpolis.server.vanilla/build/libs/*.jar \
      "$pkgdir/usr/share/java/sandpolis-server/com.sandpolis.server.vanilla.jar"

  # Install dependencies to /usr/share/java/sandpolis-server/lib
  mv "$startdir/lib_sandpolis-server" "$pkgdir/usr/share/java/sandpolis-server/lib"

  # Install script stubs to /usr/bin
  install -m755 -D "$startdir/sandpolis-server.sh" "$pkgdir/usr/bin/sandpolis-server"

  # Setup database directory in /var/lib/sandpolis-server/db
  install -d "$pkgdir/var/lib/sandpolis-server/db"

  # Setup gen directory in /var/lib/sandpolis-server/gen
  install -d "$pkgdir/var/lib/sandpolis-server/gen"

  # Setup log directory in /var/log/sandpolis-server
  install -d "$pkgdir/var/log/sandpolis-server"

  # Install systemd unit
  install -m644 -D "$startdir/sandpolis-server.service" "$pkgdir/usr/lib/systemd/system/sandpolisd.service"
}

package_sandpolis-viewer-git() {
  conflicts=('sandpolis-viewer')
  provides=('sandpolis-viewer')

  # Install binaries to /usr/share/java/sandpolis-viewer
  install -m644 -D "$srcdir"/Sandpolis/com.sandpolis.viewer.jfx/build/libs/*.jar \
      "$pkgdir/usr/share/java/sandpolis-viewer/com.sandpolis.viewer.jfx.jar"

  # Install dependencies to /usr/share/java/sandpolis-viewer/lib
  mv "$startdir/lib_sandpolis-viewer" "$pkgdir/usr/share/java/sandpolis-viewer/lib"

  # Install script stubs to /usr/bin
  install -m755 -D "$startdir/sandpolis-viewer.sh" "$pkgdir/usr/bin/sandpolis-viewer"
}

package_sandpolis-viewer-cli-git() {
  conflicts=('sandpolis-viewer-cli')
  provides=('sandpolis-viewer-cli')

  # Install binaries to /usr/share/java/sandpolis-viewer-cli
  install -m644 -D "$srcdir"/Sandpolis/com.sandpolis.viewer.cli/build/libs/*.jar \
      "$pkgdir/usr/share/java/sandpolis-viewer-cli/com.sandpolis.viewer.cli.jar"

  # Install dependencies to /usr/share/java/sandpolis-viewer-cli/lib
  mv "$startdir/lib_sandpolis-viewer-cli" "$pkgdir/usr/share/java/sandpolis-viewer-cli/lib"

  # Install script stubs to /usr/bin
  install -m755 -D "$startdir/sandpolis-viewer-cli.sh" "$pkgdir/usr/bin/sandpolis-viewer-cli"
}
