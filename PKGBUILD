# Maintainer: Ardox <ardox@axos-project.com>
pkgname=sleex-git
_pkgname=sleex
pkgver=1.32.r661.33b1e23
pkgrel=1
pkgdesc="Desktop environment focused on aesthetics and performance (git version)"
arch=("x86_64")
url="https://github.com/axos-project/sleex"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname")

depends=(
  'cava' 'pavucontrol-qt' 'wireplumber' 'libdbusmenu-gtk3' 'playerctl'
  'hyprsunset' 'geoclue' 'brightnessctl' 'ddcutil'
  'axel' 'bc' 'coreutils' 'cliphist' 'cmake' 'curl' 'rsync' 'wget' 'ripgrep' 'jq' 'meson' 'xdg-user-dirs' 'foot' 'power-profiles-daemon' 'mission-center' 'kvantum' 'inotify-tools' 'lm_sensors' 'qt5ct' 'qt6ct' 'sqlite'
  'bibata-cursor-theme-bin'
  'adw-gtk-theme' 'breeze-plus' 'eza' 'fish' 'fontconfig' 'kde-material-you-colors' 'kitty' 'matugen-bin' 'starship' 'ttf-gabarito-git' 'ttf-jetbrains-mono-nerd' 'ttf-material-design-icons-extended' 'ttf-material-symbols-variable' 'ttf-readex-pro' 'ttf-rubik-vf' 'ttf-twemoji'
  'hyprutils' 'hyprpicker' 'hyprlang' 'hyprland-qt-support' 'hyprland-guiutils' 'hyprcursor' 'hyprwayland-scanner' 'hyprland' 'xdg-desktop-portal-hyprland' 'wl-clipboard' 'hyprlock'
  'bluedevil' 'gnome-keyring' 'networkmanager' 'polkit-kde-agent' 'pcmanfm-qt' 'kwrite' 'libnm' 'gio-qt' 'qt6-connectivity'
  'microtex-git' 'xdg-desktop-portal'
  'clang' 'uv' 'gtk4' 'libadwaita' 'libsoup3' 'libportal-gtk4' 'gobject-introspection' 'sassc' 'python-setproctitle' 'python-pywayland'
  'hyprshot' 'ksnip' 'wf-recorder' 'slurp' 'grim' 'tesseract' 'tesseract-data-eng'
  'kdialog' 'qt6-5compat' 'qt6-avif-image-plugin' 'qt6-base' 'qt6-declarative' 'qt6-imageformats' 'qt6-multimedia' 'qt6-positioning' 'qt6-quicktimeline' 'qt6-sensors' 'qt6-svg' 'qt6-tools' 'qt6-translations' 'qt6-virtualkeyboard' 'qt6-wayland' 'syntax-highlighting' 'upower' 'wtype' 'ydotool' 'fprintd' 'khal' 'vdirsyncer' 'python-aiohttp-oauthlib' 'swappy' 'hypnos-git' 'bluez-utils'
  'fuzzel' 'nm-connection-editor' 'quickshell-git' 'swww' 'translate-shell' 'wlogout'
  'sleex-user-config-git' 'sleex-artworks-git'
)

makedepends=('git' 'cmake')

optdepends=(
  "hyprwayland-scanner: Wayland protocol scanner for Hyprland"
  "neofetch: Fancy system info in your terminal"
  "firefox: Web browser"
  "pipewire-pulse: PulseAudio replacement via PipeWire"
  "papirus-icon-theme: Pretty icons"
  "inxi: Show system info like a nerd"
  "fwupd: Firmware updater for Linux"
  "gnome-autoar: Automatic archive handling in GNOME"
  "overskride: Bluetooth stuff"
  "gnome-system-monitor: Task manager but GNOMEy"
  "baobab: Disk usage analyzer"
  "gparted: Partition editor"
  "gnome-calculator: Yep, a calculator"
  "loupe: Image viewer"
  "nwg-displays: Display arrangement tool"
)

source=("git+https://gitlab.com/axos-project/sleex.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "1.28.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/src/share/sleex"
  rm -rf build/
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j$(nproc)
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/usr/bin"
  cp -r src/bin/* "$pkgdir/usr/bin/"

  mkdir -p "$pkgdir/etc"
  cp -r src/etc/* "$pkgdir/etc/"

  mkdir -p "$pkgdir/usr/share/sleex"
  cd src/share/sleex
  cmake --install build --prefix "$pkgdir/"
  
  rsync -av --exclude='.qmlls.ini' --exclude='.qt/' --exclude='.rcc/' --exclude='.vscode' \
        --exclude='build/' --exclude='CMakeFiles/' --exclude='CMakeCache.txt' \
        --exclude='cmake_install.cmake' --exclude='Makefile' --exclude='qml/' \
        "./" "$pkgdir/usr/share/sleex/"

  mkdir -p "$pkgdir/usr/share/wayland-sessions"
  cp -r "$srcdir/$_pkgname/src/share/wayland-sessions/"* "$pkgdir/usr/share/wayland-sessions/"

  mkdir -p "$pkgdir/usr/libalpm/hooks"
  cp -r "$srcdir/$_pkgname/src/share/libalpm/hooks/"* "$pkgdir/usr/libalpm/hooks/"
}
