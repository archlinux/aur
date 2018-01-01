# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi/

pkgname=vivaldi-rpi
pkgver=1.13.1008.40
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind for Raspberry Pi'
arch=('armv6h' 'armv7h' 'aarch64')
url="https://vivaldi.com"
options=(!strip !zipman)
license=('custom')
depends=('gtk3' 'libcups' 'nss' 'gconf' 'alsa-lib' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('w3m')
optdepends=(
    'libnotify: native notifications'
)
source=("https://downloads.vivaldi.com/stable/vivaldi-stable_${pkgver}-1_armhf.deb")
sha512sums=('7b636a8d4f9be825c126863e6761e2e0a1c4a07147984872f46678f1014b70c712071ba7ce15e65d0253d37a70c08e74a2a9fefa0c1f6c356445cb9e2dbcc84a')

prepare() {
 tar -xf data.tar.xz
}

package() {
    cp -a {opt,usr} "$pkgdir"

    # suid sandbox
    chmod 4755 "$pkgdir/opt/vivaldi/vivaldi-sandbox"

    # make /usr/bin/vivaldi-stable available
    binf="$pkgdir/usr/bin/vivaldi-stable"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/vivaldi/vivaldi "$binf"
    fi

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/vivaldi/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi.png"
    done

    # license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    strings "$pkgdir/opt/vivaldi/locales/en-US.pak" \
        | tr '\n' ' ' \
        | sed -rne 's/.*(<html lang.*>.*html>).*/\1/p' \
        | w3m -I 'utf-8' -T 'text/html' \
        > "$pkgdir/usr/share/licenses/$pkgname/eula.txt"
}

