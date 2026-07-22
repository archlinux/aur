# Maintainer: Vladislav <your@email.com>
# Contributor: Niccolò Belli <niccolo.belli@linuxsystems.it>
#
# Build-from-source (-git) variant of fluorine-manager-bin.
#
# The upstream build is driven by build.sh, which runs inside a Docker/Podman
# container (docker/Dockerfile) that bundles Qt6, a python-build-standalone
# runtime, PyQt6 and every shared library into a portable layout — the same
# layout the -bin package installs to /opt. We reuse that build here and then
# install the resulting bundle exactly like the -bin package.
#
# A container runtime is required at build time: install either `docker` or
# `podman` (build.sh auto-detects which one is available). The build also needs
# network access to pull the ubuntu:25.10 image and its dependencies.
pkgname=fluorine-manager-git
pkgver=0.3.0.r83.g3ddc7b7
pkgrel=1
pkgdesc="A native Linux mod manager for Bethesda and other games, built on MO2"
arch=('x86_64')
url="https://github.com/SulfurNitride/Fluorine-Manager"
license=('GPL-3.0-or-later')
depends=('fuse3' 'gtk3')
makedepends=('git')
provides=('fluorine-manager')
conflicts=('fluorine-manager' 'fluorine-manager-bin')
options=(!strip)
source=("git+https://github.com/SulfurNitride/Fluorine-Manager.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Fluorine-Manager"
    # Prefer annotated tags (v0.3.0) over the lightweight `beta` tag so the
    # version tracks releases rather than the rolling beta marker.
    git describe --long --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/Fluorine-Manager"

    # build.sh needs a container runtime to drive the upstream build.
    command -v docker >/dev/null 2>&1 || command -v podman >/dev/null 2>&1 \
        || { echo "ERROR: docker or podman is required to build ${pkgname}" >&2; return 1; }

    # Produce the portable bundle -> build/fluorine-manager/
    # (same staging layout the -bin tarball ships.)
    BUILD_JOBS="$(nproc)" ./build.sh tarball
}

package() {
    # The container build stages the portable app into build/fluorine-manager/.
    cd "$srcdir/Fluorine-Manager/build/fluorine-manager"

    # Install the entire app bundle to /opt
    install -dm755 "${pkgdir}/opt/fluorine-manager"
    cp -r . "${pkgdir}/opt/fluorine-manager/"

    # Make sure the real executable and the upstream launcher are executable
    chmod 755 "${pkgdir}/opt/fluorine-manager/ModOrganizer-core"
    chmod 755 "${pkgdir}/opt/fluorine-manager/fluorine-manager"

    # Create a wrapper in /usr/bin that replicates the upstream launcher logic
    # but targets the fixed /opt install path instead of doing the sync dance.
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/fluorine-manager" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

RUN="/opt/fluorine-manager"

# Save the original environment so game launches (Proton/Wine) can restore it.
export FLUORINE_ORIG_LD_LIBRARY_PATH="${LD_LIBRARY_PATH:-}"
export FLUORINE_ORIG_LD_PRELOAD="${LD_PRELOAD:-}"
export FLUORINE_ORIG_PATH="${PATH}"
export FLUORINE_ORIG_XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export FLUORINE_ORIG_QT_PLUGIN_PATH="${QT_PLUGIN_PATH:-}"

# Steam injects 32-bit gameoverlayrenderer.so via LD_PRELOAD which causes
# "wrong ELF class" errors for 64-bit Qt6 apps. Clear it for our process.
unset LD_PRELOAD

export PATH="${RUN}:${PATH}"

# Use only our bundled libs — avoids conflicts with Steam scout/soldier runtime.
export LD_LIBRARY_PATH="${RUN}/lib"

export MO2_BASE_DIR="${RUN}"
export MO2_PLUGINS_DIR="${RUN}/plugins"

unset PYTHONPATH PYTHONNOUSERSITE PYTHONHOME MO2_PYTHON_DIR

# Use bundled Qt6 plugins.
export QT_PLUGIN_PATH="${RUN}/qt6plugins"
export QT_QPA_PLATFORM_PLUGIN_PATH="${RUN}/qt6plugins/platforms"

# Raise open file descriptor limit for large modlists with FUSE VFS.
ulimit -n 65536 2>/dev/null

cd "${RUN}"
exec "${RUN}/ModOrganizer-core" "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/fluorine-manager"

    # Install icon
    install -Dm644 "icons/com.fluorine.manager.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.fluorine.manager.png"

    # Install the .desktop file that ships inside the bundle,
    # patching Exec= to point to our /usr/bin wrapper.
    install -dm755 "${pkgdir}/usr/share/applications"
    sed "s|^Exec=fluorine-manager|Exec=/usr/bin/fluorine-manager|" \
        "icons/com.fluorine.manager.desktop" \
        > "${pkgdir}/usr/share/applications/com.fluorine.manager.desktop"

    # Install license (shipped in the git source tree)
    install -Dm644 "${srcdir}/Fluorine-Manager/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
