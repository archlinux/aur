# Maintainer: Funami
# Contributor: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-dependency-control
pkgver=0.6.4
pkgrel=1
pkgdesc="Package manager for scripts for the Aegisub subtitle editor"
arch=('i686' 'x86_64')
url="https://github.com/TypesettingTools/DependencyControl"
license=('MIT' 'ISC' 'MIT')
depends=('aegisub' 'libcurl.so')
makedepends=('moonscript' 'meson')

_depctrlver=${pkgver}-alpha
_ffiexpver=b8897ead55b84ec4148e900882bff8336b38f939 # requireffi=0.1.2 PreciseTimer=0.1.6 BadMutex=0.1.3 DownloadManager=0.5.0
_luajsonver=1.3.3
source=("DependencyControl-${_depctrlver}.tar.gz::https://github.com/TypesettingTools/DependencyControl/archive/v${_depctrlver}.tar.gz" # github strips the 'v' in the actual archive
        "ffi-experiments-${_ffiexpver}.tar.gz::https://github.com/TypesettingTools/ffi-experiments/archive/${_ffiexpver}.tar.gz"
        "luajson-${_luajsonver}.tar.gz::https://github.com/harningt/luajson/archive/${_luajsonver}.tar.gz")
sha256sums=('b4ba3da034be85d2394d4ec7de4192a76be45f900a60dd484a0d1af3d6671c71'
            'ab7933a087260cd114a49f42ad553f63b32268e69f05ebcee3cfc91324370535'
            '6a986efa210a912a04c8e6cae8f3b5e72172c02f974152e14818af6598a5e2db')

build() {
    cd "${srcdir}/ffi-experiments-${_ffiexpver}"
    meson build
    meson compile -C build
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
