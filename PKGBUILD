pkgname=ned-et-les-maki-git
pkgver=r1228.997110a
pkgrel=1
pkgdesc='Puzzle game with isometric 3d graphics inspired by Sokoban'
arch=('i686' 'x86_64')
license=('MIT' 'FAL')
url="http://geekygoblin.org/ned-et-les-maki/"
depends=('java-runtime')
makedepends=('maven' 'git')
source=("git+https://framagit.org/ggp/ned-et-les-maki.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ned-et-les-maki"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "$srcdir/ned-et-les-maki"
  mvn package
}

package ()
{
  cd "$srcdir/ned-et-les-maki"
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/java/ned-et-les-maki
  install -m644 core/target/nedetlesmaki-*.jar "$pkgdir"/usr/share/java/ned-et-les-maki
  install -m644 packages/generic/target/lib/*.jar "$pkgdir"/usr/share/java/ned-et-les-maki
  cp -r assets packages/generic/target/natives "$pkgdir"/usr/share/java/ned-et-les-maki
  echo "#!/bin/sh" > run
  echo 'exec "$JAVA_HOME/bin/java" -Djava.library.path=/usr/share/java/ned-et-les-maki/natives -jar `ls /usr/share/java/ned-et-les-maki/nedetlesmaki-lwjgl-*.jar` "$@"' >> run
  install -m755 run "$pkgdir"/usr/bin/nedetlesmaki
  install -D -m644 packages/deb/src/launchers/nedetlesmaki.desktop "$pkgdir"/usr/share/applications/nedetlesmaki.desktop
  sed -i "s|/opt/nedetlesmaki/data/|/usr/share/java/ned-et-les-maki/assets/|g" "$pkgdir"/usr/share/applications/nedetlesmaki.desktop
}
