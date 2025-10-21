# Maintainer: Wesley Benica <wesley at benica dot dev>

# SPDX-FileCopyrightText: 2024-2025 Wesley Benica <wesley@benica.dev>
# SPDX-License-Identifier: 0BSD

pkgname=gnome-shell-extension-text-clock
pkgver=1.1.1
pkgrel=1
pkgdesc="A simple text clock for the GNOME Shell top panel"
arch=('any')
url="https://github.com/wtbenica/text-clock"
license=('GPL-3.0-or-later')
depends=('gnome-shell>=45')
makedepends=('unzip' 'curl')
install='gnome-shell-extension-text-clock.install'

source=(
    "text-clock@benica.dev.zip::https://github.com/wtbenica/text-clock/releases/download/v${pkgver}/text-clock@benica.dev.zip"
)
sha256sums=('5f5e3abc0ced48fefe8f3171ac8304258db6dc5ea66155301b5079474dc29243')
noextract=("text-clock@benica.dev.zip")

prepare() {
    # Rename downloaded unversioned asset to include version so AUR helpers keep distinct files
    if [ -f "${srcdir}/text-clock@benica.dev.zip" ]; then
        mv "${srcdir}/text-clock@benica.dev.zip" "${srcdir}/${pkgname}-${pkgver}.zip"
    else
        # fallback: download directly and name with version
        curl -L -o "${srcdir}/${pkgname}-${pkgver}.zip" \
            "https://github.com/wtbenica/text-clock/releases/download/v${pkgver}/text-clock@benica.dev.zip"
    fi
}

package() {
    local uuid="text-clock@benica.dev"
    local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
    
    # Create the extension directory
    install -d "${destdir}"
    
    # Extract the extension ZIP file to the destination
    unzip -q "${srcdir}/${pkgname}-${pkgver}.zip" -d "${destdir}"
    
    # Set correct permissions: 644 for files, 755 for directories
    find "${destdir}" -type f -exec chmod 644 {} \;
    find "${destdir}" -type d -exec chmod 755 {} \;

    # Install GSettings schema to system location
    install -Dm644 "${destdir}/schemas/org.gnome.shell.extensions.text-clock.gschema.xml" \
        "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.text-clock.gschema.xml"

    # Warn users if a local installation exists that could conflict with the system package
    echo "Checking for local installations of the extension..."
    for d in /home/* /root; do
        [ -d "$d" ] || continue
        local_dir="$d/.local/share/gnome-shell/extensions/$uuid"
        if [ -d "$local_dir" ]; then
            echo "WARNING: local extension found at: $local_dir"
            echo "This may cause duplicate entries in GNOME Shell. Consider removing the local copy:" \
                 "  rm -rf \"$local_dir\""
        fi
    done

    # Notify users to restart GNOME Shell
    echo "==> To enable the Text Clock extension restart GNOME Shell."
    echo "==> Wayland: Log out and back in | X11: Press Alt+F2, 'r', then Enter."
}
