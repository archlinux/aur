# Maintainer: Your Name <address at domain dot tld>
pkgname=winegame-git
pkgver=0.5.13.r0.2b8c2ad
pkgrel=1
pkgdesc='开源游戏平台，帮您在UOS/Linux系统中运行Windows游戏'
arch=('any')
url='https://winegame.net/'
license=('GPL3')
depends=(
  'cabextract'
  'curl'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'mesa-utils'
  'p7zip'
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
  'python-yaml'
  'unzip'
  'webkit2gtk-4.1'
  'xdg-desktop-portal-impl'
  'xdg-utils'
  'xorg-xrandr'
)
makedepends=(
  'git'
  'meson'
)
checkdepends=(
  'appstream-glib'
  'fluidsynth'
  'pciutils'
  'python-nose-cover3'
  'vulkan-tools'
  'wine'
  'xorg-server-xvfb'
  'xterm'
)
optdepends=(
  'gamemode: Allows games to request a temporary set of optimisations'
  'gamescope: Draw the game window isolated from your desktop'
  'gvfs: GVFS backend'
  'innoextract: Extract Inno Setup installers'
  'lib32-gamemode: Allows games to request a temporary set of optimisations'
  'lib32-glibc: for 32bit games support'
  "lib32-mangohud: Display the games' FPS + other information"
  'lib32-vkd3d: DirectX 12 support'
  'lib32-vulkan-icd-loader: Vulkan support'
  'libstrangle: Set FPS limit'
  'linux-steam-integration: start Steam with LSI'
  "mangohud: Display the games' FPS + other information"
  'python-evdev: Controller support'
  'python-pefile: Extract icons from Windows executables'
  'python-protobuf: BattleNet integration'
  'python-pypresence: Discord Rich Presence integration'
  'vkd3d: DirectX 12 support'
  'vulkan-icd-loader: Vulkan support'
  'vulkan-tools: Vulkan support'
  'wine: easiest way to get all the libraries missing from the Lutris runtime'
  'winetricks: use system winetricks'
  'xorg-xgamma: Restore gamma on game exit')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitee.com/winegame/lutris.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs

  cd "${pkgname%-git}"
  xvfb-run nosetests \
    --cover-erase \
    --with-xunit \
    --xunit-file=nosetests.xml \
    --with-coverage \
    --cover-package=lutris \
    --cover-xml-file=coverage.xml
}

package() {
  meson install -C build --destdir "$pkgdir"
}
