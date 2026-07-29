# Maintainer: TheBlackDon <theblackdon@codeberg.org>
# Contributor: KineticWE project

pkgname=kineticwe
pkgver=6.7.80
pkgrel=13
# epoch: AUR previously shipped 6.7.81-x; the project re-aligned on the COPR
# 6.7.80-N numbering, which pacman would otherwise see as a downgrade.
epoch=1
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
    'powerdevil'
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
# kwin-wayland, kglobalacceld, kglobalacceld-devel, and kdecoration.
# On Arch, kwin-common/kwin-libs/kwin-wayland are bundled in 'kwin', but we
# provide them virtually so packages that reference them see them satisfied.
replaces=('kwin' 'kglobalacceld' 'kdecoration')
provides=('kglobalacceld' 'kglobalacceld-devel' 'kdecoration' 'kwin' 'kwin-common' 'kwin-libs' 'kwin-wayland')
conflicts=('kwin' 'kglobalacceld' 'kglobalacceld-devel' 'kdecoration')


# Source: kwin-we from GitLab + kglobalacceld/kdecoration from KDE invent
# kwin-we is pinned to a commit (not a tag) to match the COPR 6.7.80-N
# releases, which package master HEAD via `git archive`. Bump _commit and
# reset pkgrel together on each upstream sync.
# kglobalacceld and kdecoration are pinned to KDE master commits: kwin-we
# needs the post-6.7 KGlobalAccelD API and the KDecoration3::Style enum
# (server-side drop shadows for CSD windows), neither of which is in a
# released version yet. Bump both pins together with _commit on each sync.
_commit=810f1f63b0bc9645037b097e9f328f76671b6bb5
_kglobalacceld_commit=5cc88399d8e2a7951798f85127e23f73f1fa0889
_kdecoration_commit=d13049250c0ea1afc279aa8dc99243565c0d83e8
_sourcebase="$pkgname-$pkgver"
source=(
    "$url/-/archive/$_commit/$pkgname-$_commit.tar.gz"
    "kglobalacceld::git+https://invent.kde.org/plasma/kglobalacceld.git#commit=$_kglobalacceld_commit"
    "kdecoration::git+https://invent.kde.org/plasma/kdecoration.git#commit=$_kdecoration_commit"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "$srcdir"

    echo "==> Extracting kwin-we source..."
    # GitLab commit archive extracts to 'kineticwe-$_commit', rename to $_sourcebase
    local extract_dir="$pkgname-$_commit"
    if [[ -d "$extract_dir" && ! -d $_sourcebase ]]; then
        mv "$extract_dir" "$_sourcebase"
    fi
    # Fallback: also handle plain 'kineticwe' extraction
    if [[ -d kineticwe && ! -d $_sourcebase ]]; then
        mv kineticwe "$_sourcebase"
    fi

    echo "==> Preparing kglobalacceld and kdecoration..."
    # Both are already cloned at their pinned commits via git sources;
    # no extra prep needed
    cd "$srcdir"
}

