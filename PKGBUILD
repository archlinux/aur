# Maintainer: taotieren <admin@taotieren.com>

pkgbase=at32-work-bench-bin
pkgname=at32-work-bench
pkgver=1.2.05
pkgrel=5
# epoch=1
pkgdesc="AT32 MCU 图形化配置软件，生成初始化 C 代码"
arch=('x86_64')
url="https://www.arterytek.com/cn/support/tools.jsp"
license=('LicenseRef-scancode-commercial-license')
provides=(${pkgname})
conflicts=()
replaces=()
depends=(
    sh
    glib2
    libgcc_s.so
    libstdc++.so
    zlib
)
makedepends=(
    desktop-file-utils
    libarchive
    sed)
optdepends=(
    'artery-isp-console'
    'at-link-console'
    'at32-bootloader-doc'
    'at32-ide'
    'at32-ide-project-generate'
    'at32-new-clock-configuration'
    'at32-openocd'
    'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux')
backup=()
options=('!strip' '!debug' '!lto')
install=
_pkg_file_name=AT32_Work_Bench_Linux-${arch}_V${pkgver}
source=("${_pkg_file_name}.zip::https://www.arterytek.com/download/AT32%20Workbench/${_pkg_file_name}.zip")
sha256sums=('15237b61e1aeda0c367b0f90f361afaa686fb65125243e5d84dcf45d1c4a4d6d')
noextract=()

package() {
    install -dm0755 "${pkgdir}/opt/artery32/"

    bsdtar -xf ${srcdir}/${_pkg_file_name}.deb -C ${srcdir}
    bsdtar -xf ${srcdir}/data.tar.xz -C "${pkgdir}"

    mv "${pkgdir}/usr/local" "${pkgdir}/opt/artery32/${pkgname}"

    sed -i "s|/usr/local|/opt/artery32/${pkgname}|g" "${pkgdir}"/usr/share/applications/AT32_Work_Bench.desktop

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash
cd /opt/artery32/${pkgname}/AT32_Work_Bench/
bash AT32_Work_Bench.sh --stylesheet=<(echo 'QWidget {background-color: white;color: black;}') "\$@"
EOF
    chown -R root:root "${pkgdir}/"
    find "${pkgdir}/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/" -type d -exec chmod 755 "{}" \;

    chmod 777 "${pkgdir}/opt/artery32/${pkgname}/AT32_Work_Bench/"
    cd "${pkgdir}/opt/artery32/${pkgname}/AT32_Work_Bench/"
    chmod +x AT32_Work_Bench*
}
