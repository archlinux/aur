# Maintainer: Dwi Mulia Mokoginta <dwi-mulia-mokoginta@protonmail.com>
# Contributor: dreamscached <dreamscache.d@gmail.com>

pkgname="recaf"
pkgver=4.0.0
pkgrel=3
pkgdesc='A modern Java bytecode editor'
url='https://github.com/Col-E/Recaf'
license=('MIT')
arch=('any')

depends=('java-environment>=22' 'java-openjfx>=24' 'ttf-font')
makedepends=('jdk-openjdk>=22' 'gradle')

conflicts=("$pkgname-bin" "$pkgname-git" 'java-openjfx-bin')
provides=("$pkgname")

source=(
  "$pkgname-$pkgver-alpha.tar.gz::$url/archive/refs/tags/$pkgver-alpha.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/Col-E/Recaf/$pkgver-alpha/LICENSE"
  "$pkgname"
  "$pkgname.desktop"
)

sha256sums=('ef3dc4884802173816ac104d61f56e58ff86d2f094cf369385795a2e6d569478'
            'a98659971ead7e75b30f8d4ef8c27d13338c6187a49fee181379e74b89d4a16f'
            '0081969d88d8c5795ae674837c95b89115c98a098e74335764edd99637448b1e'
            'a44c16bd628e5066f648fb9dc80ddc36cb94d3d014f487234b4e93c8a9ae7d91')

build() {
  cd "$srcdir/Recaf-$pkgver-alpha"

  export TARGET_VERSION=24

  JAVA_HOME="/usr/lib/jvm/default-runtime" /usr/bin/gradle assemble -x compileTestJava -Dskip_jfx_bundle=true
}

package() {
  cd "$srcdir/Recaf-$pkgver-alpha"

  sed -i "/^Version=/c\Version=$pkgver" "$srcdir/$pkgname.desktop"
  sed -i "/^Comment=/c\Comment=$pkgdesc" "$srcdir/$pkgname.desktop"

  install -Dm755 "recaf-ui/build/libs/recaf-ui-$pkgver-SNAPSHOT-all.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 "recaf-ui/src/main/resources/icons/logo-full.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/recaf"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop" 
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

