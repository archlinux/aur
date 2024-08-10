# Maintainer: Yamashiro <dev cosmicheron com>

_pkgbase='yquake2remaster'
pkgname="${_pkgbase}-git"
pkgver=r4342.ab6ce60
pkgrel=2
pkgdesc='Experimental fork of Yamagi Quake II to add support for Quake II Enhanced/Remaster(ed)'
url="https://github.com/yquake2/${_pkgbase}"
arch=('i686' 'x86_64' 'aarch64')
license=('Info-ZIP' 'GPL-2.0-only')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
depends=('ffmpeg' 'glibc' 'libglvnd' 'sdl2')
makedepends=('curl' 'git' 'openal' 'vulkan-headers')
optdepends=('curl' 'openal' 'quake2-data' 'quake2-demo' 'vulkan-driver')
source=("${_pkgbase}::git+${url}.git"
        "${_pkgbase}.desktop"
        "${_pkgbase}-ctf.desktop"
        "${_pkgbase}-rogue.desktop"
        "${_pkgbase}-xatrix.desktop"
        )
sha512sums=('SKIP'
            'a26969f36ce9fe9a8a487ab53e74af1c2938edc6f68361b2c4a94c24878e0e21886c982f07ac3e4188cb37f5f2cba29cdead796c5a969da64470ef21938d1588'
            'c8d6ce61704e89bfef5e73cd2e6ec12ae5688f81f0c85c7935e5e3758f0f3442ee027db8a9abeb67018052a8992f28e42c734fb11e756606ed7a20238c7e4273'
            '2893839aa7974c53a9ce5dd02dab59da66f2f9e42c9504223becf05f935c90efcb973c92dcb33eeac629a692e42f80c5904cd4f279c7cd4be792e07bb11f6ec0'
            '3f8b14b20a0af1c937fb90bf5e4f6d86d829c9f8d070a28814da43973a604c22a0dc896a8eee461f963020dd9a6ac58f905450ff0af6a88aed5b63b91aafcc35'
            )

pkgver() {
    cd "$_pkgbase"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    make -C "${srcdir}/${_pkgbase}" WITH_RPATH=no WITH_SYSTEMWIDE=yes
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
