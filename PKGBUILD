# Maintainer: Natalie <natalie@localhost>

pkgname=mimick-git
pkgver=r0
pkgrel=1
pkgdesc="Unofficial Immich desktop client for Linux (GTK4/libadwaita)"
arch=('x86_64')
url="https://github.com/nicx17/mimick"
license=('GPL3')
depends=(
  'gtk4'
  'libadwaita'
  'libshumate'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'rust'
  'cargo'
  'pkgconf'
  'meson'
  'ninja'
  'blueprint-compiler'
)
optdepends=(
  'libsecret: keyring integration'
  'libnotify: notifications'
)
provides=('mimick')
conflicts=('mimick')
source=("${pkgname}::git+ssh://git@github.com/nicx17/mimick.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  
  # Install binary
  install -Dm755 target/release/mimick "$pkgdir/usr/bin/mimick"
  
  # Install desktop file
  install -Dm644 setup/dev.nicx.mimick.desktop "$pkgdir/usr/share/applications/dev.nicx.mimick.desktop"
  
  # Install icon
  install -Dm644 src/assets/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev.nicx.mimick.png"
  
  # Install metainfo if exists
  if [ -f "dev.nicx.mimick.metainfo.xml" ]; then
    install -Dm644 dev.nicx.mimick.metainfo.xml "$pkgdir/usr/share/metainfo/dev.nicx.mimick.metainfo.xml"
  elif [ -f "data/dev.nicx.mimick.metainfo.xml" ]; then
    install -Dm644 data/dev.nicx.mimick.metainfo.xml "$pkgdir/usr/share/metainfo/dev.nicx.mimick.metainfo.xml"
  fi
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
