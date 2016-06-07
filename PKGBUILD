#Maintainer: hexchain <i at hexchain.org>
pkgname=hmcl
pkgver=2.4.1.62
pkgrel=1
pkgdesc="Hello Minecraft! Launcher, a powerful Minecraft launcher."
arch=(any)
license=('GPL3')
url="https://github.com/huanghongxun/HMCL"
makedepends=('unzip')
depends=('java-environment' 'xorg-server-utils' 'openal' 'hicolor-icon-theme')
noextract=("HMCL-$pkgver.jar")
source=(
    'hmcl'
    'hmcl.desktop.in'
    "$url/releases/download/${pkgver##*.}/HMCL-$pkgver.jar")

prepare() {
    cd "$srcdir"
    sed "s|@@VERSION@@|$pkgver|" hmcl.desktop.in > hmcl.desktop
    unzip "HMCL-$pkgver.jar" org/jackhuang/hellominecraft/launcher/icon.png
}

package() {
    cd "$srcdir"
    install -D -m755 "${srcdir}/hmcl" "${pkgdir}/usr/bin/hmcl"
    install -D -m644 "${srcdir}/HMCL-$pkgver.jar" "${pkgdir}/usr/share/hmcl/HMCL.jar"
    install -D -m644 "${srcdir}/hmcl.desktop" "${pkgdir}/usr/share/applications/hmcl.desktop"

    # install icon
    cd "$srcdir/org/jackhuang/hellominecraft/launcher"
    # original icon is 1024x1024
    # install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    for size in 16 24 32 48 64 72 128 256 512; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p $target
        convert icon.png -resize ${size}x${size} "$target/$pkgname.png"
    done
}
sha256sums=('0300218f29af82e9b302a94b37a4c9a92aea26b960bfd1b2e16c0130ac61cfcf'
            '902a51543e6fc45f8f050233dcee493a5125052df14a7e10548edfc48cf4d528'
            '6eb12893d4493a34de238bf0df8ae366093dd08e89eca6a12ca725ec507cd7c2')
