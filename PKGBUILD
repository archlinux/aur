# Maintainer: Vincent Cheung

pkgname=pdmaner
pkgver=4.3.0
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
    'ddf5e4a6833ef668e956dcf67fe5714b622f04ab42d93c61dfc8d62f5e97a599'
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
    install -Dm0644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm0644 $srcdir/pdmaner/public/256x256.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}

