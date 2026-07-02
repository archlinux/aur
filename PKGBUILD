# Maintainer:  Misa Liu <misaliu@misaliu.top>
# Contributor: liyp <my@liyp.cc>

pkgname=uudeck-bwrap
pkgver=14.2.3
pkgrel=1
pkgdesc="Simplified UU Accelerator for Steam Deck on Arch Linux, with some extra patches"
arch=('x86_64')
license=('custom')
url='https://uu.163.com/'
depends=('systemd' 'bash' 'bubblewrap' 'curl' 'iproute2')
makedepends=('curl' 'tar')
conflicts=('uudeck')
install=uudeck.install
source=("uu.tar.gz::https://uurouter.gdl.netease.com/uuplugin/steam-deck-plugin-x86_64/v${pkgver}/uu.tar.gz"
        "launch.sh"
        "uuplugin.service")
sha256sums=('a8f1b7cd7f6a843437e92b7259a882dac811ab75574383dd7f3aef65600641ca'
            '3cd77d7249cdc90a3ab6622ce18ef2bf2f24edb83ce50132f6717b96218b2529'
            'b77dff2fa1f2e0b9237cda9d56158a644414a1ce22c788d9a43887f77ab39f20')

pkgver() {
    local info url

    info=$(
        curl -fsSL \
            -H 'Accept: text/plain' \
            "https://router.uu.163.com/api/plugin?type=steam-deck-plugin-x86_64"
    )

    IFS=, read -r url _ <<<"$info"

    printf '%s\n' \
        "$(printf '%s' "$url" |
            sed -n 's#.*/v\([^/]*\)/.*#\1#p')"
}

package() {
    install -Dm755 "$srcdir/launch.sh"         "$pkgdir/usr/lib/uudeck/launch.sh"
    install -Dm755 "$srcdir/uuplugin"          "$pkgdir/usr/lib/uudeck/uuplugin"
    install -Dm755 "$srcdir/xuplugin-guardian" "$pkgdir/usr/lib/uudeck/xuplugin-guardian"
    install -Dm644 "$srcdir/uu.conf"           "$pkgdir/var/lib/uu/uu.conf"
    install -Dm644 "$srcdir/uuplugin.service"  "$pkgdir/usr/lib/systemd/system/uuplugin.service"
}
