# Maintainer: Ashley <info@meisgaming.net>

pkgname=krunner-spotify-enhanced-git
pkgver=r0.0000000
pkgrel=2
pkgdesc="KRunner plugin to control Spotify with spe commands"
arch=('any')
url='https://github.com/MeIsGaming/krunner-spotify'
license=('GPL-3.0-only')
depends=('python' 'python-spotipy' 'python-dbus' 'python-gobject' 'plasma-workspace')
makedepends=('git')
provides=('krunner-spotify-enhanced')
conflicts=('krunner-spotify-enhanced')
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/krunner-spotify"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/krunner-spotify"

  local module_dir="${pkgdir}/usr/lib/krunner-spotify-enhanced"
  install -d "${module_dir}"
  cp -a src/. "${module_dir}/"

  install -Dm644 plasma-runner-KRunnerSpotify.desktop \
    "${pkgdir}/usr/share/krunner/dbusplugins/plasma-runner-KRunnerSpotify.desktop"

  install -Dm644 KRunner-Spotify.config \
    "${pkgdir}/usr/share/krunner-spotify-enhanced/KRunner-Spotify.config"

  install -d "${pkgdir}/usr/share/pixmaps"
  for icon_file in icons/*.svg; do
    install -m644 "${icon_file}" "${pkgdir}/usr/share/pixmaps/$(basename "${icon_file}")"
  done

  install -d "${pkgdir}/usr/share/dbus-1/services"
  cat > "${pkgdir}/usr/share/dbus-1/services/org.kde.KRunnerSpotify.service" << 'EOF'
[D-BUS Service]
Name=org.kde.KRunnerSpotify
Exec=/usr/bin/python /usr/lib/krunner-spotify-enhanced/KRunnerSpotify.py
EOF

  install -d "${pkgdir}/usr/lib/systemd/user"
  cat > "${pkgdir}/usr/lib/systemd/user/krunner-spotify.service" << 'EOF'
[Unit]
Description=KRunner SpotifyEnhanced Runner
After=graphical-session.target
PartOf=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/python /usr/lib/krunner-spotify-enhanced/KRunnerSpotify.py
Restart=on-failure
RestartSec=1

[Install]
WantedBy=default.target
EOF

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
