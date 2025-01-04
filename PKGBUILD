# Maintainer: Lauri Niskanen <ape@ape3000.com>

_pkgname=firefly-luciferin
pkgname=${_pkgname}-git
pkgver=2.18.9r5.g8abf51a1
pkgrel=1
pkgdesc="Screen capture software for ambient and bias lighting"
arch=('any')
url="https://github.com/sblantipodi/firefly_luciferin"
license=('GPL-3.0-or-later')
depends=('jdk-openjdk>=23' 'jdk-openjdk<24' 'hicolor-icon-theme')
makedepends=('git' 'maven')
optdepends=(
  'xdg-desktop-portal-wlr: For Wayland screen capture support'
  'gst-plugin-pipewire: For Wayland screen capture support'
)
provides=('firefly-luciferin')
conflicts=('firefly-luciferin')
source=("git+$url.git" "firefly-luciferin")
sha256sums=('SKIP'
            '485478e0376e3d11fd9144c4fafc53b3b7ebc9858ef3b69165edb8e3c6a02717')

pkgver() {
  cd "$srcdir/firefly_luciferin"
  git describe --long --tags | sed 's/^v//;s/-/r/;s/-/./'
}

build() {
  cd "$srcdir/firefly_luciferin"
  JAVA_HOME=/usr/lib/jvm/java-23-openjdk mvn package
}

package() {
  cd "$srcdir/firefly_luciferin"

  mkdir -p "$pkgdir/usr/share/$pkgname/"

  install -Dm755 $srcdir/"${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm755 target/fireflyluciferin-*.jar "$pkgdir/usr/share/$pkgname/"
  install -Dm755 "target/FireflyLuciferin-jar-with-dependencies.jar" "$pkgdir/usr/share/$pkgname/FireflyLuciferin-jar-with-dependencies.jar"

  sed -i 's/^Exec=FireflyLuciferin$/Exec=firefly-luciferin/' "target/classes/build_assets/org.dpsoftware.FireflyLuciferin.desktop"
  install -Dm644 "target/classes/build_assets/org.dpsoftware.FireflyLuciferin.desktop" "$pkgdir/usr/share/applications/org.dpsoftware.FireflyLuciferin.desktop"
  install -Dm644 "target/classes/build_assets/org.dpsoftware.FireflyLuciferin.appdata.xml" "$pkgdir/usr/share/metainfo/org.dpsoftware.FireflyLuciferin.appdata.xml"
  install -Dm644 "target/classes/build_assets/org.dpsoftware.FireflyLuciferin.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.dpsoftware.FireflyLuciferin.svg"

  mkdir -p "$pkgdir/usr/share/$pkgname/classes/"
  cp -r "target/classes/org" "$pkgdir/usr/share/$pkgname/classes/"
  find "$pkgdir/usr/share/$pkgname/classes/org" -type f -name '*.class' -delete
  find "$pkgdir/usr/share/$pkgname/classes/org" -type d -empty -delete
}
