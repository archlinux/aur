# Maintainer: FlyInWind <2518509078@qq.com>

pkgname=navicat15-premium-cs
pkgver=15.0.29
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool. (Chinese Simplified)"
arch=(x86_64)
url='https://www.navicat.com/en/navicat-15-highlights'
license=('GPL3')
source=(
    # The download url always download latest version
    "navicat15-premium-cs-${pkgver}.AppImage::http://download.navicat.com.cn/download/navicat15-premium-cs.AppImage"
    'https://archive.archlinux.org/packages/g/glib2/glib2-2.68.4-1-x86_64.pkg.tar.zst'
    'navicat15.desktop'
)
noextract=('glib2-2.68.4-1-x86_64.pkg.tar.zst')
sha256sums=(
    '795935c79e65693f4203079bd7e44c634a6f81fadf8b5f6a317897039603e563'
    'e8e759bd9abb58c93067e199088077f3d6fa2c608ebc6f571cb9dd814812bcea'
    '2c69105cc3ceda6075e36ebfd2931f1a023929045c18087a0a4504c0e5c4a4a1'
)

prepare() {
    mkdir $srcdir/glib2
    tar --zstd -xpf $srcdir/glib2-2.68.4-1-x86_64.pkg.tar.zst -C $srcdir/glib2
}

package() {
    _root_na_dir=opt/$pkgname
    _na_dir=$pkgdir/$_root_na_dir
    install -d $_na_dir/usr

    cd $srcdir
    cp -r usr/{bin,lib,plugins} $_na_dir/usr
    install AppRun $_na_dir
    cp manual.pdf $_na_dir
    cp cacert.pem $_na_dir

    install -d $pkgdir/usr/share/applications
    cp navicat15.desktop $pkgdir/usr/share/applications

    _icon_dir=usr/share/icons/hicolor/256x256/apps
    install -d $pkgdir/$_icon_dir
    cp $_icon_dir/navicat-icon.png $pkgdir/$_icon_dir/navicat15.png

    # fix "symbol lookup error: /usr/lib/libgio-2.0.so.0: undefined symbol: g_module_open_full"
    cp glib2/usr/lib/libgio-2.0.so.0.6800.4 $_na_dir/usr/lib/libgio-2.0.so.0
}
