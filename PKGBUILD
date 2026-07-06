# Maintainer: smiley <smiley@aur.archlinux.org>

pkgname=cosmic-ext-applet-kdeconnect-git
_pkgver=0.9.0
pkgver=0.9.0.r353.g6c14414
pkgrel=1
pkgdesc='Native KDE Connect applet for the COSMIC desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/cosmic-utils/kdeconnect'
license=('GPL-3.0-only')
depends=(
  'cosmic-applets'
  'libpulse'
)
makedepends=('cargo' 'just' 'git' 'cmake' 'go' 'clang' 'lld')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/cosmic-utils/kdeconnect.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    echo "$desc" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    echo "${_pkgver}.r$(git rev-list --count HEAD).g$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  CARGO_PROFILE_RELEASE_LTO=false cargo build --release --frozen
}

package() {
  cd "${pkgname%-git}"
  local d="$pkgdir/usr"

  install -Dm755 target/release/kdeconnect-service          "$d/bin/kdeconnect-service"
  install -Dm755 target/release/cosmic-ext-connect-applet   "$d/bin/cosmic-ext-connect-applet"
  install -Dm755 target/release/cosmic-ext-connect-settings "$d/bin/cosmic-ext-connect-settings"
  install -Dm755 target/release/cosmic-ext-connect-sms      "$d/bin/cosmic-ext-connect-sms"

  install -Dm644 resources/io.github.hepp3n.kdeconnect.svg \
    "$d/share/icons/hicolor/scalable/apps/io.github.hepp3n.kdeconnect.svg"
  install -Dm644 resources/io.github.hepp3n.kdeconnect.metainfo.xml \
    "$d/share/metainfo/io.github.hepp3n.kdeconnect.metainfo.xml"

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
