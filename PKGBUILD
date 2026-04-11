# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=speedofsound
_app_id="io.$pkgname.SpeedOfSound"
pkgver=0.12.0
pkgrel=1
_java_ver=25
pkgdesc="Voice typing for the Linux desktop."
arch=('any')
url="https://www.speedofsound.io"
license=('MIT')
depends=(
  'alsa-lib'
  'alsa-plugins'
  'gstreamer'
  'gtk4'
  "java-runtime>=${_java_ver}"
  'libadwaita'
)
makedepends=(
  'git'
  'git-lfs'
  "java-environment=${_java_ver}"
  'meson'
)
source=("git+https://github.com/zugaldia/speedofsound.git#tag=v$pkgver")
sha256sums=('bab39762e8839d203c1d023cc2ce530d8e02494651b77b04cad9b9e214b4b3c1')

prepare() {
  cd "$pkgname"
  git lfs install --local
  git remote add network-origin https://github.com/zugaldia/speedofsound
  git lfs pull network-origin
}

build() {
  cd "$pkgname"
  ./gradlew -Dorg.gradle.daemon=false build

  arch-meson . build
  meson compile -C build
}

check() {
  cd "$pkgname"
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  cd "$pkgname"
  meson install -C build --no-rebuild --destdir "$pkgdir"

  # install trigger script
  # https://www.speedofsound.io/keyboard-shortcut/
  install -Dm755 scripts/trigger.sh "$pkgdir/usr/bin/$pkgname-trigger"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
