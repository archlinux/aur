# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>

pkgname=('portprotonqt' 'portprotonqt-steam-compat')
pkgver=1.0
pkgrel=1
pkgdesc="Modern GUI for managing and launching games from PortProton and Steam"
arch=('any')
url="https://git.linux-gaming.ru/Linux-Gaming/PortProtonQt"
license=('GPL-3.0')
depends=('python-requests' 'python-babel' 'python-evdev' 'python-pygame' 'python-orjson'
    'python-psutil' 'python-tqdm' 'python-vdf' 'python-libarchive-c' 'pyside6' 'python-rapidfuzz' 'python-pefile' 'python-pillow' 'perl-image-exiftool' 'python-websocket-client' 'cabextract' 'unzip' 'curl' 'jq' 'file' 'findutils' 'gawk' 'grep' 'tar' 'xz' 'zstd' 'gzip' 'unrar' 'qt6-svg' 'qt6-imageformats' 'pciutils' 'mesa-utils' 'vulkan-icd-loader' 'procps-ng' 'psmisc' 'squashfs-tools' '7zip' 'python-dbus-fast')
makedepends=('meson' 'ninja' 'vulkan-headers' 'gettext')
source=("git+https://git.linux-gaming.ru/Linux-Gaming/PortProtonQt#tag=v$pkgver")
sha256sums=('610c46fcc4ddafecca5827f8f957b8f60107335c507070a52d3997a0131fb04b')

build() {
    arch-meson PortProtonQt build
    meson compile -C build
}

package_portprotonqt() {
    pkgdesc="Modern GUI for managing and launching games from PortProton and Steam"
    optdepends=(
        'networkmanager: System tab network management'
        'bluez: System tab bluetooth management'
        'upower: System tab bluetooth battery level'
        'libpulse: System tab audio volume/output management'
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
