# Maintainer: Javad <ja7ad@live.com>

pkgname=lutris-live-bin
pkgver=0.5.22
pkgrel=1
pkgdesc="Open Gaming Platform (Live version)"
arch=('any')
url="https://lutris.net"
license=('GPL-3.0-only')
depends=(
  '7zip'
  'cabextract'
  'curl'
  'glib2'
  'gnome-desktop'
  'gtk3'
  'hicolor-icon-theme'
  'libnotify'
  'mesa-utils'
  'psmisc'
  'python-cairo'
  'python-certifi'
  'python-dbus'
  'python-distro'
  'python-gobject'
  'python-lxml'
  'python-moddb'
  'python-pillow'
  'python-requests'
  'python-setproctitle'
  'python-urllib3'
  'python-yaml'
  'unzip'
  'webkit2gtk-4.1'
  'xdg-desktop-portal-impl'
  'xdg-utils'
  'xorg-xrandr'
)

optdepends=(
  'fluidsynth: For games that have MIDI music'
  'gamemode: Allows games to request a temporary set of optimisations'
  'gamescope: Draw the game window isolated from your desktop'
  'gvfs: GVFS backend'
  'innoextract: Extract Inno Setup installers'
  'lib32-gamemode: Allows games to request a temporary set of optimisations'
  'lib32-glibc: for 32bit games support'
  'lib32-gnutls: Required to login to some game platforms (e.g. Ubisoft Connect, EA Origin and GOG)'
  "lib32-mangohud: Display the games' FPS + other information"
  'lib32-mesa-libgl: OpenGL support'
  'lib32-vkd3d: DirectX 12 support'
  'lib32-vulkan-icd-loader: Vulkan support'
  'libayatana-appindicator: tray icon support'
  "mangohud: Display the games' FPS + other information"
  'python-evdev: Controller support'
  'python-pefile: Extract icons from Windows executables'
  'python-protobuf: BattleNet integration'
  'python-pypresence: Discord Rich Presence integration'
  'umu-launcher: For running games through Proton'
  'vkd3d: DirectX 12 support'
  'vulkan-icd-loader: Vulkan support'
  'vulkan-tools: Vulkan support'
  'wine: easiest way to get all the libraries missing from the Lutris runtime'
  'winetricks: use system winetricks'
)

provides=('lutris')
conflicts=('lutris' 'lutris-git')

_deb="lutris_${pkgver}_all.deb"
source=("$_deb::https://github.com/lutris/lutris/releases/download/v${pkgver}/${_deb}")

sha256sums=('SKIP')

package() {
  bsdtar -xf "${srcdir}/${_deb}" -C "${srcdir}"

  if [ -f "${srcdir}/data.tar.zst" ]; then
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
  elif [ -f "${srcdir}/data.tar.xz" ]; then
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  else
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
  fi

  install -dm755 "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/games/lutris" "${pkgdir}/usr/bin/lutris"
  rm -rf "${pkgdir}/usr/games"

  sed -i 's|/usr/games/lutris|/usr/bin/lutris|g' "${pkgdir}"/usr/share/applications/*.desktop

  local _pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')

  install -dm755 "${pkgdir}/usr/lib/python${_pyver}/site-packages"
  mv "${pkgdir}"/usr/lib/python3/dist-packages/* "${pkgdir}/usr/lib/python${_pyver}/site-packages/"
  rm -rf "${pkgdir}/usr/lib/python3"
}