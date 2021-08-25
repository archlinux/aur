# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Contributor: sihuan <sihuan at sakuya.love>
# Contributor: sukanka <unknown at unknown>
# Contributor: Nick Cao <nickcao at nichi dot co>

pkgname=wechat-uos
pkgver=2.0.0+lsblk
_pkgver=2.0.0
epoch=2
pkgrel=1145141919
pkgdesc="UOS专业版微信 (迫真魔改版)"
arch=(x86_64)
url=https://www.chinauos.com/resource/download-professional
depends=(gtk2 gtk3 libxss gconf nss lsb-release bubblewrap)
makedepends=(imagemagick)
license=(MIT)
source=(
    "https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.qq.weixin/com.qq.weixin_${_pkgver}-${epoch}_amd64.deb"
    'uos-lsb' 'uos-lsblk' 'uos-release' 'wechat-uos' 'wechat-uos.desktop'
)
b2sums=('2162919d00fcf133eb17ce4098c6c4a067424727adf06b1558eaeec79a68b3ab638860a30b1363b0102a5457d761c56552ce9710f66604f1a0418bec7513628d'
        '3cd62350b8b12d857e7a6b7d14ddc0fde9617f1e927371962f95ce633f7686c12ff3d8bc0e4048c85ef5a7414885ed03aecd8f7fbb6ca6f5e6d52d68273d4c43'
        '063c8860dfa4304d80bd1a9c4e439064af0f8b2e35af282ba91a56c7c74cf0c54b62982e13a08c85cd643872d4bbdc18cb19035cabff55dae58e9c466c2c1d45'
        '49de7f51a7d43acbdb5d6e54aa77e56476d79ff3bb950a99bfe6023c4eb067737fcfcdf51ea7d2428e7923659267bce8477bde71df00c4def1f8e16999d84a49'
        'd09df77e0bbf43a2820e0e8d91363e02a814764d5930627b6d329e0028e9fcf472e12d288590f6c1d388fe25f790a062aa152dd2d41199b40df4c461ed1858cb'
        '13f84de388ff2c20f9e7c42b773e8dbd63da473851690ce37cb80966e2fac0843933d0d561c7c5f8918e456f56db9a66b82cbd5952b056a954b519ef76826ed2')

prepare() {
    msg2 "Decompressing Debian Package..."
    bsdtar -xf data.tar.xz
    
    msg2 "Patching Incorrect Size Icons..."
    for s in 128 64 48 16; do
        local newsize="${s}x${s}"
        echo "Downsampling from 256x256 to $newsize..."
        convert -geometry $newsize \
            $srcdir/opt/apps/com.qq.weixin/entries/icons/hicolor/256x256/apps/wechat.png \
            $srcdir/opt/apps/com.qq.weixin/entries/icons/hicolor/$newsize/apps/wechat.png
    done
}
        
package() {
    msg2 "Copying Application Binaries..."
    mkdir -p $pkgdir/opt/wechat-uos
    cp -at $pkgdir/opt/wechat-uos  $srcdir/opt/apps/com.qq.weixin/files/*
    install -Dm644 $srcdir/usr/lib/license/libuosdevicea.so -t $pkgdir/usr/lib/license/
    
    msg2 "Copying Patched Icons..."
    mkdir -p $pkgdir/usr/share/icons
    cp -at $pkgdir/usr/share/icons $srcdir/opt/apps/com.qq.weixin/entries/icons/hicolor
    
    msg2 "Linking Binaries..."
    install -Dm755 wechat-uos -t $pkgdir/usr/bin/
    
    msg2 "Creating Desktops and Hacks..."
    install -Dm644 uos-lsb uos-release -t $pkgdir/opt/wechat-uos/crap/
    install -Dm755 uos-lsblk -t $pkgdir/opt/wechat-uos/crap/
    install -Dm644 wechat-uos.desktop -t $pkgdir/usr/share/applications/
}
