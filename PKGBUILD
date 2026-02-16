# Maintainer: Jacek Sobczak <metrokontakt24@gmail.com>

pkgname=radio-scheduler-git
pkgver=r19.6352443
pkgrel=2
pkgdesc="Scheduling and automatic playback of Internet radio stations (with MPD)"
arch=('any')
url="https://github.com/Daszkan/radio-scheduler"
license=('MIT')
install=radio-scheduler.install
depends=(
  'python'
  'pyside6'
  'python-pyyaml'
  'mpd'
  'mpc'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"

  install -dm755 "${pkgdir}/usr/share/radio-scheduler"
  install -Dm644 *.{py,png,yaml} "${pkgdir}/usr/share/radio-scheduler/"
  install -Dm755 install.sh "${pkgdir}/usr/share/radio-scheduler/install.sh"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/radio-scheduler-gui" <<EOF
#!/usr/bin/env bash
exec /usr/bin/python3 /usr/share/radio-scheduler/radio-scheduler-gui.py "\$@"
EOF

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/radio-scheduler" <<EOF
#!/usr/bin/env bash
exec /usr/bin/python3 /usr/share/radio-scheduler/radio-scheduler.py "\$@"
EOF

  install -Dm644 app_icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/radio-scheduler.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 install.sh "${pkgdir}/usr/bin/install-radio-scheduler.sh"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/radio-scheduler.desktop" <<EOF
[Desktop Entry]
Name=Radio Scheduler
GenericName=Internet Radio Scheduler
Comment=Automatic scheduling and playback of internet radio stations
Exec=/usr/bin/radio-scheduler-gui
Icon=radio-scheduler
Terminal=false
Type=Application
Categories=Audio;Player;Utility;
StartupNotify=true
EOF

}

