# Maintainer: Remy Huang <me@remya.top>
pkgname=remya-launcher
_app_id=remya_launcher
_upstream_ver=0.1.0
pkgver=0.1.0
pkgrel=1
_core_ver=0.3.0
pkgdesc="Application launcher and clipboard history for Hyprland"
arch=('x86_64')
url="https://github.com/remyhuang03/remya-launcher"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=(
  'remya-core>=0.3.0'
  'gtk3'
  'gtk-layer-shell>=0.6'
  'inter-font'
  'fontconfig'
  'ripgrep'
  'wl-clipboard'
  'wayland'
  'libxkbcommon'
  'glibc'
  'gcc-libs'
)
makedepends=(
  'clang'
  'cmake'
  'fvm'
  'ninja'
  'python'
  'rust'
)
conflicts=('remya-launcher-bin' 'remya-launcher-git')
optdepends=('noto-fonts-cjk: CJK font coverage')
options=('!strip')
source=(
  "remya-launcher-${_upstream_ver}.tar.gz::${url}/archive/refs/tags/v${_upstream_ver}.tar.gz"
  "remya-core-${_core_ver}.tar.gz::https://github.com/remyhuang03/remya-core/archive/refs/tags/v${_core_ver}.tar.gz"
)
sha256sums=('97a1739270346cdcf93387f60ebe1bd2c99029ebedee651d5ac11f8ceab3a11a'
            '7d6446827dde819e21c6029e5aa8af732dc12753c79b990d474b29bc5b7a22b7')

prepare() {
  ln -sfn "${srcdir}/remya-core-${_core_ver}" "${srcdir}/remya-core"
  ln -sfn "${srcdir}/remya-launcher-${_upstream_ver}" "${srcdir}/remya-launcher"
}

build() {
  cd "${srcdir}/remya-launcher"
  fvm install
  fvm flutter pub get --enforce-lockfile
  fvm flutter build linux --release
}

package() {
  cd "${srcdir}/remya-launcher"

  install -d "${pkgdir}/usr/lib/${_app_id}"
  cp -a build/linux/x64/release/bundle/remya-launcher-{clipboard,calculator,apps,web,files} "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/remya_launcher "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/lib "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/data "${pkgdir}/usr/lib/${_app_id}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_app_id}/${_app_id}" "${pkgdir}/usr/bin/${_app_id}"

  install -Dm644 "linux/packaging/top.remya.launcher.desktop" \
    "${pkgdir}/usr/share/applications/top.remya.launcher.desktop"
  install -Dm644 "linux/packaging/remya-launcher.json" "${pkgdir}/usr/share/remya/apps/remya-launcher.json"
  install -Dm644 "assets/icons/app_icon.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/top.remya.launcher.svg"

  install -d "${pkgdir}/usr/lib/systemd/user"
  cat > "${pkgdir}/usr/lib/systemd/user/top.remya.launcher.clipboard.service" << 'EOF'
[Unit]
Description=Remya Launcher clipboard history
PartOf=graphical-session.target
After=graphical-session.target
Wants=top.remya.core.service
After=top.remya.core.service

[Service]
ExecStart=/usr/lib/remya_launcher/remya-launcher-clipboard
Restart=on-failure
RestartSec=2
UMask=0077
LimitCORE=0

[Install]
WantedBy=graphical-session.target
EOF

  cat > "${pkgdir}/usr/lib/systemd/user/top.remya.launcher.apps.service" << 'EOF'
[Unit]
Description=Remya Launcher apps index
PartOf=graphical-session.target
After=graphical-session.target

[Service]
ExecStart=/usr/lib/remya_launcher/remya-launcher-apps --daemon
KillMode=process
Restart=on-failure
RestartSec=2
UMask=0077
LimitCORE=0

[Install]
WantedBy=graphical-session.target
EOF

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "build/linux/x64/release/bundle/data/licenses/rust-notices.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/rust-dependencies.txt"
}
