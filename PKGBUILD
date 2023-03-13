# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=jd-gui
pkgver=1.6.6
pkgrel=2
pkgdesc='A standalone graphical utility that displays Java source codes of .class files'
arch=('any')
url='http://jd.benow.ca/'
license=('GPL3')
depends=('java-runtime')
makedepends=('java-environment=8' 'gradle')
provides=('jd-gui')
conflicts=('jd-gui-bin')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/java-decompiler/jd-gui/archive/v$pkgver.tar.gz"
  "jd-gui"
  "jd-gui.desktop"
  "gradle-7-build.patch"
)
b2sums=('8615221af81682a8f6f8143ef6b639842964a402fa6a703379d02aef993960891ed2fc1e49b7ac71ae9f556068c48a8cf75e67cf40ba82853239bd80a7b0720f'
        'df30247b24a2b1b65f2f9d7a9577e847349edb1e6f67fd5021bf1ce0cc4d6741d1df52b026a0dd2365c1e3138daad700dd495d362253b2f9259d0cc4556ddcae'
        '7a1667fceea415d1788d0cf04bd482c5cbbab937d0835936809aa327aa9a81ab0d9a0fb5296b1853b1e38853de16924682a0afe73e1058cc5a8fd0b22b828ff6'
        '9c56f2bd3ac89c6a5acb70b3a37a4b24277cf0a4487ed9fcf95c3833e5b8bae87f61da6a147e12f4ffbb3dae371d68803a97d09b088c7f807ffc1157d47a15b8')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/gradle-7-build.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk/ gradle --no-daemon build --stacktrace
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build/libs"
  install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/jd-gui" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/jd-gui.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644  "$srcdir/$pkgname-$pkgver/src/linux/resources/jd_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
