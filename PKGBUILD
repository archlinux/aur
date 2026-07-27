# Maintainer: 1ay1 <https://github.com/1ay1>
#
# NOTE: pkgver is kept in sync with meson.build by scripts/version.sh — do not
# hand-edit it. `scripts/version.sh set <x.y.z>` rewrites this file, and CI
# fails the build if it drifts (see .github/workflows/quality.yml).
pkgname=neowall-git
pkgver=0.5.5
pkgrel=1
pkgdesc="GPU shader wallpapers for Wayland and X11"
arch=('x86_64' 'aarch64')
url="https://github.com/1ay1/neowall"
license=('MIT')
depends=(
    'wayland'
    'mesa'
    'libpng'
    'libjpeg-turbo'
    'libx11'
    'libxrandr'
    'libxkbcommon'
)
makedepends=(
    'git'
    'meson'
    'ninja'
    'wayland-protocols'
    'pkgconf'
)
provides=('neowall')
conflicts=('neowall')
source=("git+https://github.com/1ay1/neowall.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/neowall"
    # Try to get version from git tags
    if git describe --long --tags 2>/dev/null | grep -q "^v"; then
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        # Fallback: meson.build version + commit count + short hash. The
        # literal below is only reached in a tagless shallow clone; keep it in
        # step with meson.build (scripts/version.sh does that automatically).
        local meson_ver
        meson_ver=$(grep "version:" meson.build 2>/dev/null | head -1 | sed "s/.*'\([^']*\)'.*/\1/")
        local commit_count
        commit_count=$(git rev-list --count HEAD)
        local short_hash
        short_hash=$(git rev-parse --short HEAD)
        printf "%s.r%s.g%s" "${meson_ver:-0.5.3}" "$commit_count" "$short_hash"
    fi
}

build() {
    cd "$srcdir/neowall"
    arch-meson build
    meson compile -C build
}

check() {
    cd "$srcdir/neowall"
    meson test -C build --print-errorlogs
}

package() {
    cd "$srcdir/neowall"
    meson install -C build --destdir "$pkgdir"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
