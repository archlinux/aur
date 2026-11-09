# Maintainer: Remy Huang <me@remya.top>
pkgname=remya-bar-bin
_app_id=remya_bar
_upstream_ver=0.1.0-dev.20261109.0
pkgver=0.1.0_dev.20261109.0
pkgrel=1
pkgdesc="A Material Design 3 Expressive desktop bar for Hyprland on Linux"
arch=('x86_64')
url="https://github.com/remyhuang03/remya-bar"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=(
  'remya-settings-bin'
  'gtk3'
  'gtk-layer-shell>=0.6'
  'inter-font'
  'libcanberra'
  'wayland'
  'libxkbcommon'
  'glibc'
  'gcc-libs'
)
provides=("remya-bar=${pkgver}")
conflicts=('remya-bar')
optdepends=('nvidia-utils: NVIDIA GPU metrics' 'noto-fonts-cjk: CJK font coverage')
options=('!strip')
source=("${_app_id}-${_upstream_ver}-linux-x86_64.tar.zst::${url}/releases/download/v${_upstream_ver}/${_app_id}-${_upstream_ver}-linux-x86_64.tar.zst")
sha256sums=('4a5291c623cd9541ec81a665ae250ac227f519310c4237a945bdba1f9a6a19c2')

package() {
  cd "${srcdir}/${_app_id}-${_upstream_ver}-linux-x86_64"

  install -d "${pkgdir}/usr/lib/${_app_id}"
  cp -a build/linux/x64/release/bundle/remya_bar "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/lib "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/data "${pkgdir}/usr/lib/${_app_id}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_app_id}/${_app_id}" "${pkgdir}/usr/bin/${_app_id}"

  install -Dm644 "linux/packaging/top.remya.bar.desktop" \
    "${pkgdir}/usr/share/applications/top.remya.bar.desktop"
  install -Dm644 "assets/icons/bar.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/top.remya.bar.svg"

  install -d "${pkgdir}/usr/lib/systemd/user"
  cat > "${pkgdir}/usr/lib/systemd/user/top.remya.bar.service" << 'EOF'
[Unit]
Description=Remy'a Bar
PartOf=graphical-session.target
After=graphical-session.target
Wants=top.remya.settings.service
After=top.remya.settings.service

[Service]
ExecStart=/usr/bin/remya_bar
Restart=on-failure
RestartSec=2

[Install]
WantedBy=graphical-session.target
EOF

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "assets/licenses/rust-dependencies.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/rust-dependencies.txt"
  install -Dm644 "build/linux/x64/release/bundle/share/licenses/virtual-keyboard-unstable-v1.xml" \
    "${pkgdir}/usr/share/licenses/${pkgname}/virtual-keyboard-unstable-v1.xml"
}
