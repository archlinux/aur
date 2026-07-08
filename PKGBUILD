# Maintainer: TheBlackDon <theblackdon@codeberg.org>
# Contributor: KineticWE project

pkgname=kineticwe
pkgver=6.7.80
pkgrel=5
pkgdesc="KineticWE - A tiling KWin Wayland compositor with native window tiling"
arch=('x86_64')
url="https://gitlab.com/theblackdon/kineticwe"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later' 'MIT' 'BSD-3-Clause' 'CC0-1.0')

depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-wayland'
    'kglobalaccel'
    'kirigami'
    'kwayland'
    'kdecoration'
    'kscreenlocker'
    'xorg-xwayland'
    'hwdata'
    'noctalia-git'
    'plasma-workspace'
    'milou'
    'aurorae'
    'breeze'
    'kscreen'
    'systemsettings'
    'plasma-desktop'
    'xdg-desktop-portal'
    'xdg-desktop-portal-kde'
    'libqaccessibilityclient-qt6'
    'pipewire'
    'libevdev'
    'libcanberra'
    'procps-ng'
    'psmisc'
    'upower'
)

makedepends=(
    'cmake'
    'ninja'
    'gcc'
    'git'
    'pkgconf'
    'extra-cmake-modules'
    # Qt6
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-5compat'
    'qt6-wayland'
    'qt6-tools'
    # KF6
    'kauth'
    'kcolorscheme'
    'kconfig'
    'kcoreaddons'
    'kcrash'
    'kdbusaddons'
    'kglobalaccel'
    'kio'
    'kjobwidgets'
    'kguiaddons'
    'ki18n'
    'kidletime'
    'kpackage'
    'kservice'
    'ksvg'
    'kwidgetsaddons'
    'kwindowsystem'
    'kdeclarative'
    'kcmutils'
    'knewstuff'
    'kxmlgui'
    'krunner'
    'knotifications'
    'kirigami'
    # Plasma / KDE
    'kwayland'
    'kdecoration'
    'kscreenlocker'
    'knighttime'
    'plasma-wayland-protocols'
    'plasma-activities'
    'libplasma'
    # System / Wayland
    'libepoxy'
    'wayland'
    'wayland-protocols'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libinput'
    'libdrm'
    'mesa'
    'libdisplay-info'
    'lcms2'
    'libxcvt'
    'libcanberra'
    'libevdev'
    'systemd'
    'pipewire'
    'freetype2'
    'fontconfig'
    'vulkan-headers'
    # X11
    'libx11'
    'libxcb'
    'xcb-util-keysyms'
    'xcb-util-cursor'
    'xcb-util-wm'
    'xcb-util-image'
    'xcb-util-renderutil'
    # Misc
    'libqaccessibilityclient-qt6'
    'cairo'
    'pango'
    'harfbuzz'
    'glib2'
    'pam'
    'polkit'
    'curl'
    'libwebp'
    'librsvg'
    'libqalculate'
    'libxml2'
    'jemalloc'
)

optdepends=(
    'bluedevil: Bluetooth device integration'
    'plasma-nm: Network management applet'
    'plasma-pa: Audio volume management'
    'kinfocenter: System information center'
    'kde-gtk-config: GTK application styling'
)
# COPR-compatible package replacement metadata
# Mimics the COPR spec's Provides + Obsoletes for kwin, kwin-common, kwin-libs,
# kwin-wayland, kglobalacceld, and kglobalacceld-devel.
# On Arch, kwin-common/kwin-libs/kwin-wayland are bundled in 'kwin', but we
# provide them virtually so packages that reference them see them satisfied.
replaces=('kwin' 'kglobalacceld')
provides=('kglobalacceld' 'kglobalacceld-devel' 'kwin' 'kwin-common' 'kwin-libs' 'kwin-wayland')
conflicts=('kwin' 'kglobalacceld' 'kglobalacceld-devel')


# Source: kwin-we from GitLab + kglobalacceld from KDE invent
_sourcebase="$pkgname-$pkgver"
source=(
    "$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
    "kglobalacceld::git+https://invent.kde.org/plasma/kglobalacceld.git"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    cd "$srcdir"

    echo "==> Extracting kwin-we source..."
    # GitLab archive extracts to 'kineticwe-v$pkgver', rename to $_sourcebase
    local extract_dir="$pkgname-v$pkgver"
    if [[ -d "$extract_dir" && ! -d $_sourcebase ]]; then
        mv "$extract_dir" "$_sourcebase"
    fi
    # Fallback: also handle plain 'kineticwe' extraction
    if [[ -d kineticwe && ! -d $_sourcebase ]]; then
        mv kineticwe "$_sourcebase"
    fi

    echo "==> Preparing kglobalacceld..."
    cd "$srcdir/kglobalacceld"
    # kglobalacceld is already cloned via git source; no extra prep needed
    cd "$srcdir"
}

build() {
    cd "$srcdir"

    # --- Phase 1: Build kglobalacceld ---
    echo "==> Building kglobalacceld (git master)..."

    mkdir -p kglobalacceld/build
    pushd kglobalacceld/build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -Wno-dev

    cmake --build . --parallel "$(nproc)"
    popd

    # Install kglobalacceld to a temp staging dir so kwin-we CMake finds it
    mkdir -p "$srcdir/kga-staging"
    DESTDIR="$srcdir/kga-staging" cmake --install kglobalacceld/build

    # --- Phase 2: Build kwin-we ---
    echo "==> Building kwin-we..."

    mkdir -p "$_sourcebase/build"
    cd "$_sourcebase/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_PREFIX_PATH="$srcdir/kga-staging/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -DKWIN_BUILD_GLOBALSHORTCUTS=ON \
        -Wno-dev

    cmake --build . --parallel "$(nproc)"
}

