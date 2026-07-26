# Maintainer: smiley <smiley@aur.archlinux.org>

pkgname=cosmic-ext-applet-kdeconnect
pkgver=0.10.0
pkgrel=1
pkgdesc='Native KDE Connect applet for the COSMIC desktop'
arch=('x86_64' 'aarch64')
options=('!lto')
url='https://github.com/cosmic-utils/kdeconnect'
license=('GPL-3.0-only')
depends=(
  'cosmic-applets'
  'libpulse'
)
makedepends=('cargo' 'just' 'cmake' 'go' 'clang' 'lld')
provides=('cosmic-ext-applet-kdeconnect')
conflicts=('cosmic-ext-applet-kdeconnect-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cosmic-utils/kdeconnect/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('52477c895c8781742a8debb9ec12cee9a739c41fcd863b987fdbc41a194d04e9')

prepare() {
  cd "kdeconnect-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "kdeconnect-$pkgver"
  CARGO_PROFILE_RELEASE_LTO=false cargo build --release --frozen
}

package() {
  cd "kdeconnect-$pkgver"
  local d="$pkgdir/usr"

  install -Dm755 target/release/kdeconnect-service          "$d/bin/kdeconnect-service"
  install -Dm755 target/release/cosmic-ext-connect-applet   "$d/bin/cosmic-ext-connect-applet"
  install -Dm755 target/release/cosmic-ext-connect-settings "$d/bin/cosmic-ext-connect-settings"
  install -Dm755 target/release/cosmic-ext-connect-sms      "$d/bin/cosmic-ext-connect-sms"

  install -Dm644 resources/io.github.hepp3n.kdeconnect.svg \
    "$d/share/icons/hicolor/scalable/apps/io.github.hepp3n.kdeconnect.svg"
  install -Dm644 resources/io.github.hepp3n.kdeconnect.metainfo.xml \
    "$d/share/metainfo/io.github.hepp3n.kdeconnect.metainfo.xml"

  install -d "$d/share/applications"
  sed 's|Exec=cosmic-ext-connect-applet|Exec=/usr/bin/cosmic-ext-connect-applet|' \
    resources/io.github.hepp3n.kdeconnect.desktop \
    > "$d/share/applications/io.github.hepp3n.kdeconnect.desktop"
  install -Dm644 resources/io.github.hepp3n.kdeconnect.settings.desktop \
    "$d/share/applications/io.github.hepp3n.kdeconnect.settings.desktop"
  install -Dm644 resources/io.github.hepp3n.kdeconnect.sms.desktop \
    "$d/share/applications/io.github.hepp3n.kdeconnect.sms.desktop"

  mkdir -p "$d/share/dbus-1/services"
  printf '[D-BUS Service]\nName=io.github.hepp3n.kdeconnect\nExec=/usr/bin/kdeconnect-service\n' \
    > "$d/share/dbus-1/services/io.github.hepp3n.kdeconnect.service"
}