build() {
    cd "$srcdir"

    # --- Phase 1: Build kglobalacceld ---
    echo "==> Building kglobalacceld (pinned KDE master commit)..."

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

    # --- Phase 2: Build kdecoration (pinned KDE master commit) ---
    # kwin-we uses KDecoration3::Style (server-side drop shadows for CSD
    # windows), which only exists in kdecoration master — the released 6.7.x
    # in the repos is too old. Build it and stage it next to kglobalacceld.
    echo "==> Building kdecoration (pinned KDE master commit)..."

    mkdir -p kdecoration/build
    pushd kdecoration/build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -Wno-dev

    cmake --build . --parallel "$(nproc)"
    popd

    DESTDIR="$srcdir/kga-staging" cmake --install kdecoration/build

    # --- Phase 3: Build kwin-we ---
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

    echo "==> Installing kdecoration..."
    DESTDIR="$pkgdir" cmake --install kdecoration/build

    echo "==> Installing kwin-we..."
    cd "$_sourcebase/build"
    DESTDIR="$pkgdir" cmake --install .

    # Remove static libs and cmake files from main package
    rm -f "$pkgdir/usr/lib/cmake/KGlobalAccelD/"*.cmake 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/"*.a 2>/dev/null || true

    # Strip kglobalacceld development files (matching COPR — keep only runtime lib)
    rm -rf "$pkgdir/usr/include/KGlobalAccelD" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/libKGlobalAccelD.so" 2>/dev/null || true

    # Strip kdecoration development files (matching COPR — keep only runtime libs)
    rm -rf "$pkgdir/usr/include/KDecoration3" 2>/dev/null || true
    rm -f "$pkgdir/usr/include/KF6/kdecoration3_version.h" 2>/dev/null || true
    rm -rf "$pkgdir/usr/lib/cmake/KDecoration3" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/libkdecorations3.so" 2>/dev/null || true
    rm -f "$pkgdir/usr/lib/libkdecorations3private.so" 2>/dev/null || true

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

    # Install kdecoration license
    if [[ -d "$srcdir/kdecoration/LICENSES" ]]; then
        install -Dm644 "$srcdir/kdecoration/LICENSES/"* \
            -t "$pkgdir/usr/share/licenses/$pkgname-kdecoration/" 2>/dev/null || true
    fi

    # Install Wayland session launcher (start-kineticwe) - written directly to avoid sed issues
    echo "==> Installing start-kineticwe session launcher..."
    cat > "$pkgdir/usr/bin/start-kineticwe" << 'STARTEOF'
#!/bin/bash
# KineticWE session launcher (system-wide install)

_INSTALL_PREFIX_=/usr

export XDG_MENU_PREFIX=plasma-
# Marks this as a full KDE session (startplasma sets this too). KDE apps use
# it to pick their desktop file identity — e.g. System Settings uses
# systemsettings.desktop instead of kdesystemsettings.desktop, which is what
# docks/launchers need to resolve its icon correctly.
export KDE_FULL_SESSION=true

find_portal() {
    local name="$1"
    for path in "/usr/libexec/$name" "/usr/lib/$name" "$_INSTALL_PREFIX_/libexec/$name"
    do
        if [[ -x "$path" ]]; then
            printf '%s\n' "$path"
            return 0
        fi
    done
    command -v "$name" 2>/dev/null || true
}

find_bin() {
    local name="$1"
    for path in "/usr/libexec/$name" "/usr/lib/$name" "/usr/bin/$name"
    do
        if [[ -x "$path" ]]; then
            printf '%s\n' "$path"
            return 0
        fi
    done
    command -v "$name" 2>/dev/null || true
}

PORTAL_KDE="$(find_portal xdg-desktop-portal-kde)"
PORTAL="$(find_portal xdg-desktop-portal)"
POWERDEVIL="$(find_bin org_kde_powerdevil)"
UPOWERD="$(find_bin upowerd)"

# The payload below is written with a quoted heredoc ('PAYLOADEOF'), so these
# variables are expanded when the payload runs, not when it is written. They
# must be exported, otherwise the payload sees them as empty and the portals
# and power management daemons are never launched.
export PORTAL_KDE PORTAL POWERDEVIL UPOWERD

STARTUP_PAYLOAD_DIR="${XDG_RUNTIME_DIR:-/tmp}/kineticwe-$USER"
mkdir -p "$STARTUP_PAYLOAD_DIR"
STARTUP_PAYLOAD="$STARTUP_PAYLOAD_DIR/startup.sh"

cat > "$STARTUP_PAYLOAD" << 'PAYLOADEOF'
#!/bin/bash
# KineticWE startup payload — run by KWin as a detached child process.

export PATH=/usr/bin:/usr/lib
export XDG_CURRENT_DESKTOP=KDE
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=KDE
export KDE_SESSION_VERSION=6
export KDE_FULL_SESSION=true
export XDG_MENU_PREFIX=plasma-

# KWin exports WAYLAND_DISPLAY and DISPLAY (XWayland) before launching this
# payload; the fallback guards against the payload being started other ways.
export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-0}"

