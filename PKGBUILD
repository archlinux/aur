# Maintainer: lemon <lemonadorable@gmail.com>

pkgname=micyou-git
pkgver=1.3.4hotfix.r518.ge1257b3
pkgrel=1
pkgdesc="Turn your Android device into a wireless microphone (development version)"
arch=('x86_64')
url="https://github.com/LanRhyme/MicYou"
license=('GPL-3.0-only')
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'glibc'
  'libappindicator'
  'libgl'
  'libpulse'
  'libx11'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
  'pipewire'
  'pipewire-alsa'
  'zlib'
)
makedepends=(
  'git'
  'java-environment>=17'
)
optdepends=(
  'android-tools: USB connectivity support'
  'xdg-utils: open URLs in the default browser'
)
provides=('micyou')
conflicts=('micyou' 'micyou-bin')
source=(
  'git+https://github.com/LanRhyme/MicYou.git'
  'micyou.desktop'
)
b2sums=(
  'SKIP'
  '48b0b8b956dbb51c082b900d30fc541c22a67fc1334cf66fe06fe6b1a102850a63d03a7efd438e27384412f3cc38faece419268fd09457305d12bfc1cd1548f5'
)

pkgver() {
  cd MicYou

  local base_version
  base_version=$(sed -n 's/^project.version=//p' gradle.properties)
  printf '%s.r%s.g%s' \
    "$base_version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd MicYou

  export GRADLE_USER_HOME="$srcdir/gradle-home"
  ./gradlew --no-daemon :composeApp:createDistributable
}

package() {
  cd MicYou

  install -d "$pkgdir/opt/micyou"
  cp -a composeApp/build/compose/binaries/main/app/MicYou/. "$pkgdir/opt/micyou/"

  install -Dm644 "$srcdir/micyou.desktop" \
    "$pkgdir/usr/share/applications/micyou.desktop"
  install -Dm644 \
    composeApp/src/commonMain/composeResources/drawable/app_icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/micyou.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/micyou/LICENSE"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/micyou/bin/MicYou "$pkgdir/usr/bin/micyou"
}
