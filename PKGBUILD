# Maintainer: taotieren <admin@taotieren.com>

pkgbase=chipon
pkgname=($pkgbase{,-ide32,-program32,-cc32})
pkgver=1.0.18
pkgrel=2
arch=('x86_64')
url='https://www.chipon-ic.com'
license=('unknow')
groups=('chipon')
#provides=()
#conflicts=()
depends=()
makedepends=('libarchive')
options=(!debug !strip !lto)
source=("${pkgbase}_${pkgver}.zip::${url}/upload/file/20210728/2518367d-eca8-48d1-8173-d00a4369773c.zip"
    "${pkgbase}.png::${url}/images/logo.png"
    "chipon-program32.install"
    "chipon-driver.install")

sha256sums=('e6a91b3b69933be11a8d65c491c3a10c8f589ac8bf82a069a12493918614bccf'
            'cc874c89347279267ff1102df57ecabe8cc0f7fee2658399e492fd97b8b58453'
            '6a2196796a9cf54f0696a2ee3621d5b8af8bc5aa24aee40bc8f6d9309639fac8'
            'e7ab8cea2aacbda3122e15da4c9d0833784f2c84f9b93333705e24b6056e8d34')

noextract=(${pkgbase}_${pkgver}.zip)

prepare() {
    bsdunzip -O gbk -d "${srcdir}/${pkgbase}_${pkgver}" "${srcdir}/${pkgbase}_${pkgver}.zip"
    bsdunzip -O gbk "${srcdir}/${pkgbase}_${pkgver}/ChipONCC32_${pkgver}.zip"
    bsdunzip -O gbk "${srcdir}/${pkgbase}_${pkgver}/chiponide32_${pkgver}.zip"
    bsdunzip -O gbk "${srcdir}/${pkgbase}_${pkgver}/chiponprogram32_${pkgver}.zip"
}

package_chipon() {
    pkgdesc="KungFu32 系列 32 位 MCU 设计的 IDE（集成开发环境)，内置编译器、汇编器，支持调试。KungFu32 产品上位机编程软件，支持查空、读取、编程、在线编程、脱机编程、自增编程等；支持加载并查看修改 HEX 文件等操作。"
    pkgname=($pkgbase{,-ide32,-program32,-cc32})
}

package_chipon-ide32() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="KungFu32 系列 32 位 MCU 设计的 IDE（集成开发环境)，内置编译器、汇编器，支持调试"
    depends=(
        sh
        gcc-libs
        glib2
        glibc
        java-runtime
        libxml2
        perl
        python
    )
    _pkgname="chiponide32"

    install -dm755 "${pkgdir}/opt/${pkgbase}"

    cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt/${pkgbase}"
    cp -r "${srcdir}/${pkgbase}_${pkgver}/ChipON KungFu32 Development  For Linxu User Guide_CN 2.0.pdf" "${pkgdir}/opt/${pkgbase}/${_pkgname}/doc/ChipON KungFu32 Development  For Linux User Guide_CN 2.0.pdf"

    install -Dm644 "${srcdir}/${pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${pkgdir}/opt/${pkgbase}/${_pkgname}/Driver/20-usb-serial.rules" "${pkgdir}/usr/lib/udev/rules.d/20-usb-serial.rules"
    install -Dm644 "${pkgdir}/opt/${pkgbase}/${_pkgname}/Driver/49-kungfu32_udev.rules" "${pkgdir}/usr/lib/udev/rules.d/49-kungfu32_udev.rules"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/bin/env bash
export JAVA_HOME=/opt/${pkgbase}/${_pkgname}/jre
export KungFu32Tool_HOME=/opt/${pkgbase}/ChipONCC32
export PATH=$JAVA_HOME:$KungFu32Tool_HOME:$PATH
/opt/${pkgbase}/${_pkgname}/${_pkgname}
EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Version=${pkgver}
Name=${_pkgname}
Comment=${_pkgname}
GenericName=${_pkgname}
Exec=env GDK_BACKEND=x11 ${_pkgname} %F
Icon=${_pkgname}.png
Path=/opt/${pkgbase}/${_pkgname}
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
EOF

}

package_chipon-program32() {
    pkgdesc="KungFu32 产品上位机编程软件，支持查空、读取、编程、在线编程、脱机编程、自增编程等；支持加载并查看修改 HEX 文件等操作。"
    depends=(
        sh
        gcc-libs
        glib2
        glibc
        java-runtime
        libxml2
        uucp
        perl
        python
    )
    install=chipon-program32.install
    _pkgname="chiponprogram32"

    install -dm755 "${pkgdir}/opt/${pkgbase}"
    install -dm777 "${pkgdir}/opt/${pkgbase}/kf32pro_ws"

    cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt/${pkgbase}"

    install -Dm644 "${srcdir}/${pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/bin/env bash
export JAVA_HOME=/opt/${pkgbase}/${_pkgname}/jre
export KungFu32Tool_HOME=/opt/${pkgbase}/ChipONCC32
export PATH=$JAVA_HOME:$KungFu32Tool_HOME:$PATH
/opt/${pkgbase}/${_pkgname}/${_pkgname}
EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Version=${pkgver}
Name=${_pkgname}
Comment=${_pkgname}
GenericName=${_pkgname}
Exec=env GDK_BACKEND=x11 ${_pkgname} %F
Icon=${_pkgname}.png
Path=/opt/${pkgbase}/${_pkgname}
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
EOF

}

package_chipon-cc32() {
    pkgdesc="KungFu32 系列 32 位 MCU 设计的 IDE（集成开发环境)的编译器、汇编器，支持调试"
    depends=(
        sh
        glibc
    )
    _pkgname="ChipONCC32"

    install -dm755 "${pkgdir}/opt/${pkgbase}"

    cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt/${pkgbase}"
}
