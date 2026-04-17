# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>

pkgname=('portprotonqt' 'portprotonqt-steam-compat')
pkgver=0.1.12
pkgrel=1
pkgdesc="Modern GUI for managing and launching games from PortProton, Steam, and Epic Games Store"
arch=('any')
url="https://git.linux-gaming.ru/Boria138/PortProtonQt"
license=('GPL-3.0')
depends=('python-requests' 'python-babel' 'python-evdev' 'python-pyudev' 'python-orjson'
    'python-psutil' 'python-tqdm' 'python-vdf' 'python-libarchive-c' 'pyside6' 'python-rapidfuzz' 'icoextract' 'python-pillow' 'perl-image-exiftool' 'python-beautifulsoup4' 'python-websocket-client' 'cabextract' 'unzip' 'curl' 'unrar' 'qt6-svg' 'pciutils' 'mesa-utils' 'vulkan-icd-loader' '7zip')
depends_aarch64=('muvm')
makedepends=('meson' 'ninja' 'vulkan-headers' 'gettext')
source=("git+https://git.linux-gaming.ru/Boria138/PortProtonQt#tag=v$pkgver")
sha256sums=('d6ecab2ad0c39cd26347b71cb72c8a2b0b97e46fed72f058d01707bb150bc9c7')

build() {
    arch-meson PortProtonQt build
    meson compile -C build
}

package_portprotonqt() {
    pkgdesc="Modern GUI for managing and launching games from PortProton, Steam, and Epic Games Store"
    optdepends=(
        'networkmanager: System tab network management'
        'bluez: System tab bluetooth management'
        'upower: System tab bluetooth battery level'
        'libpulse: System tab audio volume/output management'
        'python-dbus-fast: System tab D-Bus integration'
        'python-qrcode: Wi-Fi QR code generation'
    )

    DESTDIR="$pkgdir" meson install -C build --skip-subprojects

    bash "$srcdir/PortProtonQt/dev-scripts/generate-completions.sh"
    install -Dpm 0644 "$srcdir/PortProtonQt/completions/portprotonqt" -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dpm 0644 "$srcdir/PortProtonQt/completions/portprotonqt.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dpm 0644 "$srcdir/PortProtonQt/completions/_portprotonqt" -t "$pkgdir/usr/share/zsh/site-functions"

    # Remove steam-compat files from main package
    rm -rf "$pkgdir/usr/share/steam"
}

package_portprotonqt-steam-compat() {
    pkgdesc="Steam compatibility tool for PortProtonQt"
    depends=('portprotonqt')

    DESTDIR="$pkgdir" meson install -C build --skip-subprojects

    # Keep only steam-compat files
    find "$pkgdir/usr" -mindepth 1 -type f -not -path "${pkgdir}/usr/share/steam*" -print0 | xargs -0 rm -f
    find "$pkgdir/usr" -mindepth 1 -type d -not -path "${pkgdir}/usr/share/steam*" -empty -delete
}
