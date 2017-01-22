# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-dependency-control
pkgver=0.6.3
pkgrel=2
pkgdesc="Package manager for scripts for the Aegisub subtitle editor"
arch=('i686' 'x86_64')
url="https://github.com/TypesettingTools/DependencyControl"
license=('MIT' 'ISC' 'MIT')
depends=('aegisub' 'curl')
makedepends=('moonscript')

_depctrlver=${pkgver}-alpha
_ffiexpver=c325e1c6ad3b5a741ac4a18fd3ac3504cf9c8081 # requireffi=0.1.2 PreciseTimer=0.1.5 BadMutex=0.1.3 DownloadManager=0.4.0
_luajsonver=1.3.3
source=("DependencyControl-${_depctrlver}.tar.gz::https://github.com/TypesettingTools/DependencyControl/archive/v${_depctrlver}.tar.gz" # github strips the 'v' in the actual archive
        "ffi-experiments-${_ffiexpver}.tar.gz::https://github.com/torque/ffi-experiments/archive/${_ffiexpver}.tar.gz"
        "luajson-${_luajsonver}.tar.gz::https://github.com/harningt/luajson/archive/${_luajsonver}.tar.gz")
sha256sums=('ac845ee6152db94c42ae80e2ccbede6571c27342c22819efa68c648327cdfdc2'
            '90c13fcb50ecfc0a60ca659d25d2c99d98becfdcd6ec11976793b78d37607c55'
            '6a986efa210a912a04c8e6cae8f3b5e72172c02f974152e14818af6598a5e2db')

build() {
    cd "${srcdir}/ffi-experiments-${_ffiexpver}"
    make all lua
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
    install -D -m644 build/BadMutex.lua          "${pkgdir}${prefix}/include/BM/BadMutex.lua"
    install -D -m644 build/libBadMutex.so        "${pkgdir}${prefix}/include/BM/BadMutex/libBadMutex.so"
    install -D -m644 build/DownloadManager.lua   "${pkgdir}${prefix}/include/DM/DownloadManager.lua"
    install -D -m644 build/libDownloadManager.so "${pkgdir}${prefix}/include/DM/DownloadManager/libDownloadManager.so"
    install -D -m644 build/PreciseTimer.lua      "${pkgdir}${prefix}/include/PT/PreciseTimer.lua"
    install -D -m644 build/libPreciseTimer.so    "${pkgdir}${prefix}/include/PT/PreciseTimer/libPreciseTimer.so"
    install -D -m644 build/requireffi.lua        "${pkgdir}${prefix}/include/requireffi/requireffi.lua"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ffi-experiments"

    # luajson
    cd "${srcdir}/luajson-${_luajsonver}"
    install -m 644 lua/json.lua "${pkgdir}${prefix}/include"
    cp -r lua/json "${pkgdir}${prefix}/include"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_luajson"
}
