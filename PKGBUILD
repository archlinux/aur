# Maintainer: ProphetPX <prophetpx@gmail.com>
pkgname=google-voice-electron-archlinux
pkgver=1.3.1
pkgrel=17
pkgdesc="An electron shell wrapper for the google voice app tailored for Arch Linux"
arch=("any")
url="https://github.com/ProphetPX/google-voice-electron-archlinux"
license=("ISC")
depends=("electron" "nodejs" "npm")
source=("google-voice-electron-archlinux::git+https://github.com"
        "google-voice-desktop.desktop")
sha256sums=("SKIP"
            "SKIP")

package() {
    # 1. Setup the standard global system library directories
    install -d "$pkgdir/usr/lib/google-voice-electron-archlinux"

    # 2. Extract configuration metadata, local scripts, assets, and backend modules out of the download sandbox
    cp -L "$srcdir/google-voice-electron-archlinux/package.json" "$pkgdir/usr/lib/google-voice-electron-archlinux/"
    cp "$srcdir/google-voice-electron-archlinux/main.js" "$pkgdir/usr/lib/google-voice-electron-archlinux/"
    cp -r "$srcdir/google-voice-electron-archlinux/src" "$pkgdir/usr/lib/google-voice-electron-archlinux/"
    cp -r "$srcdir/google-voice-electron-archlinux/node_modules" "$pkgdir/usr/lib/google-voice-electron-archlinux/"
    cp -r "$srcdir/google-voice-electron-archlinux/images" "$pkgdir/usr/lib/google-voice-electron-archlinux/"

    # 3. Explicitly enforce global system read permissions on all files to prevent Electron read failures
    find "$pkgdir/usr/lib/google-voice-electron-archlinux" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/lib/google-voice-electron-archlinux" -type f -exec chmod 644 {} +

    # 4. Mount the desktop system application launcher menu icon profile globally
    install -d "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/google-voice-desktop.desktop" "$pkgdir/usr/share/applications/google-voice-desktop.desktop"

    # 5. Integrate the high-resolution visual branding icon asset globally
    if [ -f "$srcdir/google-voice-electron-archlinux/images/icon.png" ]; then
        install -Dm644 "$srcdir/google-voice-electron-archlinux/images/icon.png" "$pkgdir/usr/share/pixmaps/google-voice.png"
    fi

    # 6. Build the official upstream binary launcher script that passes arguments to the folder path context cleanly
    install -d "$pkgdir/usr/bin"
    echo -e "#!/bin/sh\nexec electron /usr/lib/google-voice-electron-archlinux \"\$@\"" > "$pkgdir/usr/bin/google-voice-desktop"
    chmod +x "$pkgdir/usr/bin/google-voice-desktop"
}

