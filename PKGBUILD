# Maintainer: Remy Huang <me@remya.top>
pkgname=remya-launcher-bin
_app_id=remya_launcher
_upstream_ver=0.1.0
pkgver=0.1.0
pkgrel=1
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
provides=("remya-launcher=${pkgver}")
conflicts=('remya-launcher' 'remya-launcher-git')
optdepends=('noto-fonts-cjk: CJK font coverage')
options=('!strip')
source=("${_app_id}-${_upstream_ver}-linux-x86_64.tar.zst::${url}/releases/download/v${_upstream_ver}/${_app_id}-${_upstream_ver}-linux-x86_64.tar.zst")
sha256sums=('eed217db3e965ae242041b6349f7c5f19222c2c496bb186c07d2e2faaec73db4')

package() {
  cd "${srcdir}/${_app_id}-${_upstream_ver}-linux-x86_64"

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
