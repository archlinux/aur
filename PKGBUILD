# Maintainer: Nicholas Wang <me at nicho1as dot wang>
pkgname=vatsim-crc
pkgver=2.3.13
pkgrel=2
pkgdesc="Consolidated Radar Client (CRC), a controller application connects to the VATSIM network through vNAS."
arch=("x86_64")
url="https://vnas.vatsim.net/crc"
license=('custom')
depends=('wine' 'wine-mono' 'winetricks')
optdepends=('trackaudio: Audio For VATSIM support')
install=$pkgname.install
options=(!debug)
source=(setup.exe::"https://crc.virtualnas.net/Files/Installers/CRC-Setup-${pkgver}.exe"
        "vatsim-crc" "$pkgname.install"
        "vatsim-crc.desktop" "segmdl2.verb")

sha256sums=('c562d151d6ce779878e53d0ab7bdbbcd8d6974209769688e1366fe8bf97e52e1'
            '7e0947e308bcef1f927da6b0f8eaa2fe88a0a0cde34f2d35b8443c983187fa42'
            '3cf58dcb82541202679f2b07f4ac15ebb22076411ee8e5533970f2e7756815db'
            '1ebb426abfff168706256df00a93661e2a97f2ec095c87906934538ae25a9926'
            'ea73951541c4f66e65c7ea6c7e2349f6e93ac4f6988516308b3a2522d4751c74')

build() {
    unset WINEPREFIX
    install -m755 -d "$srcdir"/tmp "$srcdir"/tmp/env "$srcdir"/tmp/local
    export WINEPREFIX="$srcdir"/tmp/env
    export XDG_DATA_HOME="$srcdir"/tmp/local
    install -m644 $srcdir/vatsim-crc.desktop $srcdir/tmp/vatsim-crc.desktop
    printf "Version=$pkgver" >> $srcdir/tmp/vatsim-crc.desktop
    wine wineboot -u
    wine $srcdir/setup.exe /S /D="C:\vatsim-crc"
}

package() {
    install -Ddm755 "$pkgdir/usr/share"
    cp -r "$srcdir/tmp/env/drive_c/vatsim-crc" "$pkgdir/usr/share/"
    install -Dm644 "$srcdir"/segmdl2.verb "$pkgdir/usr/share/vatsim-crc/segmdl2.verb"
    install -Dm755 "$srcdir"/vatsim-crc "$pkgdir/usr/bin/vatsim-crc"
    install -Dm644 "$srcdir"/tmp/vatsim-crc.desktop "$pkgdir/usr/share/applications/vatsim-crc.desktop"
    iconname=$(grep Icon $srcdir/tmp/local/applications/wine/Programs/CRC/CRC.desktop)
    iconname=${iconname#*=}
    for i in 16x16 256x256 32x32 48x48; do
        install -Dm644 "$srcdir"/tmp/local/icons/hicolor/$i/apps/$iconname.png "$pkgdir/usr/share/icons/hicolor/$i/apps/vatsim-crc.png"
    done
    find $pkgdir/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
    find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 "{}" \;
}
