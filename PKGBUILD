# Maintainer: taotieren <admin@taotieren.com>
# edrawinfo 中文版

pkgname=edrawinfo-cn
pkgver=8.6
_pkgname=EdrawInfo-${pkgver}
_softname=${pkgname%-cn}
pkgrel=1
arch=('x86_64')
options=(!strip)
conflicts=()
replaces=()
pkgdesc="亿图信息图软件是一款集信息图，海报，传单，彩页，杂志，证书，板报，宣传册等设计于一身的图文设计软件。"
license=('Commercial')
url="https://www.edrawsoft.cn/download-edrawinfo/"
source_x86_64=("${_softname}-64-${pkgver}.run.gz::https://www.edrawsoft.com/archives/${_softname}-64.run.gz")
sha256sums_x86_64=('6ff695c83de59e3964d607aa52c6ab75321472600013d3877f3fa9d5cf4d4deb')
noextract=()

prepare() {
    cd "$srcdir"
    tail -n +31 ${_softname}-64.run > ${_softname}-${pkgver}.tar.gz
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    install -dm0755  "${pkgdir}/usr/share/icons/" \
                    "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/" \
                    "${pkgdir}/usr/share/mime/packages/" \
                    "${pkgdir}/usr/share/applications/" \
                    "${pkgdir}/opt/"

    bsdtar -xf "${srcdir}/${_softname}-${pkgver}.tar.gz" --numeric-owner -C "${pkgdir}/opt/"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${_softname}" << EOF
#!/bin/sh
export LC_CTYPE="zh_CN.UTF-8"
/opt/${_pkgname}/EdrawInfo "\$@"
EOF
    install -Dm0644 /dev/stdin "${pkgdir}/opt/${_pkgname}/${_softname}.desktop" << EOF
[Desktop Entry]
Name=EdrawInfo
GenericName=EdrawInfo
Categories=Infographic;Flyer;Poster;Design;VectorGraphics;
MimeType=application/x-eddx-i
Exec=edrawinfo
Terminal=false
Type=Application
Icon=edrawinfo
Encoding=UTF-8
Hidden=false
Keywords=EdrawInfo;Infographic;Flyer;Poster;
Comment=Infographic Maker
Name[en_US]=edrawinfo
Name[zh_CN]=亿图信息图
EOF

    ln -sf "/opt/${_pkgname}/${_softname}.desktop" "${pkgdir}/usr/share/applications/${_softname}.desktop"
    ln -sf "/opt/${_pkgname}/${_softname}.png" "${pkgdir}/usr/share/icons/${_softname}.png"
    ln -sf "/opt/${_pkgname}/eddx.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/eddx-i.svg"
    ln -sf "/opt/${_pkgname}/${_softname}.xml" "${pkgdir}/usr/share/mime/packages/${_softname}.xml"
}


