# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Maintainer: sukanka <su975853527 at gmail dot com>
# Contributor: sihuan <sihuan at sakuya.love>
# Contributor: Nick Cao <nickcao at nichi dot co>

pkgname=wechat-uos
_pkgname=wechat
pkgver=2.1.2
pkgrel=1
epoch=2
pkgdesc="微信官方原生桌面版 WeChat desktop"
arch=('x86_64')
url="https://weixin.qq.com/"
license=('ISC')
depends=(electron bubblewrap lsb-release )
source=("${_pkgname}-${pkgver}.deb::https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/com.tencent.weixin_${pkgver}_amd64.deb"
"wechat.sh"
"license.tar.gz" # from https://aur.archlinux.org/packages/com.tencent.weixin
)
sha512sums=('cb1b5ca8d18a73b8acae2d0c5518f1471451b35ef5a678ece37bca4d6a8e1ff04214d8b81a2dc23802d211245d96f907f2407c8a71b82e9270da5118597b443f'
            '5a54b2362ad199951b1445bc075ae69770804e16708b1f7072f48be21112de3ce6e1a6feee15ec91522c4b48b4ff396a2b49bb83c0ad41aee3839ac093f8a169'
            'd6a2cc365ff513b1adb69c71e60433ec8cde80fb41c12a614a65cd22f220b9175d930c38d2b4babde7b93ea76b23e0cf094a426555a9376fbcd9c31f21e79ed5')
options=(!strip)

prepare() {
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
    cp -rf $srcdir/opt/apps/com.tencent.weixin/files/weixin $srcdir/opt
    rm -rf usr/lib
    cd ${srcdir}/usr/share/applications/
    sed -i "3c Exec=wechat-uos %U" weixin.desktop
    echo "Keywords=wechat;weixin;wechat-uos;" >> weixin.desktop
    mv weixin.desktop ${pkgname}.desktop
    chmod a-x ${pkgname}.desktop
}

package(){
    cd $srcdir
    mv usr $pkgdir
    
    
    mkdir -p ${pkgdir}/usr/lib/license
    mv opt/weixin/resources/app ${pkgdir}/usr/lib/${pkgname}
    install -Dm755 wechat.sh ${pkgdir}/usr/bin/${pkgname}
    
    mv license/usr/lib/license ${pkgdir}/usr/lib/${pkgname}
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    mv license/etc ${pkgdir}/usr/share/${pkgname}
    mv license/var ${pkgdir}/usr/share/${pkgname}
}
# vim: ts=2 sw=2 et:
