# Maintainer: LuYishan <wuming381907 at gmail dot com>
pkgname=ludash
_commit=f7afb5dc9995dbdd81440e3cd20faa565795fbb6
_slintver=1.18.1
# Latest GitHub release (v1.0.0) plus the commits since it.
pkgver=1.0.0.r548.gf7afb5d
pkgrel=1
pkgdesc='LunaDash: C++ Wayland tiling desktop with OpenGL and optional Vulkan rendering (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/LuYishan-4/LunaDash'
license=('GPL-3.0-only')
provides=('lunadash')
conflicts=('lunadash')
depends=('lunadash-shell' 'slintlu'
         'ffmpeg' 'wayland' 'pam' 'wlroots0.20' 'libglvnd' 'fontconfig' 'freetype2' 'dbus' 'xorg-xwayland'
         'libinput' 'libxkbcommon' 'systemd-libs' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk'
         'xdg-desktop-portal-wlr>=0.8.4' 'pipewire' 'libpulse' 'polkit' 'polkit-kde-agent' 'git' 'python'
         'cmake' 'ninja' 'glib2' 'gdk-pixbuf2' 'curl' 'shared-mime-info' 'fcitx5' 'fcitx5-qt'
         'fcitx5-configtool' 'brightnessctl' 'ddcutil' 'grim' 'slurp' 'wl-clipboard' 'networkmanager'
         'network-manager-applet' 'wireplumber' 'pavucontrol' 'bluez' 'bluez-utils' 'blueman'
         'system-config-printer' 'gnome-disk-utility' 'partitionmanager' 'firewalld' 'seahorse' 'pciutils'
         'usbutils' 'udisks2' 'power-profiles-daemon' 'gnome-control-center')
makedepends=('pkgconf' 'glib2-devel' 'wayland-protocols' 'vulkan-headers' 'nlohmann-json' 'rust')
optdepends=('kitty: Optional default terminal'
            'dolphin: Optional default file manager'
            'fish: Optional interactive shell'
            'noto-fonts-cjk: CJK interface fonts'
            'mesa: Mesa OpenGL drivers'
            'mpvpaper: Video wallpapers (AUR)'
            'vulkan-icd-loader: Vulkan loader for Vulkan rendering'
            'vulkan-driver: GPU-specific Vulkan driver')
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
        "slint-$_slintver.tar.gz::https://github.com/slint-ui/slint/archive/refs/tags/v$_slintver.tar.gz")
sha256sums=('f898b17cfbdb06c50a9c8cae71aca0249dd5f2c941d16df68df2cf27cf5f3523'
            'fe485305ed303215e76c04918ee9aefbffbe229f18f979098ec36c7fa1dab28b')

prepare() {
  cd "slint-$_slintver"
  # Slint's tikv-jemallocator 0.7.0 is incompatible with Rust 1.99+
  # (ld.lld: undefined symbol: _rjem_malloc), so build slint-compiler without jemalloc.
  sed -i 's/"jemalloc", //' tools/compiler/Cargo.toml
  sed -i '/# Enable jemalloc, except when cross-compiling/,/endif()/ s/list(APPEND slint_compiler_features "jemalloc")/# &/' \
    api/cpp/CMakeLists.txt
}

build() {
  # The shell and SlintLu come from the lunadash-shell and slintlu packages.
  cmake -S "LunaDash-$_commit" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DLUDASH_INSTALL_SHELL=OFF \
    -DFETCHCONTENT_SOURCE_DIR_SLINT="$srcdir/slint-$_slintver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "LunaDash-$_commit"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  local doc
  for doc in LOGIN_SESSION ARCHITECTURE GRAPHICS FILES DISPLAY_AND_STARTUP SCREEN_CAPTURE NYXNIRI_DESKTOP SHELL; do
    install -Dm644 "docs/en/$doc.md" "$pkgdir/usr/share/doc/$pkgname/$doc.md"
    install -Dm644 "docs/zh/$doc.md" "$pkgdir/usr/share/doc/$pkgname/zh/$doc.md"
  done
}
