# Maintainer: taotieren <admin@taotieren.com>

pkgbase=jlink-flush-gui-git
pkgname=jlink-flush-gui-git
pkgver=62d5ba7.r10.g06b7689
pkgrel=2
groups=()
pkgdesc="JLink Flush GUI"
arch=($CARCH)
url="https://github.com/duapple/JLink_Flush_GUI"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
_qt=qt6
depends=(
    sh
    gcc-libs
    glibc
    ${_qt}-base
    # AUR
    jlink-software-and-documentation
    srecord
)
makedepends=(
    git
    ${_qt}-5compat
    ${_qt}-tools
    pkgconf
)
# optdepends=(
#     'jlink-software-and-documentation: Segger JLink software &
# documentation pack for Linux'
#     'srecord: The SRecord package is a collection of powerful tools for manipulating EPROM load files.'
# )
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    sed -e 's|/opt/$${TARGET}/bin|/share/jlink_flash_gui|g' \
        -e '4i\greaterThan(QT_MAJOR_VERSION,5): QT += core5compat' \
        -i JLink_Flash_GUI.pro
    sed -e 's|/home/duapple/work/qt/JLink_Flash_GUI/JLink_Flash_GUI/build-JLink_Flash_GUI-Desktop_Qt_5_12_2_GCC_64bit-Debug/Z3_Humiture.bin|~/|g' \
        -e 's|/home/duapple/work/qt/JLink_Flash_GUI/JLink_Flash_GUI/build-JLink_Flash_GUI-Desktop_Qt_5_12_2_GCC_64bit-Debug/Z3_Humiture.hex|~/|g' \
        -e 's|/home/duapple/下载/JLink_Linux_V672d_x86_64/JLinkExe|/usr/bin/JLinkExe|g' \
        -i \
        config/jlink_device_info.json \
        config/flush_config.txt \
        config/global_config.json
    sed -e 's|./bin/srec_info|/usr/bin/srec_info|g' \
        -e 's|./bin/srec_cat|/usr/bin/srec_cat|g' \
        -i \
        utils/utils.cpp
    qmake6 ./JLink_Flash_GUI.pro -spec linux-g++ CONFIG+=qtquickcompiler CONFIG+=release
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make install INSTALL_ROOT=${pkgdir}/usr

    cp -rv config ${pkgdir}/usr/share/jlink_flash_gui/
    #     mkdir -pv ${pkgdir}/usr/share/jlink_flash_gui/bin
    #     ln -sf /usr/bin/srec_info ${pkgdir}/usr/share/jlink_flash_gui/bin/srec_info
    #     ln -sf /usr/bin/srec_cat ${pkgdir}/usr/share/jlink_flash_gui/bin/srec_cat
    #     ln -sf /usr/bin/srec_cmp ${pkgdir}/usr/share/jlink_flash_gui/bin/srec_cmp
    touch ${pkgdir}/usr/share/jlink_flash_gui/config/JLink_Flash_GUI-log.txt
    chmod 666 -R ${pkgdir}/usr/share/jlink_flash_gui/config
    install -Dm0755 /dev/stdin ${pkgdir}/usr/bin/JLink_Flash_GUI <<EOF
#!/usr/bin/env bash

cd /usr/share/jlink_flash_gui/

./JLink_Flash_GUI '\$@'
EOF
    install -Dm0644 /dev/stdin ${pkgdir}/usr/share/applications/io.github.duapple.jlink_flash_gui.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=${pkgdesc}
Comment=${pkgdesc}
Exec=/usr/bin/JLink_Flash_GUI
Icon=io.github.duapple.jlink_flash_gui.ico
Terminal=false
StartupNotify=false
Categories=Development
EOF
    install -Dm0644 image/logo.ico ${pkgdir}/usr/share/pixmaps/io.github.duapple.jlink_flash_gui.ico
}
