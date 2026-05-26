# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>

pkgname=('portprotonqt')
pkgver=1.1.0
pkgrel=1
pkgdesc="Modern GUI for managing and launching games from PortProton and Steam"
arch=('any')
url="https://git.linux-gaming.ru/Linux-Gaming/PortProtonQt"
license=('GPL-3.0')
depends=('python-requests' 'python-babel' 'python-evdev' 'python-pygame' 'python-orjson'
    'python-psutil' 'python-tqdm' 'python-vdf' 'python-libarchive-c' 'pyside6' 'python-rapidfuzz' 'python-pefile' 'python-pillow' 'perl-image-exiftool' 'python-websocket-client' 'cabextract' 'unzip' 'curl' 'jq' 'file' 'findutils' 'gawk' 'grep' 'tar' 'xz' 'zstd' 'gzip' 'unrar' 'qt6-svg' 'qt6-imageformats' 'pciutils' 'mesa-utils' 'vulkan-icd-loader' 'procps-ng' 'psmisc' '7zip' 'python-dbus-fast')
makedepends=('meson' 'ninja' 'vulkan-headers' 'gettext')
conflicts=("portprotonqt-steam-compat")
provides=('portprotonqt-steam-compat')
replaces=('portprotonqt-steam-compat')
source=("git+https://git.linux-gaming.ru/Linux-Gaming/PortProtonQt#tag=v$pkgver")
sha256sums=('c6b1e83317c6f474fdcdc1118064d31f901a260e7656bfc19815e975b6dc5cf3')

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
        'squashfs-tools: for legacy PortProton prefix backup support'
    )

    DESTDIR="$pkgdir" meson install -C build --skip-subprojects

    bash "$srcdir/PortProtonQt/dev-scripts/generate-completions.sh"
    install -Dpm 0644 "$srcdir/PortProtonQt/completions/portprotonqt" -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dpm 0644 "$srcdir/PortProtonQt/completions/portprotonqt.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dpm 0644 "$srcdir/PortProtonQt/completions/_portprotonqt" -t "$pkgdir/usr/share/zsh/site-functions"
}
