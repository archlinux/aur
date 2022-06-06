# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>

pkgname=swt
pkgver=4.23
pkgrel=1
_date=202203080310
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
  'jdk11-openjdk'
  'pkgconfig'
  'unzip'
  'webkit2gtk'
)
optdepends=('glu' 'gtk3' 'gtk4')

_archive="${pkgname}-${pkgver}-gtk-linux-${arch}.zip"
source=(
  "https://download.eclipse.org/eclipse/downloads/drops4/R-${pkgver}-${_date}/${_archive}"
  "build-swt.xml"
  "fix-libjawt-detection.patch"
)
noextract=("$_archive")
sha256sums=(
  'c3dedfc39ba684e7df29db0b61faebe4ae9ae8a76833024339e914e31fec7b15'
  'a5e60b4d1b23a728f62f0b46d32717e7c4a8ea773c3539ca2091a19bed898fad'
  'c93dfc8f9762d150c03dccb595052041177652990ebb27174bfc91889f80e195'
)

prepare() {
  unzip -oq "$_archive" -d "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"

  unzip -oq src.zip

  patch --forward --strip=1 --input="$srcdir/fix-libjawt-detection.patch"
}

build() {
  cd "$pkgname-$pkgver"

  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
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
  OUTPUT_DIR="$pkgdir/usr/lib" ./build.sh -gtk-all install
}
