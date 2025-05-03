# Maintainer: Yamashiro <dev cosmicheron com>

_pkgbase='yquake2remaster'
pkgname="${_pkgbase}-git"
pkgver=r4820.adcd1e1
pkgrel=1
pkgdesc='Experimental fork of Yamagi Quake II to add support for Quake II Enhanced/Remaster(ed)'
url="https://github.com/yquake2/${_pkgbase}"
arch=('i686' 'x86_64' 'aarch64')
license=('Info-ZIP' 'GPL-2.0-only')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
depends=('ffmpeg' 'glibc' 'libglvnd' 'sdl3')
makedepends=('curl' 'git' 'openal' 'vulkan-headers')
optdepends=('curl' 'openal' 'quake2-data' 'quake2-demo' 'vulkan-driver')
source=("${_pkgbase}::git+${url}.git"
    "${_pkgbase}.desktop"
    "${_pkgbase}-ctf.desktop"
    "${_pkgbase}-rogue.desktop"
    "${_pkgbase}-xatrix.desktop"
)
b2sums=(
    'SKIP'
    '3c3927d7687c65d0155ac1c327e4ef3cf0bea0b5eea771965a6acf126e59d1deb46517750737ca12eef5d4d3034a32b3ccd03d0535b5468a6fc5bef302fdec6a'
    'f0760cd3e48ffc15dca55f0adea4a17a94bfc6127a01ae0d22379192907e4d6ec4870abf7e2d7664bdbf639802ad682c51718f1fc92fa11f6d2596c6cca6718e'
    '1179bec70b7ef46a6b9f8dd9b642fda226e1b1d5a460f03e2475f07582800ca25bf9bf5710a7ff2aaebd9df2144eb9132b7dec596571c6eba9b16f39992d2f10'
    'db424d4a59387fcbd04c9142b830eb6a50627102c036ff9b42ef883daefa07e75d0e848e928874f0cb752d0bbba322365eb98e619701ee42d4890fe975cbba9e'
)

pkgver() {
    cd "$_pkgbase"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    make -C "${srcdir}/${_pkgbase}" WITH_RPATH=no WITH_SYSTEMWIDE=yes WITH_SDL3=yes
}

package() {
    cd "${srcdir}/${_pkgbase}"

    # install game executables and libraries
    install -Dm755 -t "${pkgdir}/usr/lib/${_pkgbase}" release/{quake2,q2ded}
    install -Dm644 -t "${pkgdir}/usr/lib/${_pkgbase}" release/*.so
    install -Dm644 -t "${pkgdir}/usr/lib/${_pkgbase}/baseq2" 'release/baseq2/game.so'

    # create symlinks
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgbase}/quake2" "${pkgdir}/usr/bin/${_pkgbase}"
    ln -s "/usr/lib/${_pkgbase}/q2ded" "${pkgdir}/usr/bin/q2ded-remaster"

    # doc
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" 'stuff/yq2.cfg'
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" doc/*.md

    # license
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'

    # icon
    install -Dm644 'stuff/icon/Quake2.svg' "${pkgdir}/usr/share/pixmaps/${_pkgbase}.svg"

    # desktop entries
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${_pkgbase}.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${_pkgbase}-ctf.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${_pkgbase}-xatrix.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${_pkgbase}-rogue.desktop"
}
