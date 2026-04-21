# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=speedofsound
_app_id="io.$pkgname.SpeedOfSound"
pkgver=0.13.0
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
sha256sums=('6ebca7df63c16be816a1d95749af248d4a3e7792ab0ba080e17c8f1aba207570')

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
