# Maintainer: Fatih <fatih.bck007@gmail.com>
pkgname=munus
pkgver=1.0.0
pkgrel=1
pkgdesc="Arch Linux için modern grafik arayüzlü paket yöneticisi (Pacman · AUR · Flatpak · AppImage)"
arch=('x86_64')
url="https://github.com/fatih-bucaklioglu/arch-store"
license=('GNU')
depends=(
    'python>=3.11'
    'python-pyqt6'
    'python-psutil'
)
optdepends=(
    'yay: AUR desteği için'
    'paru: AUR desteği için (alternatif)'
    'flatpak: Flatpak paket desteği için'
)
makedepends=(
    'python'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e449dc8b0b7d146c8603460f670c1a7ba4ab946339bc59f23059d3025a98e035')

build() {
    cd "$pkgname-$pkgver"
    pyinstaller arch-store.spec \
        --distpath dist \
        --workpath build \
        --noconfirm \
        --log-level WARN
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -Dm755 "dist/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # .desktop
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Arch Store
Comment=Arch Linux Paket Mağazası
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=System;PackageManager;
StartupNotify=true
EOF

    # İkon (varsa)
    if [[ -f "assets/icon.png" ]]; then
        install -Dm644 "assets/icon.png" \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    fi

    # Lisans
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
