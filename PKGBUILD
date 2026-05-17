# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=vapoursynth-editor
pkgver=r19_mod_6.10
_pkgver=R19-mod-6.10
pkgrel=4
pkgdesc='Editor for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/YomikoR/VapourSynth-Editor'
license=('MIT')
depends=('qt6-websockets' 'vapoursynth>=74')
install='vsedit.install'
source=("https://github.com/YomikoR/VapourSynth-Editor/archive/refs/tags/${_pkgver}.tar.gz"
        'vsedit.desktop'
        'vsedit.sh')
b2sums=('739b64a4debe8fef54b445ddd0dabe71929bba1c4b1750a98248b4caf806a2d65cc886eb0c44b8f56d533aad82765a55d2571d71b41d76f0c69b5181cbee0f37'
        '0be4452d3547176c674f1c938ec745d1d27741c4da5d87e212e5d6fd723240600c5d8ed760121a68ac7a60e42518c9af0c2367a63c5161a0e75581d65be9417d'
        '5b56b51193150f31ae515ba06d6209c57c8f129694887de4b5d672b5fe9394f93e96472e4863cdc651b1f4c927b5320cfd27286554c9ebf21f8dcbfc955727d0')

build() {
    cd VapourSynth-Editor-${_pkgver}/pro

    export VS_INCLUDE_PATH="$(/usr/bin/env python -c 'import vapoursynth;print(vapoursynth.get_include())')"
    export MAKEFLAGS="${MAKEFLAGS} -j2"
    qmake6 -norecursive pro.pro CONFIG+=release
    make
}

package() {
    cd VapourSynth-Editor-${_pkgver}/build/release-64bit-gcc

    install -Dm755 -t "${pkgdir}/usr/bin" vsedit vsedit-encode vsedit-job-server vsedit-job-server-watcher vsedit-previewer

    install -Dm644 -t "${pkgdir}/usr/share/licenses/vapoursynth-editor" LICENSE

    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" vsedit.svg

    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}"/vsedit.desktop

    # Set VSSCRIPT_PATH variable
    install -Dm644 -t "${pkgdir}/etc/profile.d" "${srcdir}"/vsedit.sh
}
