# Maintainer Sienna <i at kals dev>
# Maintainer sukanka <su975853527 at gmail dot com>
# Maintainer: taotieren <admin@taotieren.com>
#
# 注意：中望CAD官方未提供固定下载链接，且 deb 二进制文件不可随意分发。
# 请用户自行从官网下载对应版本的 amd64 deb 包，然后通过环境变量传入：
#   ZWCAD_DEB=/path/to/zwcad2026_26.1.3.4_amd64.deb yay -S zwcad-bin

pkgname='zwcad-bin'
_pkgname='zwcad'
pkgver=26.1.3.4
_year=20${pkgver:0:2}
pkgrel=1
epoch=1
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
arch=('x86_64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
conflicts=("zwcad")
depends=(
    bash
    curl
    expat
    fontconfig
    freetype2
    gcc-libs
    glib2
    glibc
    glu
    hicolor-icon-theme
    libdrm
    libglvnd
    libjpeg-turbo
    libpng
    libx11
    libxcb
    libxext
    libxxf86vm
    libxfixes
    libxshmfence
    mesa
    python
    krb5
    util-linux-libs
    xdg-utils
    zlib
)
makedepends=('patchelf')
source=('zwcad.sh' 'zwlmgr.sh')
sha512sums=('68bcd4912da5c77c1cde82645f01c01473740ae996501873141e2c2694917f1b84872ab13de4d6b0aa613e7eb2c388cc24f39ba6ebe795e72c31422bfbca91ae'
            'ec16097d1fedb47f7bfbae91bb24823cbd62a406acbcf3c23492e17f58528053bca2ff13bcd53b33899383e35922afcbde1b237fc8546e5533fba0794668cad1')
options=(!strip !debug)

prepare() {
    if [[ -z "${ZWCAD_DEB}" ]]; then
        error "ZWCAD_DEB 环境变量未设置。"
        msg2 "请从官网下载中望CAD Ubuntu版 deb 安装包，例如："
        msg2 "  zwcad2026_26.1.3.4_amd64.deb"
        msg2 "然后通过环境变量传入路径后重新构建："
        msg2 "  ZWCAD_DEB=/path/to/zwcad${_year}_${pkgver}_amd64.deb yay -S zwcad-bin"
        exit 1
    fi
    if [[ ! -f "${ZWCAD_DEB}" ]]; then
        error "ZWCAD_DEB 指向的文件不存在：${ZWCAD_DEB}"
        exit 1
    fi

    cd "${srcdir}"
    ar x "${ZWCAD_DEB}" data.tar.xz
    tar -xJf data.tar.xz -C "${srcdir}"

    cd $srcdir/opt/apps/zwcad${_year}/ZwPyRuntime
    local _pyver=$(python -V | cut -d' ' -f2)
    test -d python${_pyver%.*} || mkdir python${_pyver%.*}
    cp python3.8/ZwPyRuntime.so python${_pyver%.*}
    rm -rf python3.{4,5,6,7,8}
}

build() {
    cd $srcdir/opt/apps/zwcad${_year}

    # Fix desktop entries to use packaged wrappers
    cd $srcdir/usr/share/applications/
    sed -i "s|^Exec=.*|Exec=zwcad %F|g;s|^Icon=.*|Icon=zwcad${_year}|g" "zwcad${_year}.desktop"
    sed -i "s|^Exec=.*|Exec=zwlmgr|g;s|^Icon=.*|Icon=zwcad${_year}|g" "zwlmgr${_year}.desktop"
}

package() {
    mkdir -p "$pkgdir"/opt
    cp -rf "${srcdir}"/usr "$pkgdir"
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    cp -rf "${srcdir}"/opt/apps/zwcad${_year} "${pkgdir}"/opt/zwcad

    # create executable
    install -Dm755 ${srcdir}/zwcad.sh "$pkgdir"/usr/bin/zwcad
    install -Dm755 ${srcdir}/zwlmgr.sh "$pkgdir"/usr/bin/zwlmgr

    # install udev rule
    install -Dm644 "${pkgdir}"/opt/zwcad/sense4_usb.rules ${pkgdir}/etc/udev/rules.d/sense4_usb.rules

    # remove hardcoded build rpath from binaries
    find ${pkgdir}/opt/zwcad -maxdepth 1 -executable -type f -print0 |
        xargs -0 -i sh -c 'patchelf --set-rpath "\$ORIGIN:\$ORIGIN/lib" "{}" 2> /dev/null || true'

    # keep bundled libs in /opt/zwcad; Qt plugins and dotnet runtime must stay intact
}
