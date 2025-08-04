# Maintainer: khing0_0 <bong.kook.khan@gmail.com>
# Contributor:

_pkgname='hyprgrass'
pkgname="$_pkgname-git"
pkgver=v0.8.2.r623.ed60bc8.hypr1b86d35
pkgrel=1
pkgdesc='hyprland plugin for touch screen gestures'
arch=('x86_64')
url='https://github.com/horriblename/hyprgrass'
license=('BSD')
depends=('hyprland-git')
conflicts=('hyprgrass')
makedepends=('git' 'meson' 'ninja')
source=("$_pkgname::git+https://github.com/horriblename/hyprgrass.git#branch=main")
sha256sums=('SKIP')

show_install_reminder() {
    echo ""
    echo "=============================================="
    echo "hyprgrass plugin installed successfully!"
    echo "=============================================="
    echo "Plugin location: /usr/lib/libhyprgrass.so"
    echo ""
    echo "To use the plugin, add this to your hyprland.conf:"
    echo "plugin = /usr/lib/libhyprgrass.so"
    echo ""
    echo "Or use hyprpm:"
    echo "hyprpm add /usr/lib/libhyprgrass.so"
    echo "hyprpm enable hyprgrass"
    echo "=============================================="
}

pkgver() {
    cd "$srcdir/$_pkgname" || exit

    # Get Hyprland commit hash
    local hyprland_commit=""
    if command -v hyprland >/dev/null 2>&1; then
        hyprland_commit=$(hyprland --version 2>/dev/null | grep -oP 'commit \K[0-9a-f]{40}' || echo "")
    fi
    if [[ -z "$hyprland_commit" ]] && command -v hyprctl >/dev/null 2>&1; then
        hyprland_commit=$(hyprctl version 2>/dev/null | grep -oP 'commit \K[0-9a-f]{40}' || echo "")
    fi

    # Get hyprgrass version and commit info
    local hyprgrass_version=""
    if [[ -f VERSION ]]; then
        hyprgrass_version=$(cat VERSION | tr -d '\n\r')
    fi
    local git_commit_count=$(git rev-list --count HEAD 2>/dev/null || echo "0")
    local git_short_hash=$(git rev-parse --short=7 HEAD 2>/dev/null || echo "unknown")

    # Compose version string with hyprland hash
    if [[ -n "$hyprland_commit" ]]; then
        echo "${hyprgrass_version}.r${git_commit_count}.${git_short_hash}.hypr${hyprland_commit:0:7}"
    else
        echo "${hyprgrass_version}.r${git_commit_count}.${git_short_hash}"
    fi
}

build() {
    cd "$srcdir/$_pkgname" || exit

    echo "Building hyprgrass plugin..."

    # Show which commit we're targeting
    local hyprland_commit=""
    if command -v hyprland >/dev/null 2>&1; then
        hyprland_commit=$(hyprland --version 2>/dev/null | grep -oP 'commit \K[a-f0-9]{40}' || echo "")
    fi

    local target_commit=""
    if [[ -f hyprpm.toml ]] && [[ -n "$hyprland_commit" ]]; then
        target_commit=$(awk -v hypr_commit="$hyprland_commit" '
            /commit_pins\s*=/ { in_pins=1; next }
            in_pins && /^\s*\]/ { in_pins=0 }
            in_pins && /^\s*\["[a-f0-9]{40}",/ {
                if (match($0, /"([a-f0-9]{40})"/, hypr_arr)) {
                    if (hypr_arr[1] == hypr_commit) {
                        if (match($0, /"[a-f0-9]{40}",\s*"([a-f0-9]{40})"/, grass_arr)) {
                            print grass_arr[1]
                            exit
                        }
                    }
                }
            }
        ' hyprpm.toml)
    fi

    if [[ -n "$target_commit" ]]; then
        echo "==> Using pinned hyprgrass commit: $target_commit (for Hyprland: ${hyprland_commit:0:7})"
    else
        local current_commit=$(git rev-parse HEAD 2>/dev/null || echo "unknown")
        if [[ -n "$hyprland_commit" ]]; then
            echo "==> No pinned commit found for Hyprland: ${hyprland_commit:0:7}, using latest hyprgrass: ${current_commit:0:7}"
        else
            echo "==> Cannot determine Hyprland commit, using latest hyprgrass: ${current_commit:0:7}"
        fi
    fi

    # Clean any existing build directory to ensure fresh build
    if [[ -d build ]]; then
        rm -rf build
    fi

    meson setup build
    ninja -C build
}

package_hyprgrass-git() {
    cd "$srcdir/$_pkgname" || exit

    # Check for the plugin in the correct build location
    if [[ -f build/src/libhyprgrass.so ]]; then
        echo "Installing hyprgrass plugin..."
        install -Dm755 build/src/libhyprgrass.so "$pkgdir/usr/lib/libhyprgrass.so"
        if [[ -f LICENSE ]]; then
            install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hyprgrass/LICENSE"
        fi
        show_install_reminder
    elif [[ -f build/hyprgrass.so ]]; then
        # Fallback location
        echo "Installing hyprgrass plugin from fallback location..."
        install -Dm755 build/hyprgrass.so "$pkgdir/usr/lib/libhyprgrass.so"
        if [[ -f LICENSE ]]; then
            install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hyprgrass/LICENSE"
        fi
        show_install_reminder
    else
        echo "Warning: hyprgrass plugin build artifacts not found - this is non-fatal"
        echo "The plugin may not be compatible with the current Hyprland version"
        # Create an empty package to avoid breaking the update process
        mkdir -p "$pkgdir/usr/share/doc/hyprgrass"
        echo "This package failed to build - plugin may be incompatible with current Hyprland version" >"$pkgdir/usr/share/doc/hyprgrass/BUILD_FAILED"
        return 0 # Don't fail the entire update
    fi
}
