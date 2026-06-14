# Maintainer: Nicholas Wang <me at nicho1as dot wang>

### READ BEFORE YOU FLAG THIS OUT-OF-DATE
### This PKGBUILD automatically fetches latest version of CRC.
### If it does not build properly use comment and do not flag it as out-of-date.


pkgname=vatsim-crc
pkgver=2.17.2.0
pkgrel=1
pkgdesc="Consolidated Radar Client (CRC), a controller application connects to the VATSIM network through vNAS."
arch=("x86_64")
url="https://vnas.vatsim.net/crc"
license=('custom')
makedepends=('p7zip' 'jq')
depends=('wine' 'wine-mono' 'winetricks')
optdepends=('rpc-bridge: Discord Rich Presence support' 'ttf-cascadia-code' 'noto-fonts-cjk' 'umu-launcher' 'proton-ge-custom-bin')
install=$pkgname.install
options=(!debug)

__realpkgver=$(curl -s https://crc.virtualnas.net/LatestVersion.json | jq -r '.version')

source=(crc-setup-${__realpkgver}.exe::"$(curl -s https://crc.virtualnas.net/LatestVersion.json | jq -r '.installerUrl')"
        "vatsim-crc"
        "vatsim-crc.desktop" "segmdl2.verb" "webview2.verb" "nicfonts.verb")

sha256sums=('SKIP'
            'c8237a3c30f40218a4502a5053a06c6994cb93ecbc47c5699d62504255a3a6c5'
            '1ebb426abfff168706256df00a93661e2a97f2ec095c87906934538ae25a9926'
            'ea73951541c4f66e65c7ea6c7e2349f6e93ac4f6988516308b3a2522d4751c74'
            '4d70f0de1ce7105b21808ecb890993c05333f51a24b2b11bfa000b5abf2f129e'
            'd5b5f4d43c19e605dc0b256e4b75b816beaaeba3c6cf5f406860d3920e4db294')

pkgver() {
  curl -s https://crc.virtualnas.net/LatestVersion.json | jq -r '.version'
}

build() {
    mkdir -p $srcdir/build
    cd $srcdir/build
    7z x ../crc-setup-${pkgver}.exe
    rm Uninstall.exe
    rm -r '$PLUGINSDIR'
    cd $srcdir
    7z e $srcdir/build/Application/CRC.exe .rsrc/ICON/9
    mv 9 $pkgname.png
}

package() {
    install -Ddm755 "$pkgdir/usr/share"
    install -Ddm755 "$pkgdir/opt"
    cp -rp "$srcdir/build" "$pkgdir/opt/vatsim-crc"
    install -Dm644 "$srcdir"/segmdl2.verb "$pkgdir/opt/vatsim-crc/segmdl2.verb"
    install -Dm644 "$srcdir"/webview2.verb "$pkgdir/opt/vatsim-crc/webview2.verb"
    install -Dm644 "$srcdir"/nicfonts.verb "$pkgdir/opt/vatsim-crc/nicfonts.verb"
    install -Dm755 "$srcdir"/vatsim-crc "$pkgdir/usr/bin/vatsim-crc"
    install -Dm644 "$srcdir"/vatsim-crc.desktop "$pkgdir/usr/share/applications/vatsim-crc.desktop"
    printf "Version=$pkgver-$pkgrel\n" >> $pkgdir/usr/share/applications/vatsim-crc.desktop
    install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/vatsim-crc.png"
    find $pkgdir/opt/$pkgname -type d -exec chmod 755 "{}" \;
    find $pkgdir/opt/$pkgname -type f -exec chmod 644 "{}" \;
}

# bak_build() {
# #   extract using wine
#     unset WINEPREFIX
#     install -m755 -d "$srcdir"/tmp "$srcdir"/tmp/env "$srcdir"/tmp/local
#     export WINEPREFIX="$srcdir"/tmp/env
#     export XDG_DATA_HOME="$srcdir"/tmp/local
#     wine wineboot -u
#     wine $srcdir/crc-setup-${pkgver}.exe /S /D="C:\vatsim-crc"
# }

# bak_package() {
# #   for wine extraction method
#     install -Ddm755 "$pkgdir/usr/share"
#     cp -r "$srcdir/tmp/env/drive_c/vatsim-crc" "$pkgdir/usr/share/"
#     install -Dm644 "$srcdir"/segmdl2.verb "$pkgdir/usr/share/vatsim-crc/segmdl2.verb"
#     install -Dm755 "$srcdir"/vatsim-crc "$pkgdir/usr/bin/vatsim-crc"
#     install -Dm644 "$srcdir"/vatsim-crc.desktop "$pkgdir/usr/share/applications/vatsim-crc.desktop"
#     printf "Version=$pkgver-$pkgrel" >> $pkgdir/usr/share/applications/vatsim-crc.desktop
#     iconname=$(grep Icon $srcdir/tmp/local/applications/wine/Programs/CRC/CRC.desktop)
#     iconname=${iconname#*=}
#     for i in 16x16 256x256 32x32 48x48; do
#         install -Dm644 "$srcdir"/tmp/local/icons/hicolor/$i/apps/$iconname.png "$pkgdir/usr/share/icons/hicolor/$i/apps/vatsim-crc.png"
#     done
#     find $pkgdir/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
#     find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 "{}" \;
# }

