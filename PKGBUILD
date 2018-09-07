# $Id$
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Romain Gautier <romain.gautier@nimamoh.com>

pkgname=kotlin
pkgver=1.2.60
pkgrel=1
pkgdesc='Statically typed programming language that can interoperate with Java'
arch=('any')
url='https://kotlinlang.org/'
license=('APACHE' 'custom')
depends=('java-environment>=8')
makedepends=('setconf')
source=("https://github.com/JetBrains/kotlin/releases/download/v${pkgver/_/-}/kotlin-compiler-${pkgver/_/-}.zip")
sha256sums=('ff79f695c9be0a500d4b56a69d0b8657b3d106d78a35101e792248af904a623d')

prepare() {
  cd "${pkgname}c/bin"

  setconf kotlin      DIR         "/usr/bin"
  setconf kotlinc-js  DIR         "/usr/bin"
  setconf kotlinc-jvm DIR         "/usr/bin"
  setconf kotlinc     KOTLIN_HOME "/usr/share/$pkgname"
}

package() {
  cd "${pkgname}c"

  # executables
  install -Dm755 bin/kotlin      "$pkgdir/usr/bin/kotlin"
  install -Dm755 bin/kotlinc     "$pkgdir/usr/bin/kotlinc"
  install -Dm755 bin/kotlinc-js  "$pkgdir/usr/bin/kotlinc-js"
  install -Dm755 bin/kotlinc-jvm "$pkgdir/usr/bin/kotlinc-jvm"

  # jar files
  cd "$srcdir/${pkgname}c/lib"
  install -d "$pkgdir/usr/share/$pkgname/lib"
  for jar in *.jar; do
    install -Dm644 "$jar" "$pkgdir/usr/share/$pkgname/lib"
  done

  # licenses
  cd "$srcdir/${pkgname}c/license"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 NOTICE.txt "$pkgdir/usr/share/licenses/$pkgname"

  cd third_party
  for txt in *.txt; do
    install -Dm644 "$txt" "$pkgdir/usr/share/licenses/$pkgname"
  done

  # build.txt must be installed for for "-version" to work
  cd "$srcdir/${pkgname}c"
  install -Dm644 build.txt "$pkgdir/usr/share/$pkgname"
}

# getver: github.com/JetBrains/kotlin/releases/latest
# vim: ts=2 sw=2 et:
