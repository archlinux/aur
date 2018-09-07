# Maintainer: Dominic Meiser <aur@msrd0.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Romain Gautier <romain.gautier@nimamoh.com>

pkgname=kotlin-eap
pkgver=1.3_M2
pkgrel=1
pkgdesc='EAP - Statically typed programming language that can interoperate with Java'
arch=('any')
url='https://kotlinlang.org/'
license=('APACHE' 'custom')
depends=('java-environment>=8')
makedepends=('setconf')
conflicts=(kotlin)
provides=(kotlin)
source=("https://github.com/JetBrains/kotlin/releases/download/v${pkgver/_/-}/kotlin-compiler-${pkgver/_/-}.zip")
sha256sums=('a39ae5aec9101c5078eeff1e1f49293036eb602585c9bc9d4b4d3c90a059aff6')

prepare() {
  cd "kotlinc/bin"

  setconf kotlin      DIR         "/usr/bin"
  setconf kotlinc-js  DIR         "/usr/bin"
  setconf kotlinc-jvm DIR         "/usr/bin"
  setconf kotlinc     KOTLIN_HOME "/usr/share/$pkgname"
}

package() {
  cd "kotlinc"

  # executables
  install -Dm755 bin/kotlin      "$pkgdir/usr/bin/kotlin"
  install -Dm755 bin/kotlinc     "$pkgdir/usr/bin/kotlinc"
  install -Dm755 bin/kotlinc-js  "$pkgdir/usr/bin/kotlinc-js"
  install -Dm755 bin/kotlinc-jvm "$pkgdir/usr/bin/kotlinc-jvm"

  # jar files
  cd "$srcdir/kotlinc/lib"
  install -d "$pkgdir/usr/share/$pkgname/lib"
  for jar in *.jar; do
    install -Dm644 "$jar" "$pkgdir/usr/share/$pkgname/lib"
  done

  # licenses
  cd "$srcdir/kotlinc/license"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 NOTICE.txt "$pkgdir/usr/share/licenses/$pkgname"

  cd third_party
  for txt in *.txt; do
    install -Dm644 "$txt" "$pkgdir/usr/share/licenses/$pkgname"
  done

  # build.txt must be installed for for "-version" to work
  cd "$srcdir/kotlinc"
  install -Dm644 build.txt "$pkgdir/usr/share/$pkgname"
}

# getver: github.com/JetBrains/kotlin/releases/latest
# vim: ts=2 sw=2 et:
