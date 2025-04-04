# Maintainer: MaddieMewmews <maddie at mewmews dot gay>
# Contributor: TheTrueColonel <benjaminesims@gmail.com>
# Contributor: NicKoehler <grillinicolavocal at gmail dot com>
_pkgname=yarg-nightly
pkgname=$_pkgname-bin
pkgver="$(curl --silent -m 10 --connect-timeout 5 "https://api.github.com/repos/YARC-Official/YARG-BleedingEdge/releases/latest" | python3 -c "import sys, json; print(json.load(sys.stdin)['tag_name'])")"
pkgrel=1
pkgdesc="YARG - Yet Another Rhythm Game inspired off of Rockband, Guitar Hero, Clone Hero, or similar. Nightly build"
arch=("x86_64")
url="https://github.com/YARC-Official/YARG-BleedingEdge"
install=$_pkgname.install
license=('LGPL-3.0-only')
depends=("hidapi" "systemd-libs" "alsa-lib" "gtk3" "glib2")
makedepends=("python" "curl")
provides=("yarg-nightly")
conflicts=("yarg-nightly" "yarg-nightly-git")
source=(
    "$_pkgname"
    "$_pkgname.desktop"
    "YARG_${pkgver}.zip::https://github.com/YARC-Official/YARG-BleedingEdge/releases/download/${pkgver}/YARG_${pkgver}-Linux-x64.zip"
    "https://raw.githubusercontent.com/YARC-Official/YARG/master/LICENSE"
)
sha256sums=('cf1299595b698818f9aa72e8869aba7bb5a5703055abe62f28bc808e8e345ba3'
            '38199fb3ff44d606b436a3a717c837df26b96f935e0da8b289e9bfa3bafa4ceb'
            'SKIP'
            'a5681bf9b05db14d86776930017c647ad9e6e56ff6bbcfdf21e5848288dfaf1b')

package() {

    # create dirs
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/etc/udev/rules.d"
    install -dm777 "$pkgdir/opt/$_pkgname"

    # install binaries
    install -Dm777 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm777 "$srcdir/UnityPlayer.so" "$pkgdir/opt/$_pkgname/"
    install -Dm777 "$srcdir/YARG" "$pkgdir/opt/$_pkgname/YARG"
    cp -r "$srcdir/YARG_Data" "$pkgdir/opt/$_pkgname/YARG_Data"

    # install icon and .desktop
    install -Dm644 "$pkgdir/opt/$_pkgname/YARG_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # install license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # create 69-hid.rules
    echo 'KERNEL=="hidraw*", TAG+="uaccess"' > "$pkgdir/etc/udev/rules.d/69-$_pkgname-hid.rules"

}