# Publish the session environment to D-Bus/systemd-activated services.
# Without this, on-demand services (e.g. Spectacle via its global shortcut)
# start without WAYLAND_DISPLAY/DISPLAY and crash at launch:
# "could not activate remote peer org.kde.spectacle: startup job failed".
dbus-update-activation-environment --systemd --all 2>/dev/null || true

# 1. Rebuild KDE service cache so System Settings finds installed KCMs
if command -v kbuildsycoca6 >/dev/null 2>&1; then
    kbuildsycoca6 --noincremental 2>/dev/null || true
fi

# 2. Start XDG Desktop Portals
killall -q xdg-desktop-portal-kde xdg-desktop-portal xdg-desktop-portal-gtk xdg-document-portal 2>/dev/null || true
sleep 1

mkdir -p "$HOME/.local/share"

if [[ -x "$PORTAL_KDE" ]]; then
    XDG_CURRENT_DESKTOP=KDE nohup "$PORTAL_KDE" >"$HOME/.local/share/xdg-desktop-portal-kde.log" 2>&1 &
else
    echo "Warning: xdg-desktop-portal-kde not found" >&2
fi

sleep 2

if [[ -x "$PORTAL" ]]; then
    nohup "$PORTAL" >"$HOME/.local/share/xdg-desktop-portal.log" 2>&1 &
else
    echo "Warning: xdg-desktop-portal not found" >&2
fi

# 2.5. Start kded6 for shortcut component discovery
if command -v kded6 >/dev/null 2>&1; then
    kded6 &>/dev/null &
    sleep 2
fi

# 3. Start power management
# org_kde_powerdevil aborts at startup if WAYLAND_DISPLAY is unset (which
# happens when it is spawned via D-Bus activation instead of this payload).
# KWin exports WAYLAND_DISPLAY before launching this payload; the fallback
# keeps PowerDevil alive if the payload is started any other way.
export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-0}"

# upowerd provides battery and power device monitoring via D-Bus
if [[ -n "$UPOWERD" ]]; then
    nohup "$UPOWERD" >"$HOME/.local/share/upowerd.log" 2>&1 &
    # Give upowerd time to register on D-Bus before starting powerdevil
    sleep 2
fi

# org_kde_powerdevil provides idle timeouts, DPMS, suspend, brightness, and power profile management
if [[ -n "$POWERDEVIL" ]]; then
    nohup "$POWERDEVIL" >"$HOME/.local/share/powerdevil.log" 2>&1 &
else
    echo "Warning: org_kde_powerdevil not found; power management unavailable" >&2
fi

# 4. Start the shell (supervised)
# Run noctalia under a supervisor loop: if it crashes or is killed (e.g.
# pkill noctalia to recover a broken shell), it restarts automatically
# instead of taking the whole session down. The session ends only when the
# login session itself is terminated (logout -> loginctl terminate-session,
# or the display manager), which tears down this payload and KWin together.
while true; do
    noctalia >"$HOME/.local/share/noctalia.log" 2>&1
    echo "noctalia exited (code $?), restarting in 2s..."
    sleep 2
done
PAYLOADEOF

chmod +x "$STARTUP_PAYLOAD"

# ---------------------------------------------------------------------------
# 5. Stop any competing global-shortcuts daemon and verify D-Bus name is free
# ---------------------------------------------------------------------------
# kwin-we embeds kglobalacceld and registers the org.kde.kglobalaccel D-Bus
# service at startup (KGlobalAccelD::init).  If a Plasma session was
# previously active, the standalone plasma-kglobalaccel.service (which runs
# /usr/libexec/kglobalacceld) may still own that D-Bus name.  When that
# happens kwin-we's init() fails to register the service, m_kglobalAccel is
# reset, and ALL keyboard shortcuts stop working with the error
# "error communicating with global shortcuts service".
#
# Stop any competing daemon so kwin-we can claim the name cleanly, then
# verify the D-Bus name is actually free before proceeding.

