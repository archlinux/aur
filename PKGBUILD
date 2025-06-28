# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Victor Fuentes <hyruleterminatriforce@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
pkgname=lutris-git
pkgver=0.5.19.r153.g35990f4
pkgrel=1
pkgdesc="Open Gaming Platform"
arch=('any')
url="https://lutris.net"
license=('GPL-3.0-or-later')
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
makedepends=(
  'git'
  'meson'
  'protobuf'
)
checkdepends=(
  'appstream-glib'
  'python-pytest'
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
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lutris/lutris.git'
        'git+https://github.com/bartok765/galaxy_blizzard_plugin.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

  # Regenerate protos to fix BattleNet plugin
  protoc --proto_path=galaxy_blizzard_plugin/src --python_out=. product_db.proto
  cp -f product_db_pb2.py "${pkgname%-git}/${pkgname%-git}/util/battlenet/product_db_pb2.py"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs

  cd "${pkgname%-git}"

  # Python tests: Disabled because either they're querying hardware 
  # or trying to spawn processes
  pytest \
    --ignore=tests/test_{api,dialogs,installer}.py \
    -k "not GetNvidiaDriverInfo and not GetNvidiaGpuInfo and not import_module and not options"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
