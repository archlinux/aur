# Original Author: Yamakaky <yamakaky@yamaworld_fr>
# Edited by: Thomas <tpxp@live.fr> for the git version
# Edited by: Archisman Panigrahi <apandada1ATgmail.com>
pkgname=safeeyes-git
pkgver=3.3.1.r5.gc402616
pkgrel=1
pkgdesc="A Free and Open Source tool for Linux users to reduce and prevent repetitive strain injury (RSI). Latest version from the git repository"
arch=("any")
url="https://github.com/slgobinath/safeeyes"
license=("GPL3")
depends=("libnotify"
         "gtk4"
         "python-babel"
         "python-gobject"
         "python-packaging"
         "python-psutil"
         "python-xlib")
provides=("safeeyes")
conflicts=("safeeyes")
makedepends=("python-packaging" "python-pip")
optdepends=("python-pywayland: for Smart Pause plugin in Wayland" "xprintidle: for Smart Pause plugin in X11" "ffmpeg: For playing the audible bell" "python-croniter: for Health Stats plugin" "snixembed: For tray icon support in LXDE/MATE/WMs")
source=("git+https://github.com/slgobinath/safeeyes.git")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/safeeyes"
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/safeeyes"
    # Use pip so pyproject.toml (PEP 517) is respected; install into /usr under $pkgdir
    python -m pip install --root="$pkgdir" --prefix=/usr --no-deps --ignore-installed .

    # Copy desktop file and icons from site-packages into /usr/share
    sitepkg_dir=$(find "$pkgdir/usr/lib" -maxdepth 3 -type d -name "site-packages" -print -quit)
    if [ -n "$sitepkg_dir" ]; then
        mappings=(
            "safeeyes/platform/io.github.slgobinath.SafeEyes.desktop usr/share/applications"
            "safeeyes/platform/icons/hicolor/128x128/apps/io.github.slgobinath.SafeEyes.png usr/share/icons/hicolor/128x128/apps"
            "safeeyes/platform/icons/hicolor/16x16/apps/io.github.slgobinath.SafeEyes.png usr/share/icons/hicolor/16x16/apps"
            "safeeyes/platform/icons/hicolor/16x16/status/io.github.slgobinath.SafeEyes-disabled.png usr/share/icons/hicolor/16x16/status"
            "safeeyes/platform/icons/hicolor/16x16/status/io.github.slgobinath.SafeEyes-enabled.png usr/share/icons/hicolor/16x16/status"
            "safeeyes/platform/icons/hicolor/16x16/status/io.github.slgobinath.SafeEyes-timer.png usr/share/icons/hicolor/16x16/status"
            "safeeyes/platform/icons/hicolor/24x24/apps/io.github.slgobinath.SafeEyes.png usr/share/icons/hicolor/24x24/apps"
            "safeeyes/platform/icons/hicolor/24x24/status/io.github.slgobinath.SafeEyes-disabled.png usr/share/icons/hicolor/24x24/status"
            "safeeyes/platform/icons/hicolor/24x24/status/io.github.slgobinath.SafeEyes-enabled.png usr/share/icons/hicolor/24x24/status"
            "safeeyes/platform/icons/hicolor/24x24/status/io.github.slgobinath.SafeEyes-timer.png usr/share/icons/hicolor/24x24/status"
            "safeeyes/platform/icons/hicolor/32x32/apps/io.github.slgobinath.SafeEyes.png usr/share/icons/hicolor/32x32/apps"
            "safeeyes/platform/icons/hicolor/32x32/status/io.github.slgobinath.SafeEyes-disabled.png usr/share/icons/hicolor/32x32/status"
            "safeeyes/platform/icons/hicolor/32x32/status/io.github.slgobinath.SafeEyes-enabled.png usr/share/icons/hicolor/32x32/status"
            "safeeyes/platform/icons/hicolor/48x48/apps/io.github.slgobinath.SafeEyes.png usr/share/icons/hicolor/48x48/apps"
            "safeeyes/platform/icons/hicolor/48x48/status/io.github.slgobinath.SafeEyes-disabled.png usr/share/icons/hicolor/48x48/status"
            "safeeyes/platform/icons/hicolor/48x48/status/io.github.slgobinath.SafeEyes-enabled.png usr/share/icons/hicolor/48x48/status"
        )

        for m in "${mappings[@]}"; do
            src_rel=${m%% *}
            dest_dir=${m#* }
            src_path="$sitepkg_dir/$src_rel"
            if [ -f "$src_path" ]; then
                mkdir -p "$pkgdir/$dest_dir"
                install -Dm644 "$src_path" "$pkgdir/$dest_dir/$(basename "$src_rel")"
            fi
        done
    fi
}
