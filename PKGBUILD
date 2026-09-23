# Maintainer: Lauri Niskanen <ape@ape3000.com>

_pkgname=firefly-luciferin
pkgname=${_pkgname}-git
pkgver=2.28.4r32.g35b32cef
pkgrel=1
pkgdesc="Screen capture software for ambient and bias lighting"
arch=('any')
url="https://github.com/sblantipodi/firefly_luciferin"
license=('GPL-3.0-or-later')
depends=('archlinux-java-run' 'java-runtime>=25' 'hicolor-icon-theme')
makedepends=('git' 'maven' 'java-environment>=25')
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
            '46e4a7d9828fafb2374c52fc0a44928762e003747c62d448cd850d91d5add8e4')

pkgver() {
  cd "$srcdir/firefly_luciferin"
  git describe --long --tags | sed 's/^v//;s/-/r/;s/-/./'
}

build() {
  cd "$srcdir/firefly_luciferin"
  archlinux-java-run --min 25 --feature jdk --exec -- mvn package
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
