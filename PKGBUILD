# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Maintainer: sukanka <su975853527 at gmail dot com>
# Contributor: sihuan <sihuan at sakuya.love>
# Contributor: Nick Cao <nickcao at nichi dot co>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=wechat-uos
_pkgname=wechat
pkgver=2.1.2
pkgrel=2
epoch=2
pkgdesc="微信官方原生桌面版 WeChat desktop"
arch=('x86_64')
url="https://weixin.qq.com/"
license=('ISC')
depends=(electron bubblewrap lsb-release)
source=(
  "${_pkgname}-${pkgver}.deb::https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/com.tencent.weixin_${pkgver}_amd64.deb"
  # Bind files like os-release to wechat-uos works.
  "wechat.sh"
  "wechat-uos.desktop"
  # We need the license key from uos to make wechat-uos works.
  #
  # from https://aur.archlinux.org/packages/com.tencent.weixin
  "license.tar.gz"
)
sha512sums=('cb1b5ca8d18a73b8acae2d0c5518f1471451b35ef5a678ece37bca4d6a8e1ff04214d8b81a2dc23802d211245d96f907f2407c8a71b82e9270da5118597b443f'
            '5a54b2362ad199951b1445bc075ae69770804e16708b1f7072f48be21112de3ce6e1a6feee15ec91522c4b48b4ff396a2b49bb83c0ad41aee3839ac093f8a169'
            '68d31d9e7a6ee14d5cc330acf55d9905be86c4ac187279e33494bc479a60c078b38eef0fa7833ba9fda2b14978f212d8647dd609b6f3037b0133701fe8f5e72b'
            '8b9d70162a5a71584cf85a309da48730de9db03f49a7e9611de04441864be80267e53e3155f7856c87ed53f99def277d74132392816c4f07893a02e99043ed6c')
options=(!strip)

package(){
    echo "  -> Extracting the data.tar.xz..."
    tar -Jxvf data.tar.xz -C "${pkgdir}"
    mv ${pkgdir}/opt/apps/com.tencent.weixin/files/weixin/resources/app ${pkgdir}/usr/lib/${pkgname}
    rm -rf ${pkgdir}/opt

    echo "  -> Moving stuff in place..."
    # Launcher
    install -Dm755 wechat.sh ${pkgdir}/usr/bin/${pkgname}

    echo "  -> Fixing wechat desktop entry..."
    rm $pkgdir/usr/share/applications/weixin.desktop
    install -Dm644 ${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop

    echo "  -> Fixing licenses"
    # Move into pkg scoped dir to avoid conflict.
    install -m 755 -d ${pkgdir}/usr/lib/${pkgname}
    mv ${pkgdir}/usr/lib/license ${pkgdir}/usr/lib/${pkgname}
    # Keep soname correct.
    ln -sf /usr/lib/${pkgname}/license/libuosdevicea1.so ${pkgdir}/usr/lib/${pkgname}/license/libuosdevicea.so
    install -m 755 -d ${pkgdir}/usr/lib/license

    install -m 755 -d ${pkgdir}/usr/share/${pkgname}
    cp -r license/etc ${pkgdir}/usr/share/${pkgname}
    cp -r license/var ${pkgdir}/usr/share/${pkgname}
}
# vim: ts=2 sw=2 et:
