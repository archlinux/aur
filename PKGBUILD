# Maintainer: Remy Huang <me@remya.top>
pkgname=remya-core-bin
_app_id=remya_core
_upstream_ver=0.1.0
pkgver=0.1.0
pkgrel=1
pkgdesc="Shared Remya daemon, updater and CLI"
arch=('x86_64')
url="https://github.com/remyhuang03/remya-core"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=(
  'networkmanager'
  'bluez'
  'libpulse'
  'pipewire'
  'gstreamer'
  'gst-plugins-base-libs'
  'polkit'
  'pacman-contrib'
  'sqlite'
  'glibc'
  'gcc-libs'
)
provides=("remya-core=${pkgver}")
conflicts=('remya-core' 'remya-core-git')
options=('!strip')
install=remya-core.install
source=("${_app_id}-${_upstream_ver}-linux-x86_64.tar.zst::${url}/releases/download/v${_upstream_ver}/${_app_id}-${_upstream_ver}-linux-x86_64.tar.zst")
sha256sums=('c94c06823abda121f675fc1a524fc97469726a7ec9d868541c8f321601406e18')

package() {
  cd "${srcdir}/${_app_id}-${_upstream_ver}-linux-x86_64"

  install -d "${pkgdir}/usr/lib/remya-core" "${pkgdir}/usr/bin"
  install -m755 target/release/{remyad,remya-core-update,remya} "${pkgdir}/usr/lib/remya-core/"
  ln -s /usr/lib/remya-core/remya "${pkgdir}/usr/bin/remya"
  install -Dm644 packaging/50-top.remya.core.update.rules "${pkgdir}/usr/share/polkit-1/rules.d/50-top.remya.core.update.rules"

  install -Dm644 packaging/top.remya.Core1.service "${pkgdir}/usr/share/dbus-1/services/top.remya.Core1.service"
  sed -i 's|@REMYAD@|/usr/lib/remya-core/remyad|' "${pkgdir}/usr/share/dbus-1/services/top.remya.Core1.service"
  install -d "${pkgdir}/usr/lib/systemd/user"
  cat > "${pkgdir}/usr/lib/systemd/user/top.remya.core.service" << 'EOF'
[Unit]
Description=Remya Core service
PartOf=graphical-session.target
After=graphical-session.target

[Service]
Type=dbus
BusName=top.remya.Core1
ExecStart=/usr/lib/remya-core/remyad
Restart=on-failure

[Install]
WantedBy=graphical-session.target
EOF

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 assets/licenses/rust-dependencies.txt "${pkgdir}/usr/share/licenses/${pkgname}/rust-dependencies.txt"
}
