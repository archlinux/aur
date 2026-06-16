# Maintainer: LetalexAlex <letalexalexx@gmail.com>
pkgname=arrowvortex-linux-git
pkgver=r363.06b8454
pkgver() {
    cd "$srcdir/ArrowVortex"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=4
pkgdesc="Stepmania .sm/.ssc simfile editor (linux port branch)"
arch=('x86_64')
options=('!debug' '!lto')
url="https://github.com/uvcat7/ArrowVortex/tree/linux"
license=('GPL-3.0-or-later')
provides=('arrowvortex')
conflicts=('arrowvortex')
depends=(
    'libgl'
    'libx11'
    'libxext'
    'libxrandr'
    'libxcursor'
    'libxfixes'
    'libxi'
    'libxss'
    'wayland'
    'libxkbcommon'
    'libdrm'
    'mesa'
    'alsa-lib'
    'libpulse'
    'jack'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'pkg-config'
    'python'
    'python-jinja'
    'curl'
    'zip'
    'unzip'
    'tar'
    'libxrandr'
    'libxcursor'
    'libxfixes'
    'libxi'
    'libxss'
    'wayland-protocols'
    'libdecor'
    'libusb'
    'sndio'
    'libltdl'
    'autoconf'
    'autoconf-archive'
    'nasm'
    'automake'
    'libtool'
    'libxft'
)
source=(
    "ArrowVortex::git+https://github.com/uvcat7/ArrowVortex.git#branch=linux"
    "vcpkg::git+https://github.com/microsoft/vcpkg.git"
    'disable-warning-override-init.patch'
    'arrowvortex.desktop'
)
sha256sums=('SKIP' 'SKIP' '30d7372ac951080222f866d76e5aa89b0616af0ebfb559646faa37d3b8b5b8b3' '9b625ea1fffd71cd165f195244ed979b8723d4d6531f7c48b08a6824dd82e963')

prepare() {
    cd "$srcdir"

    # Ensure we use system tools (important for clean-chroot reproducibility;
    # also avoids picking up user pyenv shims during local builds).
    export PATH='/usr/bin:/usr/sbin:/bin:/sbin'

    # CMakeLists.txt unconditionally sets CMAKE_CXX_CLANG_TIDY with
    # --warnings-as-errors=*, which fires on SDL3 headers we don't control.
    # Patch it out before configuring.
    sed -i 's/^set(CMAKE_CXX_CLANG_TIDY.*/# clang-tidy disabled for packaging/' \
        ArrowVortex/CMakeLists.txt

    # Pin vcpkg to the exact baseline declared in vcpkg.json for reproducibility
    local baseline
    baseline=$(grep -o '"baseline": *"[^"]*"' ArrowVortex/vcpkg.json | grep -o '[a-f0-9]\{40\}')
    echo "Checking out vcpkg baseline: $baseline"
    git -C vcpkg checkout "$baseline"

    cd vcpkg
    VCPKG_DISABLE_METRICS=1 ./bootstrap-vcpkg.sh -disableMetrics

    # vcpkg's libsystemd port can fail on newer glibc errno sets (e.g. EFSBADCRC)
    # due to systemd using -Werror=override-init in its Meson warning list.
    # Overlay the port and relax that one flag.
    local overlay="$srcdir/vcpkg-overlays/libsystemd"
    mkdir -p "$overlay"
    cp -a "$srcdir/vcpkg/ports/libsystemd/." "$overlay/"
    cp "$srcdir/disable-warning-override-init.patch" "$overlay/"
    if ! grep -q disable-warning-override-init "$overlay/portfile.cmake"; then
        sed -i '/disable-warning-nonnull.patch/a\    disable-warning-override-init.patch' \
            "$overlay/portfile.cmake"
    fi
}

build() {
    cd "$srcdir/ArrowVortex"

    export PATH='/usr/bin:/usr/sbin:/bin:/sbin'
    export VCPKG_ROOT="$srcdir/vcpkg"
    export VCPKG_DISABLE_METRICS=1

    cmake \
        -B build \
        -S . \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake" \
        -DVCPKG_OVERLAY_PORTS="$srcdir/vcpkg-overlays" \
        -DVCPKG_TARGET_TRIPLET=x64-linux \
        -DYML=1

    cmake --build build
}

package() {
    cd "$srcdir/ArrowVortex"

    # Binary
    install -Dm755 build/src/System/ArrowVortex "$pkgdir/usr/bin/ArrowVortex"

    # Data directories
    install -dm755 "$pkgdir/usr/share/arrowvortex"
    cp -r bin/assets    "$pkgdir/usr/share/arrowvortex/"
    cp -r bin/noteskins "$pkgdir/usr/share/arrowvortex/"
    cp -r bin/settings  "$pkgdir/usr/share/arrowvortex/"

    # Wrapper script: sets working directory so the binary finds its assets
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/arrowvortex" <<'EOF'
#!/bin/sh
cd /usr/share/arrowvortex
exec /usr/bin/ArrowVortex "$@"
EOF

    # Desktop entry
    install -Dm644 "$srcdir/arrowvortex.desktop" \
        "$pkgdir/usr/share/applications/arrowvortex.desktop"

    # Icon
    install -Dm644 \
        "bin/assets/arrow vortex icon.png" \
        "$pkgdir/usr/share/pixmaps/arrowvortex.png"
}
