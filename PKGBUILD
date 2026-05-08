pkgname=mediaharbor
pkgver=2.2.0
pkgrel=1
pkgdesc="MediaHarbor is all-in-one music streaming and downloading application built with Tauri and React."
arch=('x86_64' 'aarch64')
url="https://github.com/MediaHarbor/mediaharbor"
license=('GPL-3.0-or-later')

depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libappindicator-gtk3'
  'glib2'
)

makedepends=(
  'rust'
  'nodejs'
  'npm'
)

options=('!lto')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MediaHarbor/mediaharbor/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9a3695647b4409c0cee8b2ac6171e7de6df758a724f8aeae1fc7519c2b6945aa')

prepare() {
  cd "$srcdir/mediaharbor-${pkgver}"
  npm ci
}

build() {
  cd "$srcdir/mediaharbor-${pkgver}"
  npm run build:react
  cd src/app
  cargo tauri build --bundles none
}

package() {
  cd "$srcdir/mediaharbor-${pkgver}"

  install -Dm755 target/release/mediaharbor \
    "${pkgdir}/usr/bin/mediaharbor"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/mediaharbor.desktop" << 'EOF'
[Desktop Entry]
Name=MediaHarbor
Exec=mediaharbor
Icon=mediaharbor
Type=Application
Categories=AudioVideo;Audio;Music;Player;Network;
Comment=Music streaming and media management
StartupWMClass=mediaharbor
EOF

  local icon_dir="src/app/icons"
  for size in 32 128; do
    install -Dm644 "${icon_dir}/${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/mediaharbor.png"
  done
  install -Dm644 "${icon_dir}/128x128@2x.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mediaharbor.png"
  install -Dm644 "src/assets/MediaHarbor_Logo.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mediaharbor.svg"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
