# Maintainer: NebulaNeko <chfsefefgesfen foxmail com>
pkgname=pandownload-bin
pkgver=2.1.2
pkgrel=2
pkgdesc="一款支持全平台的超级快的网盘下载工具，能真正不限速高速下载。"
arch=('x86_64')
url="http://pandownload.com"
license=('unknown')
depends=(wine)
optdepends=('sqlite: get Firefox cookies')
source=("${pkgname%-bin}-$pkgver.zip::http://pandownload.com/$pkgver"
        "${pkgname%-bin}.desktop"
        pandownload
        pdlogin
        msscript.tar.xz
        override-dll.reg
        "16x16.png"
        "48x48.png")
options=(!strip)
sha512sums=('03661cbfe6b49e86ff646f57d5f6d398983c8ab6158f426acaf5f604e20c5305f03a0af1ce707ae63e9fee64ac6dd3e63683e450f4e30c341133dd3fdef975ed'
            'f92318c37e6ac4ef6a1c4b629a042b6dc1fbaac2188293a1c7afd42c4e674056167193d7bfbaeb041b3989300594ccf46e6ae97cbd7dc9879cca65bf24b6b9a6'
            '9e13a9eebe8c5f35f1ac4a353beef70d7e43aea67a11eb68dd6738a45d2cb562c32995d19c40c84a03aca3461fc100503cc72c52313f686b8ea2e190112eb178'
            '2888de2ca54d30368c9456e9866dc98fe9d106a6d58fd0f0cf91448a8b79067cb2adcc86b3aaad52c38d82ca9d86200d770056a0141030a2ec21ff8ed3355b09'
            'da9ecf93218c994e22dc2a79844a3aefa2bda2c97c9524f63980d66b344b8ecd9b28aaaf5811e7998f6e1cde943716545dfad67b83375e4d4e098e233c447a43'
            'db31364f91abb94ce77dadbe9ed4b257cd77d6b5d9a26f62d43d4e0651bbf78cc1226407cfd7acbf3cb9ab7f84b66277fe55c8c02d29f920228074e5ad9f33c4'
            '8ccabe478127382cc35b6e281bdd838fae03696602d60f359f9a1ce1b9c13383a98b9499ebd3cd8815a67a13cc60d31fb0fd2f8f8ae699c8431ee21cb6a055b8'
            '49aca598cf58917b14564d9fde26093824dfde310dff68133dcabcdc65be5f02d9c79be237294d403bad9e1fcb8b906a26020956023600b9e862aceaf4a16a97')

# build() {
  # mkdir -p $srcdir/wine
  # XDG_CACHE_HOME=$srcdir/tmp WINEARCH=win32 WINEPREFIX=$srcdir/wine winetricks -q msscript
# }

package() {
    install -dm755 "$pkgdir/usr/share"
    cp -a "$srcdir/PanDownload" "$pkgdir/usr/share/pandownload"

    install -dm755 "$pkgdir/usr/share/pandownload/wine"
    install -m644 "$srcdir/msscript.ocx" "$pkgdir/usr/share/pandownload/wine/msscript.ocx"
    install -m644 "$srcdir/override-dll.reg" "$pkgdir/usr/share/pandownload/wine/override-dll.reg"

    find "$pkgdir"/usr/share -type f -exec chmod 644 "{}" \;
    find "$pkgdir"/usr/share -type d -exec chmod 755 "{}" \;

    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/pandownload" "$pkgdir/usr/bin/pandownload"
    install -m755 "$srcdir/pdlogin" "$pkgdir/usr/bin/pdlogin"

    install -dm755 "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/pandownload.desktop" "$pkgdir/usr/share/applications/pandownload.desktop"

    local icon_size icon_dir
    for icon_size in 16 48; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -dm755 "$icon_dir"
        install -m644 "$srcdir/${icon_size}x${icon_size}.png" "$icon_dir/pandownload.png"
    done
}
