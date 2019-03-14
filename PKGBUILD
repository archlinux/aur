# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-dependency-control
pkgver=0.6.3
pkgrel=4
pkgdesc="Package manager for scripts for the Aegisub subtitle editor"
arch=('i686' 'x86_64')
url="https://github.com/TypesettingTools/DependencyControl"
license=('MIT' 'ISC' 'MIT')
depends=('aegisub' 'libcurl.so')
makedepends=('moonscript' 'meson')

_depctrlver=${pkgver}-alpha
_ffiexpver=e8d9c915390aaa8ffa1d220f4696f4fe2ca6ae6e # requireffi=0.1.2 PreciseTimer=0.1.6 BadMutex=0.1.3 DownloadManager=0.5.0
_luajsonver=1.3.3
source=("DependencyControl-${_depctrlver}.tar.gz::https://github.com/TypesettingTools/DependencyControl/archive/v${_depctrlver}.tar.gz" # github strips the 'v' in the actual archive
        "ffi-experiments-${_ffiexpver}.tar.gz::https://github.com/TypesettingTools/ffi-experiments/archive/${_ffiexpver}.tar.gz"
        "luajson-${_luajsonver}.tar.gz::https://github.com/harningt/luajson/archive/${_luajsonver}.tar.gz")
sha256sums=('ac845ee6152db94c42ae80e2ccbede6571c27342c22819efa68c648327cdfdc2'
            'd48c3f3375e480daf3e7ab2a657a1daec208d086173116168363d5bd0bb372b4'
            '6a986efa210a912a04c8e6cae8f3b5e72172c02f974152e14818af6598a5e2db')

build() {
    cd "${srcdir}/ffi-experiments-${_ffiexpver}"
    meson build
    ninja -C build all lua
}

package() {
    local prefix="/usr/share/aegisub/automation"

    # depctrl
    cd "${srcdir}/DependencyControl-${_depctrlver}"
    install -d "${pkgdir}${prefix}/include/l0"
    cp -r modules/* "${pkgdir}${prefix}/include/l0"
    install -D -m 644 macros/* -t "${pkgdir}${prefix}/autoload"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_DependencyControl"

    # ffiexp
    cd "${srcdir}/ffi-experiments-${_ffiexpver}"
    install -D -m644 build/bad-mutex/BadMutex.lua                 "${pkgdir}${prefix}/include/BM/BadMutex.lua"
    install -D -m644 build/bad-mutex/libBadMutex.so               "${pkgdir}${prefix}/include/BM/BadMutex/libBadMutex.so"
    install -D -m644 build/download-manager/DownloadManager.lua   "${pkgdir}${prefix}/include/DM/DownloadManager.lua"
    install -D -m644 build/download-manager/libDownloadManager.so "${pkgdir}${prefix}/include/DM/DownloadManager/libDownloadManager.so"
    install -D -m644 build/precise-timer/PreciseTimer.lua         "${pkgdir}${prefix}/include/PT/PreciseTimer.lua"
    install -D -m644 build/precise-timer/libPreciseTimer.so       "${pkgdir}${prefix}/include/PT/PreciseTimer/libPreciseTimer.so"
    install -D -m644 build/requireffi/requireffi.lua              "${pkgdir}${prefix}/include/requireffi/requireffi.lua"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ffi-experiments"

    # luajson
    cd "${srcdir}/luajson-${_luajsonver}"
    install -m 644 lua/json.lua "${pkgdir}${prefix}/include"
    cp -r lua/json "${pkgdir}${prefix}/include"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_luajson"
}