_kglobalaccel_cleared=false
for _attempt in 1 2 3 4 5; do
    # Try stopping via systemd and pkill
    systemctl --user stop plasma-kglobalaccel.service 2>/dev/null || true
    pkill -x kglobalacceld 2>/dev/null || true
    sleep 1

    # Check if the D-Bus service name is free.
    if command -v busctl >/dev/null 2>&1; then
        if ! busctl get-proxy org.kde.kglobalaccel /kglobalaccel >/dev/null 2>&1; then
            _kglobalaccel_cleared=true
            break
        fi
        # Service still owns the name — try harder
        pkill -9 -x kglobalacceld 2>/dev/null || true
    else
        # No busctl available, assume stop was enough
        _kglobalaccel_cleared=true
        break
    fi
done

if [[ "$_kglobalaccel_cleared" != "true" ]]; then
    echo "Warning: Could not clear kglobalacceld D-Bus name. Shortcuts may not work." >&2
fi

export XDG_CURRENT_DESKTOP=KineticWE:KDE
exec kinetic-we --xwayland --exit-with-session "$STARTUP_PAYLOAD"
STARTEOF
    chmod 0755 "$pkgdir/usr/bin/start-kineticwe"


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

    # Install D-Bus service activation file for org.kde.kglobalaccel
    # The original kglobalacceld package provides this file, but since kineticwe
    # replaces/conflicts with kglobalacceld, the file is missing. Without it,
    # D-Bus activation fails and shortcuts KCM shows
    # "Error while communicating with the global shortcuts service".
    echo "==> Installing D-Bus activation for org.kde.kglobalaccel..."
    mkdir -p "$pkgdir/usr/share/dbus-1/services"
    cat > "$pkgdir/usr/share/dbus-1/services/org.kde.kglobalaccel.service" << DBUSEOF
[D-BUS Service]
Name=org.kde.kglobalaccel
Exec=/usr/libexec/kineticwe-kglobalacceld-bridge
DBUSEOF
    chmod 0644 "$pkgdir/usr/share/dbus-1/services/org.kde.kglobalaccel.service"

    # Install the bridge script for D-Bus activation
    echo "==> Installing kineticwe-kglobalacceld-bridge..."
    mkdir -p "$pkgdir/usr/libexec"
    cat > "$pkgdir/usr/libexec/kineticwe-kglobalacceld-bridge" << 'BRIDGEEOF'
#!/bin/bash
# KineticWE kglobalacceld bridge for D-Bus activation.
# The real kglobalacceld is embedded in-process in kinetic-we.
# This script handles D-Bus activation requests gracefully.
for i in 1 2 3 4 5; do
    if busctl get-property org.kde.kglobalaccel /kglobalaccel org.kde.KGlobalAccel 2>/dev/null >/dev/null; then
        exit 0
    fi
    sleep 1
done
echo "kineticwe-kglobalacceld-bridge: kinetic-we not running or kglobalaccel service not registered." >&2
exit 1
BRIDGEEOF
    chmod 0755 "$pkgdir/usr/libexec/kineticwe-kglobalacceld-bridge"
}

# ---------------------------------------------------------------------------
# Post-install hooks (like COPR %%post / %%postun)
# Reload user daemon so the kglobalacceld mask takes effect immediately.
# ---------------------------------------------------------------------------
post_install() {
    # Reload user daemon so the kglobalacceld mask takes effect
    systemctl --user daemon-reload 2>/dev/null || true
    # Explicitly mask the standalone kglobalacceld service to prevent D-Bus activation
    systemctl --user mask plasma-kglobalaccel.service 2>/dev/null || true
}

post_upgrade() {
    post_install
}

post_remove() {
    # Clean up: unmask and reload daemon after removing the mask
    systemctl --user unmask plasma-kglobalaccel.service 2>/dev/null || true
    systemctl --user daemon-reload 2>/dev/null || true
}
