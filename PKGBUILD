# Maintainer: taotieren <admin@taotieren.com>

pkgname=koishipro-bin
pkgver=Desire
pkgrel=1
pkgdesc="KoishiPro 是一个 YGOPro 的衍生项目。KoishiPro 比 YGOPro 具有更多的扩展功能和游戏体验。"
arch=('any')
url="https://koishi.pro/"
license=('GPL2')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-bin} ${pkgname}-git ygopro ygopro-bin)
#replaces=(${pkgname})
depends=('mono')
makedepends=('libarchive')
backup=(opt/${pkgname%-bin}/system.conf)
options=('!strip')
#install=${pkgname}.install
source=("https://cdn02.moecube.com:444/koishipro/archive/KoishiPro-master-linux-zh-CN.tar.gz")
sha256sums=('3334bf21d0a981ee4eceb94c8cf9a8385db09ac649ca2a06cf9c62cedd482976')
noextract=(KoishiPro-master-linux-zh-CN.tar.gz)

package() {
    install -dm0755 "${pkgdir}/opt/${pkgname%-bin}" \
                    "${pkgdir}/usr/share/pixmaps/" \
                    "${pkgdir}/usr/share/applications/" \
                    "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"

    _pkg=ygopro

    bsdtar xf "${srcdir}/KoishiPro-master-linux-zh-CN.tar.gz" -C  "${pkgdir}/opt/${pkgname%-bin}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/sh
/opt/${pkgname%-bin}/bot "\$@"
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${_pkg}" << EOF
#!/bin/sh
/opt/${pkgname%-bin}/${_pkg} "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.desktop" << EOF
[Desktop Entry]
Name=KoishiPro
Name[en_US]=KoishiPro
Categories=Game
Exec=${pkgname%-bin} %U
Terminal=false
Type=Application
Icon=${pkgname%-bin}.png
Encoding=UTF-8
Hidden=false
StartupNotify=false
Comment=KoishiPro
Comment[zh_CN]=KoishiPro

EOF

    install -Dm0644 /dev/stdin "${pkgdir}/opt/${pkgname%-bin}/${_pkg}.desktop" << EOF
[Desktop Entry]
Name=YGOPro
Name[en_US]=YGOPro
Categories=Game
Exec=${_pkg} %U
Terminal=false
Type=Application
Icon=${_pkg}.png
Encoding=UTF-8
Hidden=false
StartupNotify=false
Comment=YGOPro
Comment[zh_CN]=YGOPro
EOF

    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/opt/${pkgname%-bin}/${_pkg}.desktop" "${pkgdir}/usr/share/applications/${_pkg}.desktop"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    ln -sf "/opt/${pkgname%-bin}/${_pkg}.png" "${pkgdir}/usr/share/pixmaps/${_pkg}.png"
    ln -sf "/opt/${pkgname%-bin}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
