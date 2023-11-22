# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>

pkgname=swt
pkgver=4.29
pkgrel=1
_date=202309031000
pkgdesc='An open source widget toolkit for Java'
arch=('x86_64')
url='https://www.eclipse.org/swt/'
license=('EPL')
depends=('java-runtime>=11' 'libxtst')
makedepends=(
  'ant'
  'glu'
  'gtk3'
  'gtk4'
  'java-runtime>=11'
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
sha256sums=('13b8d31153cf199e1aaa6f7dbff4f97ab61a256e78b8090fbcc55a363f02a697'
            'a5e60b4d1b23a728f62f0b46d32717e7c4a8ea773c3539ca2091a19bed898fad')

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
  sed -i 's/\(-fPIC\)/\1 -Wno-error=deprecated-declarations/' build.sh
  OUTPUT_DIR="$pkgdir/usr/lib" ./build.sh -gtk-all install
}
