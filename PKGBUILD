# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=jd-gui
pkgver=1.4.0
pkgrel=3
pkgdesc='A standalone graphical utility that displays Java source codes of .class files'
arch=('any')
url='http://jd.benow.ca/'
license=('GPL3')
depends=('java-runtime')
makedepends=('gradle')
provides=('jd-gui')
conflicts=('jd-gui-bin')
source=(
  "https://github.com/java-decompiler/jd-gui/archive/v${pkgver}.tar.gz"
  "https://patch-diff.githubusercontent.com/raw/java-decompiler/jd-gui/pull/92.patch"
  "jd-gui.desktop"
)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../92.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
  gradle -DgradleUserHomeDir=../.gradle build --stacktrace
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build/libs"
  install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -d "$pkgdir/usr/bin"
  echo -e "#!/bin/sh\nexec java -jar /usr/share/java/$pkgname/$pkgname.jar" '"$@"' > "$pkgdir/usr/bin/$pkgname"
  chmod 755 "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/jd-gui.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644  "$srcdir/$pkgname-$pkgver/src/linux/resources/jd_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

sha1sums=('649111b4c79282803c4505d4c587537277f09a79'
          '14d380b86c0132b62dc6651d2c5380677efe8bec'
          '8c5d2cf8505bca50cbb0ba2778e3e908982cd99d')
sha256sums=('5dd1220e7426352d51fa9eadb8a7d9685a6d7d93646c3fabae6f964cbf3edf2a'
            'ffa695b3ec481ef1ba15981e34655181fed92191b703746c378a7ccf6bb926c2'
            '4846cb2382fabae07febd9315b19e0a60b3ad7449dcf45e3f7dd535e1f4ca8a6')
sha512sums=('3e2c6224d8252f66fab61f74aaa4199b6fd2a6ad475418e80e1b31fcdf5a4d7fc3f8ce04fa729843e53029e656865f6eac62aa5306518a0770aecc41708f92a6'
            '81cf3677e19477571165a33a1b763968870154ebf911c5176f2320cbab1d66fb4e11d9b2882aff27d967ce19016f9db89b6f07aa64cdbb0d7cb4992e967320bd'
            '9ddb8521c1791f5d3251f012e30b7d6aaa48b509e02af628f3b8a90fb6ba176de3f79fbfbec316c86c1594ac142ca4d85bcffff7ea8f0fba6f926ea78cd1f81d')
