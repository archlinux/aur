# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=vapoursynth-editor
pkgver=r19_mod_6.10
_pkgver=R19-mod-6.10
pkgrel=1
pkgdesc='Editor for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/YomikoR/VapourSynth-Editor'
license=('MIT')
depends=('qt6-5compat' 'qt6-websockets' 'vapoursynth')
makedepends=('mold')
options=('!lto')
source=("https://github.com/YomikoR/VapourSynth-Editor/archive/refs/tags/${_pkgver}.tar.gz"
        'vsedit.desktop')
b2sums=('739b64a4debe8fef54b445ddd0dabe71929bba1c4b1750a98248b4caf806a2d65cc886eb0c44b8f56d533aad82765a55d2571d71b41d76f0c69b5181cbee0f37'
        '17ec3156102b633a14d963f1a7e600afedc5b2470555ebcfee1f47ca2de5ebd6fc8bd28896ff0f5b3dd0187d24dd869385560e825cafad6ecd866eb9b07a4be4')

build() {
    cd VapourSynth-Editor-${_pkgver}/pro

    export VS_INCLUDE_PATH='/usr/include/vapoursynth'
    export LDFLAGS="${LDFLAGS} -fuse-ld=mold"
    qmake6 -norecursive pro.pro CONFIG+=release
    make
}

package() {
    cd VapourSynth-Editor-${_pkgver}

    install -Dm755 build/release-64bit-gcc/vsedit -t "${pkgdir}"/usr/bin/
    install -Dm755 build/release-64bit-gcc/vsedit-job-server -t "${pkgdir}"/usr/bin/
    install -Dm755 build/release-64bit-gcc/vsedit-job-server-watcher -t "${pkgdir}"/usr/bin/
    install -Dm755 build/release-64bit-gcc/vsedit-previewer -t "${pkgdir}"/usr/bin/

    install -Dm644 build/release-64bit-gcc/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    install -Dm644 build/release-64bit-gcc/vsedit.svg -t "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    install -Dm644 "${srcdir}"/vsedit.desktop -t "${pkgdir}"/usr/share/applications/
}
