# Maintainer: vaxp <https://github.com/vaxp>
# Contributor: vaxp

pkgname=vaxp-aether
pkgver=0.1.0
pkgrel=1
pkgdesc="Aether – a wlroots-based Wayland compositor"
arch=('x86_64' 'aarch64')
url="https://github.com/vaxp/aether"
license=('MIT')
groups=()

# Runtime dependencies (inferred from meson.build dependency() calls)
depends=(
    'wayland'           # wayland-server >= 1.22.0
    'wlroots'           # wlroots-0.19  >= 0.19.0
    'libxkbcommon'      # xkbcommon
    'libinput'          # libinput >= 1.25.0
    'pcre2'             # libpcre2-8
    'cairo'             # cairo
    'pango'             # pangocairo  (provided by pango)
    'gdk-pixbuf2'       # gdk-pixbuf-2.0
    'xcb-util-wm'       # xcb-icccm  (XWayland support)
    'libxcb'            # xcb         (XWayland support)
    'xwayland'          # XWayland runtime
)

# Build-time only dependencies
makedepends=(
    'meson'
    'ninja'
    'git'
    'wayland-protocols' # wayland-protocols (used in protocols/meson.build)
    'wayland'           # wayland-scanner   (provided by wayland package on Arch)
    'gcc'
)

# Optional runtime extras (portal support)
optdepends=(
    'xdg-desktop-portal: screen capture / portal support'
    'xdg-desktop-portal-wlr: wlroots XDG portal backend'
)

# scenefx is bundled as a Meson subproject (wrap-git) and built statically,
# so it does NOT appear as a runtime dependency.
# Its own transitive deps that are NOT already listed above:
makedepends+=(
    'libdrm'            # libdrm >= 2.4.122 (scenefx subproject)
    'pixman'            # pixman-1 >= 0.43.0 (scenefx subproject)
)

provides=('vaxp-aether')
conflicts=()

source=("${pkgname}::git+${url}.git#branch=main"
        "scenefx::git+https://github.com/wlrfx/scenefx.git#tag=0.4.1")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${pkgname}"
    # Use meson.build version + short commit hash, matching the project's own versioning
    local _ver
    _ver=$(grep -m1 "version :" meson.build | grep -oP "'\K[^']+")
    printf "%s.r%s.g%s" "${_ver}" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"

    # Point the scenefx wrap to our pre-fetched source tree so that
    # meson does not attempt a network download at configure time.
    mkdir -p subprojects
    # Remove any stale cached wrap state
    rm -rf subprojects/scenefx
    cp -a "${srcdir}/scenefx" subprojects/scenefx
}

build() {
    cd "${pkgname}"

    arch-meson . build \
        --prefix=/usr \
        --sysconfdir=/etc \
        --buildtype=release \
        --wrap-mode=nodownload \
        -D xwayland=enabled \
        -D asan=false

    meson compile -C build
}

check() {
    # No upstream test suite defined; skip.
    :
}

package() {
    cd "${pkgname}"

    DESTDIR="${pkgdir}" meson install -C build

    # The meson.build installs:
    #   /usr/bin/aether
    #   /usr/bin/AetherMessenger
    #   /usr/share/wayland-sessions/aether.desktop
    #   /usr/share/xdg-desktop-portal/aether-portals.conf
    #   /etc/aether/{config,autostart,env,exec,keybindings}.conf

    # Install license if present
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
