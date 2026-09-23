# Maintainer: Lauri Niskanen <ape@ape3000.com>

_pkgname=firefly-luciferin
pkgname=${_pkgname}-git
pkgver=2.28.4r32.g35b32cef
pkgrel=1
pkgdesc="Screen capture software for ambient and bias lighting"
arch=('any')
url="https://github.com/sblantipodi/firefly_luciferin"
license=('GPL-3.0-or-later')
depends=('jdk-openjdk>=27' 'jdk-openjdk<28' 'hicolor-icon-theme')
makedepends=('git' 'maven')
optdepends=(
  'xdg-desktop-portal-wlr: For PipeWire XDG screen capture support (Wayland)'
  'gst-plugin-pipewire: For PipeWire XDG screen capture support (Wayland)'
  'gst-plugins-good: For Ximagesrc screen capture support (X11)'
  'libappindicator-gtk3: For tray icon support (either one)'
  'libayatana-appindicator: For tray icon support (either one)'
)
provides=('firefly-luciferin')
conflicts=('firefly-luciferin')
source=("git+$url.git" "firefly-luciferin")
sha256sums=('SKIP'
            'a6318e503ee3a4b3e1596b74866d5762d334021976e5898fd5c317449be55874')

pkgver() {
  cd "$srcdir/firefly_luciferin"
  git describe --long --tags | sed 's/^v//;s/-/r/;s/-/./'
}

build() {
  cd "$srcdir/firefly_luciferin"
  JAVA_HOME=/usr/lib/jvm/java-27-openjdk mvn package
}

package() {
  cd "$srcdir/firefly_luciferin"

  mkdir -p "$pkgdir/usr/share/${_pkgname}/"
  install -Dm755 $srcdir/"${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 target/fireflyluciferin-*.jar "$pkgdir/usr/share/${_pkgname}/"
  install -Dm644 "target/FireflyLuciferin-jar-with-dependencies.jar" "$pkgdir/usr/share/${_pkgname}/FireflyLuciferin-jar-with-dependencies.jar"

  sed -i 's/^Exec=FireflyLuciferin$/Exec=firefly-luciferin/' "target/classes/build_assets/org.dpsoftware.FireflyLuciferin.desktop"
  install -Dm644 "target/classes/build_assets/org.dpsoftware.FireflyLuciferin.desktop" "$pkgdir/usr/share/applications/org.dpsoftware.FireflyLuciferin.desktop"
  install -Dm644 "target/classes/build_assets/org.dpsoftware.FireflyLuciferin.appdata.xml" "$pkgdir/usr/share/metainfo/org.dpsoftware.FireflyLuciferin.appdata.xml"
  install -Dm644 "target/classes/build_assets/org.dpsoftware.FireflyLuciferin.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.dpsoftware.FireflyLuciferin.svg"

  mkdir -p "$pkgdir/usr/share/${_pkgname}/classes/org/dpsoftware/gui"
  cp -r "target/classes/org/dpsoftware/gui/img" "$pkgdir/usr/share/${_pkgname}/classes/org/dpsoftware/gui/"
}
