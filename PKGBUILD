# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=exam-env
pkgver=1.7.5
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
    650dc7193d2a78e605cd0f1c3c61cc39a6992a5516cc3bb1f944f26fcff3df3f
    b078ff602cbd37a85255691adf62a6ee232dbfba6105220827c1352002ad2941
)
options=(!debug !strip)

package() {
    cd "$srcdir"

    chmod +x $pkgname-$pkgver.AppImage
    ./$pkgname-$pkgver.AppImage --appimage-extract

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
