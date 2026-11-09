# Maintainer: Remy Huang <me@remya.top>
pkgname=remya-settings-bin
_app_id=remya_settings
_upstream_ver=0.1.0-dev.20261109.0
pkgver=0.1.0_dev.20261109.0
pkgrel=1
pkgdesc="A Material Design 3 Expressive system settings application for Hyprland on Linux"
arch=('x86_64')
url="https://github.com/remyhuang03/remya-settings"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=(
  'gtk3'
  'networkmanager'
  'bluez'
  'libpulse'
  'pipewire'
  'gstreamer'
  'gst-plugins-base-libs'
  'polkit'
  'pacman-contrib'
  'glibc'
  'gcc-libs'
)
provides=("remya-settings=${pkgver}")
conflicts=('remya-settings')
options=('!strip')
source=("${_app_id}-${_upstream_ver}-linux-x86_64.tar.zst::${url}/releases/download/v${_upstream_ver}/${_app_id}-${_upstream_ver}-linux-x86_64.tar.zst")
sha256sums=('8072522d6f519d877df8b94eb7bf27116e0fa126fb811c247467065bee94dec9')

package() {
  cd "${srcdir}/${_app_id}-${_upstream_ver}-linux-x86_64"

  install -d "${pkgdir}/usr/lib/${_app_id}"
  cp -a build/linux/x64/release/bundle/remya_settings "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/lib "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/libexec "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/data "${pkgdir}/usr/lib/${_app_id}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_app_id}/${_app_id}" "${pkgdir}/usr/bin/${_app_id}"

  install -Dm644 "linux/packaging/top.remya.settings.desktop" \
    "${pkgdir}/usr/share/applications/top.remya.settings.desktop"
  install -Dm644 "linux/packaging/top.remya.settings.appimage.desktop" \
    "${pkgdir}/usr/share/applications/top.remya.settings.appimage.desktop"
  install -Dm644 "assets/icons/settings.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/top.remya.settings.svg"

  install -d "${pkgdir}/usr/share/dbus-1/services"
  cat > "${pkgdir}/usr/share/dbus-1/services/top.remya.settings.Service1.service" << 'EOF'
[D-BUS Service]
Name=top.remya.settings.Service1
Exec=/usr/bin/remya_settings --service
SystemdService=top.remya.settings.service
EOF

  install -d "${pkgdir}/usr/lib/systemd/user"
  cat > "${pkgdir}/usr/lib/systemd/user/top.remya.settings.service" << 'EOF'
[Unit]
Description=Remya Settings service
PartOf=graphical-session.target
After=graphical-session.target

[Service]
Type=dbus
BusName=top.remya.settings.Service1
ExecStart=/usr/bin/remya_settings --service
Restart=on-failure

[Install]
WantedBy=graphical-session.target
EOF

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "assets/licenses/rust-dependencies.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/rust-dependencies.txt"
  install -Dm644 "assets/licenses/croppy-kiwi.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/croppy-kiwi.txt"
}
