# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: NicKoehler <grillinicolavocal at gmail dot com>
# Contributor: Eric Brandwein <brandweineric at gmail dot com>
# Contributor: 01189998819991197253 <dev.ben01189998819991197253+aur@gmail.com>

pkgname=clonehero
pkgver=1.1.0.6085_final
_upstream_ver=${pkgver/_/-}
pkgrel=1
pkgdesc="Clone Hero is a free rhythm game, which can be played with any 5 or 6 button guitar controller, game controllers, or just your standard computer keyboard."
arch=('x86_64')
url="https://clonehero.net/"
license=('LicenseRef-freeware-proprietary')
install="$pkgname.install"
depends=('alsa-lib' 'gcc-libs' 'gtk3')
optdepends=('pulseaudio-alsa: ALSA audio routing for PulseAudio users'
            'pipewire-alsa: ALSA audio routing for PipeWire users')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar"::"https://github.com/clonehero-game/releases/releases/download/v${_upstream_ver}/Linux.${CARCH}-Standalone.tar"
        "$pkgname.install"
        "$pkgname.desktop"
        "$pkgname"
        "LICENSE")

sha256sums=('c72effdd20cd80ac3aee2900ec2b5154ada036b7e3ab1e1c4c379152491204aa'
            '01125237ef90f8435523fed5ae09246a76eb562408c50e76597964b5675385cf'
            'a97d85930ac4844b3c5e90d4da8faa7a9b5267909d45be59b1fa39abc76df5fe'
            '9ec629974241b111ac33433a5971b26040ac2af749cab5760179f4af9c3298d7'
            '08c3e8cb6c3eea40a7c336267d807dc57dd0f89d9e12ca27d8d96421ddb66be2')

latestver() {
    gh api repos/clonehero-game/releases/releases/latest --jq '.tag_name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*-[A-Za-z0-9._-]+)$/\1/p' |
        sed 's/-/_/'
}

package() {
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

    install -d "$pkgdir/usr/lib"
    cp -a "$srcdir/Standalone" "$pkgdir/usr/lib/$pkgname"

    find "$pkgdir/usr/lib/$pkgname" -type d -exec chmod 755 {} +
    chmod 755 "$pkgdir/usr/lib/$pkgname/$pkgname" \
        "$pkgdir/usr/lib/$pkgname/GameAssembly.so" \
        "$pkgdir/usr/lib/$pkgname/UnityPlayer.so" \
        "$pkgdir/usr/lib/$pkgname"/clonehero_Data/Plugins/*.so

    # Install script, .desktop launcher with icon
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/Standalone/clonehero_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