package() {
    cd "$srcdir"

    echo "==> Installing kglobalacceld..."
    DESTDIR="$pkgdir" cmake --install kglobalacceld/build

    echo "==> Installing kwin-we..."
    cd "$_sourcebase/build"
    DESTDIR="$pkgdir" cmake --install .

    # Remove static libs and cmake files from main package
    rm -f "$pkgdir/usr/lib/cmake/KGlobalAccelD/"*.cmake 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/"*.a 2>/dev/null || true

    # Strip kglobalacceld development files (matching COPR — keep only runtime lib)
    rm -rf "$pkgdir/usr/include/KGlobalAccelD" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/libKGlobalAccelD.so" 2>/dev/null || true

    # Compatibility symlinks so Plasma can find the compositor (like COPR does)
    ln -s kinetic-we "$pkgdir/usr/bin/kwin_wayland"
    ln -s kwin-we_wayland_wrapper "$pkgdir/usr/bin/kwin_wayland_wrapper"

    # Install license
    install -Dm644 "$srcdir/$_sourcebase/LICENSES/"* \
        -t "$pkgdir/usr/share/licenses/$pkgname/"

    # Install kglobalacceld license
    if [[ -d "$srcdir/kglobalacceld/LICENSES" ]]; then
        install -Dm644 "$srcdir/kglobalacceld/LICENSES/"* \
            -t "$pkgdir/usr/share/licenses/$pkgname-kglobalacceld/" 2>/dev/null || true
    fi

    # Install Wayland session launcher (start-kineticwe)
    echo "==> Installing start-kineticwe session launcher..."
    sed -e "s|@INSTALL_PREFIX@|/usr|g" \
        -e 's|if \[\[ "$_INSTALL_PREFIX_" == "/usr" \]\]; then|if false; then # system-wide install, use /usr as prefix|' \
        -e 's|export XDG_CURRENT_DESKTOP=KDE|export XDG_CURRENT_DESKTOP=KineticWE:KDE|g' \
        -e 's|nohup "$PORTAL_KDE" >"\\\$HOME|XDG_CURRENT_DESKTOP=KDE nohup "$PORTAL_KDE" >"\\\$HOME|' \
        "$srcdir/$_sourcebase/scripts/start-kineticwe.sh" \
        > "$pkgdir/usr/bin/start-kineticwe"
    chmod 0755 "$pkgdir/usr/bin/start-kineticwe"

    # Fix powerdevil/upowerd paths for distros that do not use /usr/libexec (Arch, Debian, etc.)
    sed -i \
        -e 's|/usr/libexec/upowerd|"$(command -v upowerd 2>/dev/null || echo /usr/libexec/upowerd)"|' \
        -e 's|/usr/libexec/org_kde_powerdevil|"$(command -v org_kde_powerdevil 2>/dev/null || echo /usr/libexec/org_kde_powerdevil)"|' \
        -e '/^# 3\. Start power management/i\# 2.5. Start kded6 for shortcut component discovery\nif command -v kded6 >/dev/null 2>&1; then\n    kded6 &>/dev/null &\n    sleep 2\nfi\n# ---------------------------------------------------------------------------\n' \
        "$pkgdir/usr/bin/start-kineticwe"

    # Install Wayland session desktop entry (for SDDM, greetd, etc.)
    echo "==> Installing wayland-sessions desktop entry..."
    mkdir -p "$pkgdir/usr/share/wayland-sessions"
    sed -e "s|@INSTALL_PREFIX@|/usr|g" \
        "$srcdir/$_sourcebase/scripts/kineticwe.desktop.in" \
        > "$pkgdir/usr/share/wayland-sessions/kineticwe.desktop"
    chmod 0644 "$pkgdir/usr/share/wayland-sessions/kineticwe.desktop"
    # Install systemd drop-in to mask the standalone kglobalacceld daemon
    # KineticWE embeds kglobalacceld in-process; the standalone daemon would
    # conflict on D-Bus (org.kde.kglobalaccel) and break global shortcuts.
    echo "==> Installing kglobalacceld systemd mask..."
    mkdir -p "$pkgdir/etc/systemd/user/plasma-kglobalaccel.service.d"
    cat > "$pkgdir/etc/systemd/user/plasma-kglobalaccel.service.d/kineticwe-mask.conf" << MASKEOF
[Unit]
# KineticWE has kglobalacceld built in. Prevent the standalone daemon from
# starting so it does not conflict with the compositor's D-Bus registration.
ConditionPathExists=/nonexistent

[Service]
ExecStart=
MASKEOF
    chmod 0644 "$pkgdir/etc/systemd/user/plasma-kglobalaccel.service.d/kineticwe-mask.conf"
}
# ---------------------------------------------------------------------------
# Post-install hooks (like COPR %%post / %%postun)
# Reload user daemon so the kglobalacceld mask takes effect immediately.
# ---------------------------------------------------------------------------
post_install() {
    # Reload user daemon so the kglobalacceld mask takes effect
    systemctl --user daemon-reload 2>/dev/null || true
}

post_upgrade() {
    post_install
}

post_remove() {
    # Clean up: reload daemon after removing the mask
    systemctl --user daemon-reload 2>/dev/null || true
}
