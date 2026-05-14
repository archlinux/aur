# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=exam-env
pkgver=2.0.0
pkgrel=1
pkgdesc='The freeCodeCamp Exam Environment desktop application'
arch=(x86_64)
url=https://freecodecamp.org
license=(BSD-3-Clause)

_pkgname=Exam.Environment
_pkgver=production
_url=https://github.com/freecodecamp/exam-env
source=(
    $pkgname-$pkgver.AppImage::$_url/releases/download/$_pkgver/$pkgver/${_pkgname}_${pkgver}_amd64.AppImage
    https://raw.githubusercontent${_url#*github}/refs/heads/main/LICENSE.md
)
sha256sums=(
    4274dcf990cc54548858633a14ef2ba74a4fb8c99aaf89ee507d7d3ea0c797ee
    b078ff602cbd37a85255691adf62a6ee232dbfba6105220827c1352002ad2941
)
options=(!debug !strip)

package() {
    cd "$srcdir"

    chmod +x $pkgname-$pkgver.AppImage
    ./$pkgname-$pkgver.AppImage --appimage-extract

    # NOTE: tauri has issues in wayland envs, use temp workaround.
    # should be fine since exam-env runs in x11 anyway
    # refer: https://github.com/freeCodeCamp/exam-env/issues/107
    # refer: https://github.com/tauri-apps/tauri/issues/8541
    rm squashfs-root/usr/lib/*wayland*so*

    install -Dm755 -d "$pkgdir"/opt/$pkgname
    cp -r squashfs-root/* "$pkgdir"/opt/$pkgname/
    chmod +rx "$pkgdir"/opt/$pkgbase/AppRun.wrapped
    install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<EOF
#!/bin/sh
exec /opt/$pkgname/AppRun "\$@"
EOF

    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md
    cd squashfs-root
    install -Dm644 -T Exam\ Environment.desktop \
        "$pkgdir"/usr/share/applications/$pkgname.desktop
    dir=usr/share/icons/hicolor
    install -Dm644 -t "$pkgdir"/$dir/32x32/apps $dir/32x32/apps/$pkgname.png
    install -Dm644 -t "$pkgdir"/$dir/128x128/apps $dir/128x128/apps/$pkgname.png
    install -Dm644 -t "$pkgdir"/$dir/256x256@2/apps $dir/256x256@2/apps/$pkgname.png
}
