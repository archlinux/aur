# Maintainer: greenhandzdl <greenhandzdl@gmail.com>
pkgname=iautodraw-bin
pkgver=3.7.4
pkgrel=1
pkgdesc="IAutoDraw - 工业级智能图形绘制与设计软件 (官方二进制版)"
arch=('x86_64' 'aarch64')
url="https://www.iautodraw.com/"
license=('unknown')

depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'hicolor-icon-theme')
optdepends=('libglvnd: 启用硬件加速图形渲染')
makedepends=('binutils')
provides=('iautodraw')
conflicts=('iautodraw')

options=('!strip' '!debug')

_ver_x86_64="3.7.4"
_arch_x86_64="amd64"

_ver_aarch64="3.7.3"
_arch_aarch64="arm64"

source_x86_64=("${pkgname}-${pkgver}-x86_64.deb"::"https://www.iautodraw.com/static/version/IAuto_${_ver_x86_64}_${_arch_x86_64}.deb")
sha256sums_x86_64=('f6f21efda827469fd52f58fc18d5d7b2f51a474462991e36741e24b768c1d6fc')
sha256sums_aarch64=('0e7eda096ea1ae2cf5b5353c61f72bbadbc2d9c6df54206376ddeed540271245')

source_aarch64=("${pkgname}-${pkgver}-aarch64.deb"::"https://www.iautodraw.com/static/version/IAuto_${_ver_aarch64}_${_arch_aarch64}.deb")

noextract=("${pkgname}-${pkgver}-x86_64.deb" "${pkgname}-${pkgver}-aarch64.deb")

prepare() {
    cd "${srcdir}"
    ar x "${pkgname}-${pkgver}-${CARCH}.deb"
    tar -xf data.tar.*
}

package() {
    cd "${srcdir}"
    cp -a usr "${pkgdir}/"
    if [ -d opt ]; then
        cp -a opt "${pkgdir}/"
    fi

    local _desktop_file="${pkgdir}/usr/share/applications/iauto.desktop"
    if [ -f "${_desktop_file}" ]; then
        sed -i 's|^Exec=.*|Exec=/opt/IAuto/iauto --in-process-gpu %U|' "${_desktop_file}"
    fi
}
