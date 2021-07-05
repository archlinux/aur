# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
pkgname=swt
pkgver=4.20
pkgrel=1
_date=202106111600
pkgdesc='An open source widget toolkit for Java'
arch=('x86_64')
url='https://www.eclipse.org/swt/'
license=('EPL')
depends=('java-runtime>=8' 'libxtst')
makedepends=('jdk8-openjdk' 'glu' 'unzip' 'pkgconfig' 'gtk3' 'gtk4' 'ant')
optdepends=('glu' 'gtk3' 'gtk4')

# Source isn't distributed separately from the binaries; we're not using the latter
source=(https://download.eclipse.org/eclipse/downloads/drops4/R-${pkgver}-${_date}/${pkgname}-${pkgver}-gtk-linux-${arch}.zip
        build-swt.xml)
sha256sums=('0d1ab552b95aab6df6c0499c934fd82864100dc638c43b6c1e793e740bb534c2'
            'e1a7d5763912e52e94fcaffc778e55dbf822ffba5eb0d7f5d5018e79d8bd79d4')

build() {
  unzip -oq src.zip -d src

  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

  # SWT jar
  ant -f build-swt.xml compile
  ant -f build-swt.xml jar

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
