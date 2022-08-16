# Maintainer: Vincent Cheung

pkgname=pdmaner
pkgver=4.1.4
pkgrel=1
pkgdesc="一款多操作系统开源免费的桌面版关系数据库模型建模工具"
arch=('x86_64')
url="https://gitee.com/robergroup/pdmaner"
license=('MulanPubL-2.0')
provides=('pdmaner')
source=(
    "git+https://gitee.com/robergroup/pdmaner.git"
    "pdmaner.desktop"
)
sha256sums=(
    'SKIP'
    '730f1cdeb08dcd306fa52bc2b8a1128e96edfb6d1eb6902d03df2057b0067ab8'
)

prepare() {
    cd pdmaner
    git checkout v${pkgver}
}

build() {
    cd "$srcdir/pdmaner"
    yarn install
    yarn run package-linux
}

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    unzip "$srcdir/pdmaner/dist/PDManer-linux_v$pkgver.zip" -d "$pkgdir/opt/${pkgname}/"

    find "$pkgdir"/opt/$pkgname/ -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir"/opt/$pkgname/pdmaner

    mkdir -p "$pkgdir"/usr/bin
    ln -sf /opt/$pkgname/pdmaner "$pkgdir"/usr/bin/$pkgname
    cp "$srcdir/pdmaner/public/256x256.png" "$pkgdir/opt/${pkgname}/logo.png"
    install -Dm0644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}

