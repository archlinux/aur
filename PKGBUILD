# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Jakob Kreuze <jakob@memeware.net>
# Contributor: Bader <Bad3r@unsigned.sh>
# Contributor: p0358

# shellcheck disable=SC1090,SC1091,SC2207

: "${_system_zig:=no}"

pkgname=pince
pkgver=0.10.1
pkgrel=1
pkgdesc="A Linux reverse engineering tool inspired by Cheat Engine."
arch=('x86_64')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL-3.0-or-later WITH CC-BY-3.0')
depends=('gdb' 'polkit' 'python-capstone' 'python-keyboard' 'python-keystone' 'python-msgpack' 'python-pexpect' 'python-pygdbmi' 'python-pyqt6')
makedepends=('git' 'qt6-tools')
if [[ "${_system_zig}" != "no" ]]; then
    makedepends+=('zig')
fi
optdepends=(
    'qt6-wayland: wayland support'
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "libmemscan::git+https://github.com/brkzlr/libmemscan.git#commit=a038194566187f5df282c5fd551bf60ed745b9d6"
        'pince.desktop'
        'pince.sh')
sha256sums=('4ecb2dc05bf1bf4f1ac50d0f9cd0f9541f9b9eb1f9bc34eaf43894fcb0f9c1a6'
            '3905aa15f197e6690db0205536055d669c69833e018d8a267d4c628013a992e4'
            'ce07383acea3a2b607e6328cc33390d76a5c76481ae8cff8080dc6eb6da274ab'
            'ce4e18550a4aecd48ce21ba7f4233b9acfdd70c9c163aff0d53a1d960fc2c5d7')

prepare() {
    git -c submodule.libmemscan.url="${srcdir}/libmemscan" -c protocol.file.allow=always -C "${pkgname}" submodule update --init
}

build() { # reference: PINCE/ci/package.sh
    cd "${pkgname}" || exit 1

    # reuse install.sh's functions
    PINCE_LIB_ONLY=1
    source install.sh

    SCRIPTDIR="$PWD"
    #LIBMEMSCAN_CPU="-Dcpu=x86_64_v2"

    set_install_vars "arch" || exit_on_error

    if [[ "${_system_zig}" != "no" ]]; then
        ln -sf /usr/bin/zig libmemscan/zig
    fi

    build_libmemscan || exit_on_error
    build_mono_collector || exit_on_error
    compile_translations || exit_on_error
}

package() {
    install -Dm755 pince.sh "${pkgdir}/usr/bin/pince"
    install -Dm644 pince.desktop "${pkgdir}/usr/share/applications/io.github.korcankaraokcu.PINCE.desktop"

    cd "${pkgname}" || exit 1

    install -d "${pkgdir}/usr/lib/pince/"
    cp -r GUI i18n libpince media tr AUTHORS COPYING COPYING.CC-BY PINCE.py THANKS "${pkgdir}/usr/lib/pince/"
    install -Dm644 media/logo/ozgurozbek/pince_small_transparent.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.korcankaraokcu.PINCE.png"

    # Compile Python bytecode
    python -m compileall -q -s "${pkgdir}" -p / "${pkgdir}"
}
