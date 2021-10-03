# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>

pkgname=swt
pkgver=4.21
pkgrel=1
_date=202109060500
pkgdesc='An open source widget toolkit for Java'
arch=('x86_64')
url='https://www.eclipse.org/swt/'
license=('EPL')
depends=('java-runtime>=8' 'libxtst')
makedepends=(
  'ant'
  'glu'
  'gtk3'
  'gtk4'
  'jdk8-openjdk'
  'pkgconfig'
  'unzip'
  'webkit2gtk'
)
optdepends=('glu' 'gtk3' 'gtk4')

_archive="${pkgname}-${pkgver}-gtk-linux-${arch}.zip"
source=(
  "https://download.eclipse.org/eclipse/downloads/drops4/R-${pkgver}-${_date}/${_archive}"
  "build-swt.xml"
)
noextract=("$_archive")
sha256sums=(
  '3e35a4ababf504bcf64df864e4a957aaa2f0dec9696a922d936c7ee224fa4c5f'
  'c2557350f11ebe935e727e3a1b16a69076569e4ebbdabac263aaf60e92996907'
)

prepare() {
  unzip -oq "$_archive" -d "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"

  unzip -oq src.zip
  cp $srcdir/build-swt.xml .

  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

  ant -f build-swt.xml compile
  ant -f build-swt.xml jar
}

package() {
  cd "$pkgname-$pkgver"

  # SWT jar
  install -Dm644 swt.jar "$pkgdir/usr/share/java/swt-$pkgver.jar"
  ln -s "swt-$pkgver.jar" "$pkgdir/usr/share/java/swt.jar"

  # Shared objects
  install -d "$pkgdir/usr/lib"
  OUTPUT_DIR="$pkgdir/usr/lib" ./build.sh -gtk-all install
}
