# Maintainer: At1ass <nikolatesla199620@gmail.com>
# Public source by default. tools/build-arch.sh builds a committed local checkout.
pkgbase=at1ass-shell-git
pkgname=(at1ass-shell-git at1ass-shell-plugins-git at1ass-shell-greeter-git)
pkgver=r297.91abb810
pkgrel=1
pkgdesc='Config-first Quickshell desktop shell for Hyprland'
arch=(x86_64)
url='https://github.com/At1ass/shell'
license=('GPL-3.0-or-later')
# All split-package runtime libraries are also needed when building from scratch.
makedepends=(git cmake ninja pkgconf python 'qt6-base>=6.8' 'qt6-declarative>=6.8'
             'libical>=4.0' libqalculate lm_sensors rapidfuzz-cpp glib2 libsecret)
_submodule=src/plugins/external/material-color-utilities
_mcu_commit=07b2c68508039e178bcf1317ad0cf0af4c36be0f
source=("shell::git+https://github.com/At1ass/shell.git"
        "mcu::git+https://github.com/material-foundation/material-color-utilities.git#commit=${_mcu_commit}")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd shell
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd shell
    git submodule init "$_submodule"
    git config "submodule.$_submodule.url" "$srcdir/mcu"
    git -c protocol.file.allow=always submodule update "$_submodule"
    git -C "$_submodule" apply --check "$srcdir/shell/src/plugins/patches/0001-drop-abseil-keep-double-abs.patch"
    git -C "$_submodule" apply "$srcdir/shell/src/plugins/patches/0001-drop-abseil-keep-double-abs.patch"
}

build() {
    cmake -S shell/src/plugins -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
        -DFETCHCONTENT_TRY_FIND_PACKAGE_MODE=ALWAYS \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON -Wno-dev
    cmake --build build
}

package_at1ass-shell-git() {
    pkgdesc='Config-first desktop shell for Hyprland'
    arch=(any)
    depends=("at1ass-shell-plugins-git=${pkgver}" 'quickshell>=0.3.2' 'hyprland>=0.56'
             'qt6-base>=6.8' 'qt6-declarative>=6.8' qt6-wayland qt6-svg app2unit xdg-terminal-exec
             bash coreutils findutils gawk grep sed glib2 systemd pam util-linux which hicolor-icon-theme
             ttf-roboto ttf-dejavu ttf-material-symbols-variable)
    optdepends=(
        'ca-certificates: HTTPS trust for weather and remote wallpaper sources'
        'xdg-utils: external URL opening from calendar links'
        'pipewire-pulse: PulseAudio applications on the optional PipeWire audio graph'
        'xdg-desktop-portal: source picker and portal-based recording'
        'xdg-desktop-portal-hyprland: Hyprland screencast portal backend'
        'pipewire: audio graph and volume controls (running service required)'
        'wireplumber: PipeWire device and stream policy'
        'networkmanager: Wi-Fi, Ethernet and VPN control (running service required)'
        'bluez: Bluetooth control (running bluetooth service required)'
        'upower: battery and power-device status through the UPower service'
        'gnome-keyring: Secret Service provider for persistent network credentials; alternatives supported'
        'networkmanager-openvpn: OpenVPN authentication helper'
        'nm-connection-editor: external network profile editor'
        'blueman: external Bluetooth manager'
        'pwvucontrol: advanced audio controls'
        'grim: screenshot capture'
        'wl-clipboard: screenshot and clipboard copying; cliphist ingestion'
        'swappy: screenshot annotation'
        'cliphist: clipboard history (external wl-paste watcher required)'
        'gpu-screen-recorder: recording and gsr-cli control; gsr-cli must be available'
        'procps-ng: recording process detection (pgrep)'
        'ddcutil: DDC/CI monitor brightness (device permissions required)'
        'hyprsunset: night-light temperature control'
        'curl: remote wallpaper downloads'
        'qt6-imageformats: additional wallpaper and image codecs'
        'hypridle: idle locking and suspend integration'
        'vdirsyncer: external CalDAV synchronization'
        'uwsm: optional graphical-session and environment management'
    )
    provides=("at1ass-shell=${pkgver}")
    conflicts=(at1ass-shell)
    python shell/tools/install-runtime.py --source shell --destdir "$pkgdir"
    install -Dm755 shell/packaging/arch/at1ass-shell "$pkgdir/usr/bin/at1ass-shell"
    install -d "$pkgdir/usr/bin"
    ln -s ../share/at1ass-shell/tools/shell-ctl "$pkgdir/usr/bin/shell-ctl"
    install -Dm644 shell/packaging/arch/at1ass-shell.service \
        "$pkgdir/usr/lib/systemd/user/at1ass-shell.service"
    install -Dm644 shell/README.md "$pkgdir/usr/share/doc/at1ass-shell/README.md"
    install -Dm644 shell/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_at1ass-shell-plugins-git() {
    pkgdesc='Native QML modules for the at1ass desktop shell'
    depends=(glibc libgcc libstdc++ qt6-base qt6-declarative
             'libical>=4.0' libqalculate lm_sensors glib2 libsecret)
    license=('GPL-3.0-or-later' 'Apache-2.0' 'MIT')
    optdepends=('nvidia-utils: NVIDIA GPU statistics through optional dynamically loaded NVML')
    provides=("at1ass-shell-plugins=${pkgver}")
    conflicts=(at1ass-shell-plugins)
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 shell/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "shell/$_submodule/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/material-color-utilities.LICENSE"
    install -Dm644 /usr/share/licenses/rapidfuzz-cpp/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/rapidfuzz.LICENSE"
}

package_at1ass-shell-greeter-git() {
    arch=(any)
    pkgdesc='Optional greetd greeter for the at1ass desktop shell'
    depends=("at1ass-shell-plugins-git=${pkgver}" 'quickshell>=0.3.2' 'hyprland>=0.56'
             greetd bash 'qt6-base>=6.8' 'qt6-declarative>=6.8' qt6-wayland qt6-svg systemd
             ttf-roboto ttf-dejavu ttf-material-symbols-variable)
    optdepends=('greetd-regreet: fallback if the Quickshell greeter fails'
                'upower: optional battery status in the greeter')
    provides=("at1ass-shell-greeter=${pkgver}")
    conflicts=(at1ass-shell-greeter)
    backup=(etc/greetd/greeter.json etc/greetd/hyprland-greeter.conf)
    local src=shell/src/features/greeter
    local dest="$pkgdir/usr/share/at1ass-shell/greeter"
    install -d "$dest"
    cp -r --no-preserve=ownership \
        "$src"/{shell.qml,GreeterSurface.qml,qmldir,components,config,ui} "$dest/"
    install -Dm644 "$src/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 shell/packaging/arch/greeter.json "$pkgdir/etc/greetd/greeter.json"
    install -Dm644 shell/packaging/arch/hyprland-greeter.conf "$pkgdir/etc/greetd/hyprland-greeter.conf"
    install -Dm644 shell/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
