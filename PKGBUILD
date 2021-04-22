# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
pkgname=swt
# http://download.eclipse.org/eclipse/downloads/drops4
pkgver=4.6.3
pkgrel=2
_date=201703010400
pkgdesc='An open source widget toolkit for Java'
arch=('x86_64')
url='https://www.eclipse.org/swt/'
license=('EPL')
depends=('java-runtime>=7' 'libxtst')
makedepends=('jdk8-openjdk' 'glu' 'unzip' 'pkgconfig' 'gtk2' 'gtk3' 'ant')
optdepends=('glu' 'gtk2' 'gtk3')

# Source isn't distributed separately from the binaries; we're not using the latter
source=(https://archive.eclipse.org/eclipse/downloads/drops4/R-${pkgver}-${_date}/swt-${pkgver}-gtk-linux-x86_64.zip
        build-swt.xml)
sha256sums=('005dd6bfb20919f9fe7c681864d3f30a5b3eae112da8bdab2bf418978bbbd7aa'
            '3d30fbde25a6a6d260d04cb1782b7618c2a0a926440935a9eea516146eb0e1e1')

# These examples don't even run anymore (Try Tux Guitar instead)!
# http://www.eclipse.org/swt/examples.php#standaloneOutsideEclipse
# http://download.eclipse.org/eclipse/downloads/

# http://mirror.ibcp.fr/pub/eclipse/eclipse/downloads/drops4/R-4.4-201406061215/org.eclipse.sdk.examples.source-4.4.zip

build() {
  unzip -oq src.zip -d src

  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

  # SWT jar
  ant -f build-swt.xml compile
  ant -f build-swt.xml jar

  # Not building shared objects here as -gtk-all clobbers
}

package() {
  cd src

  # SWT jar
  install -Dm644 ../swt.jar "$pkgdir/usr/share/java/swt-$pkgver.jar"
  ln -s swt-$pkgver.jar "$pkgdir/usr/share/java/swt.jar"

  # Shared objects
  install -d "$pkgdir/usr/lib"
  OUTPUT_DIR="$pkgdir/usr/lib" ./build.sh -gtk-all install
}
