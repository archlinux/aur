# Maintainer: Remy Huang <me@remya.top>
pkgname=remya-bar
_app_id=remya_bar
_upstream_ver=0.1.0
pkgver=0.1.0
pkgrel=1
_core_ver=0.1.0
pkgdesc="A Material Design 3 Expressive desktop bar for Hyprland on Linux"
arch=('x86_64')
url="https://github.com/remyhuang03/remya-bar"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=(
  'remya-core'
  'gtk3'
  'gtk-layer-shell>=0.6'
  'inter-font'
  'libcanberra'
  'sqlite'
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
conflicts=('remya-bar-bin' 'remya-bar-git')
optdepends=('nvidia-utils: NVIDIA GPU metrics' 'noto-fonts-cjk: CJK font coverage')
options=('!strip')
source=(
  "remya-bar-${_upstream_ver}.tar.gz::${url}/archive/refs/tags/v${_upstream_ver}.tar.gz"
  "remya-core-${_core_ver}.tar.gz::https://github.com/remyhuang03/remya-core/archive/refs/tags/v${_core_ver}.tar.gz"
)
sha256sums=('7507b7b54907d294a6106cf8d3065493e047071fe7ac9095a63129d70ab4465d'
            '06d4b585b5591c8dbadfec8abc12a87bd6b1f2d4a96ff8ce789fdfcebd018384')

prepare() {
  ln -sfn "${srcdir}/remya-core-${_core_ver}" "${srcdir}/remya-core"
  ln -sfn "${srcdir}/remya-bar-${_upstream_ver}" "${srcdir}/remya-bar"
}

build() {
  cd "${srcdir}/remya-bar"
  fvm install
  fvm flutter pub get --enforce-lockfile
  fvm flutter build linux --release
}

package() {
  cd "${srcdir}/remya-bar"

  install -d "${pkgdir}/usr/lib/${_app_id}"
  cp -a build/linux/x64/release/bundle/remya_bar "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/lib "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/data "${pkgdir}/usr/lib/${_app_id}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_app_id}/${_app_id}" "${pkgdir}/usr/bin/${_app_id}"

  install -Dm644 "linux/packaging/top.remya.bar.desktop" \
    "${pkgdir}/usr/share/applications/top.remya.bar.desktop"
  install -Dm644 "linux/packaging/remya-bar.json" "${pkgdir}/usr/share/remya/apps/remya-bar.json"
  install -Dm644 "assets/icons/app_icon.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/top.remya.bar.svg"

  install -d "${pkgdir}/usr/lib/systemd/user"
  cat > "${pkgdir}/usr/lib/systemd/user/top.remya.bar.service" << 'EOF'
[Unit]
Description=Remy'a Bar
PartOf=graphical-session.target
After=graphical-session.target
Wants=top.remya.core.service
After=top.remya.core.service

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
