# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>

pkgname=swt
pkgver=4.35
pkgrel=1
_date=202502280140
pkgdesc='An open source widget toolkit for Java'
arch=('x86_64')
url='https://www.eclipse.org/swt/'
license=('EPL-2.0')
depends=('java-runtime>=17' 'libxtst')
makedepends=(
  'ant'
  'glu'
  'gtk3'
  'gtk4'
  'java-runtime>=17'
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
sha256sums=('8f883ae19f8c8ac292b11f2ebc1b65800ffa3d9c3a9af135c3d55a676dd11547'
            'e382ae40d3a437b10a960bab81800a5e372769011ab591de2ce11426d52e6b37')

prepare() {
  unzip -oq "$_archive" -d "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"

  unzip -oq src.zip
}

build() {
  cd "$pkgname-$pkgver"

  export JAVA_HOME=/usr/lib/jvm/$(archlinux-java get)
  export SWT_JAVA_HOME=${JAVA_HOME}
  ant -f $srcdir/build-swt.xml compile
  ant -f $srcdir/build-swt.xml jar
}

package() {
  cd "$pkgname-$pkgver"

  # SWT jar
  install -Dm644 swt.jar "$pkgdir/usr/share/java/swt-$pkgver.jar"
  ln -s "swt-$pkgver.jar" "$pkgdir/usr/share/java/swt.jar"

  # Shared objects
  install -d "$pkgdir/usr/lib"
  sed -i 's/\(-fPIC\)/\1 -Wno-error=deprecated-declarations/' library/build.sh
  OUTPUT_DIR="$pkgdir/usr/lib" ./library/build.sh -gtk-all install
}
