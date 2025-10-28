# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=aegisub-arch1t3cht-appimage
pkgver=feature_12
pkgrel=2
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (arch1t3cht fork) (AppImage version)"
arch=('x86_64')
url="https://github.com/arch1t3cht/Aegisub"
license=('BSD-3-Clause')
provides=('aegisub')
conflicts=('aegisub')
depends=('fuse2')
options=(!strip)
_desktop_name=aegisub.desktop
_filename=Aegisub-$arch.AppImage
source=(
    "$url"/releases/download/"$pkgver"/Ubuntu.AppImage.zip
    "$url"/raw/"$pkgver"/LICENCE
)
sha256sums=('11a260a797f29733b4b07bbe97698d53decc9497a262f46d236d89086a36c031'
            'dac4a32575f6272a1285e03e957d5f67cd8682db717cab92d83c55a9dadbe748')

prepare() {
    cd "$srcdir"
    rm -rf squashfs-root
    chmod +x "$_filename"
    ./"$_filename" --appimage-extract
    sed -i -e "/^Exec/ s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/aegisub --disable-seccomp-filter-sandbox|" squashfs-root/$_desktop_name
}

package() {
    cd "$srcdir"
    install -Dm755 "$_filename" "$pkgdir"/usr/bin/aegisub
    install -Dm644 squashfs-root/$_desktop_name "$pkgdir"/usr/share/applications/$_desktop_name
    install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/apps/aegisub.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/aegisub.svg
    for res in "16x16" "32x32" "48x48" "64x64"; do
        install -Dm644 squashfs-root/usr/share/icons/hicolor/$res/apps/aegisub.png "$pkgdir"/usr/share/icons/hicolor/$res/apps/aegisub.png
    done
    install -Dm644 "LICENCE" "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
