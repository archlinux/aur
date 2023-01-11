# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Maintainer: sukanka <su975853527 at gmail dot com>
# Contributor: sihuan <sihuan at sakuya.love>
# Contributor: Nick Cao <nickcao at nichi dot co>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=wechat-uos
_pkgname=wechat
_electron=electron19
pkgver=2.1.5
pkgrel=3
epoch=2
pkgdesc="微信官方原生桌面版 WeChat desktop"
arch=('x86_64' 'aarch64')
url="https://weixin.qq.com/"
license=('ISC')
depends=(${_electron} bubblewrap lsb-release openssl-1.1)
optdepends=('scrot: For in-app screenshot')
source=(
  # Bind files like os-release to wechat-uos works.
  "wechat.sh"
  "wechat-uos.desktop"
  # We need the license key from uos to make wechat-uos works.
  #
  # from https://aur.archlinux.org/packages/com.tencent.weixin
  "license.tar.gz"
)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/com.tencent.weixin_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/com.tencent.weixin_${pkgver}_arm64.deb")
sha512sums=('503c763dfe19f1d1c3cd1fa2c7fc7b488bd23e4ff790d16e0312150b2a6028f9933212ed2177c309c3d3d2a6ede1f1ed02a9a2ecb9efadd4a7f9ca7dfc29fc7b'
            '68d31d9e7a6ee14d5cc330acf55d9905be86c4ac187279e33494bc479a60c078b38eef0fa7833ba9fda2b14978f212d8647dd609b6f3037b0133701fe8f5e72b'
            '8b9d70162a5a71584cf85a309da48730de9db03f49a7e9611de04441864be80267e53e3155f7856c87ed53f99def277d74132392816c4f07893a02e99043ed6c')
sha512sums_x86_64=('89bc2c8c087b744e245f39fee7d73f953c1349a68c493df1e4f0d187f2e7450d47ad7507fa6abcb91625c6240707da83f421f513d696eb5fc95b808ef779fc95')
sha512sums_aarch64=('905750c7c23aa17e8c04a2cd5f91f055f9a88794b9945437afc1c8b43c0443745da32094c7523ecbfa2d61c5699fa465062d56b241e49f5d3b09faa2ba36bd8e')

prepare(){
  cd ${srcdir}
  sed -i "s|__ELECTRON__|${_electron}|g" wechat.sh
}

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
    chmod 0644 ${pkgdir}/usr/lib/${pkgname}/license/libuosdevicea.so
    install -m 755 -d ${pkgdir}/usr/lib/license

    install -m 755 -d ${pkgdir}/usr/share/${pkgname}
    cp -r license/etc ${pkgdir}/usr/share/${pkgname}
    cp -r license/var ${pkgdir}/usr/share/${pkgname}

    # use system scrot
    cd ${pkgdir}/usr/lib/wechat-uos/packages/main/dist/
    sed -i 's|__dirname,"bin","scrot"|"/usr/bin/"|g' index.js
    rm -rf bin

}
# vim: ts=2 sw=2 et:
