# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Jakob Kreuze <jakob@memeware.net>
# Contributor: Bader <Bad3r@unsigned.sh>
# Contributor: p0358

# shellcheck disable=SC1090,SC1091,SC2207

: "${_system_zig:=no}"

pkgname=pince
pkgver=0.8
pkgrel=1
pkgdesc="A Linux reverse engineering tool inspired by Cheat Engine."
arch=('x86_64')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL-3.0-or-later WITH CC-BY-3.0')
depends=('gdb' 'polkit' 'python-capstone' 'python-keyboard' 'python-keystone' 'python-pexpect' 'python-pygdbmi' 'python-pyqt6')
makedepends=('git' 'python-pip' 'qt6-tools')
if [[ "${_system_zig}" != "no" ]]; then
    makedepends+=('zig')
fi
optdepends=(
    'qt6-wayland: wayland support'
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "libmemscan::git+https://github.com/brkzlr/libmemscan.git#commit=d5989e416ebaa729f287e7ce490dce03e90c25e2"
        'pince.desktop'
        'pince.sh')
sha256sums=('2318c1434081176923b44e56f3c1be79d7bfff3a718d4613f5ae538cafd94c3b'
            '28bfa1011872220d05389d1747cbaf89765d6e8e158ebf9fe1660e89cfc06b1c'
            'ce07383acea3a2b607e6328cc33390d76a5c76481ae8cff8080dc6eb6da274ab'
            'ce4e18550a4aecd48ce21ba7f4233b9acfdd70c9c163aff0d53a1d960fc2c5d7')

prepare() {
    git -c submodule.libmemscan.url="${srcdir}/libmemscan" -c protocol.file.allow=always -C "${pkgname}" submodule update --init
}

build() {
    cd "${pkgname}" || exit 1

    # Get functions from upstream "install.sh" using sed range addresses
	# https://www.gnu.org/software/sed/manual/sed.html#Range-Addresses-1
    source <(sed -n '/^exit_on_error() /,/^}/p' install.sh)
    source <(sed -n '/^set_install_vars() /,/^}/p' install.sh)
    source <(sed -n '/^compile_translations() /,/^}/p' install.sh)
    source <(sed -n '/^compile_libmemscan() /,/^}/p' install.sh)
    source <(sed -n '/^install_libmemscan() /,/^}/p' install.sh)

    set_install_vars "Arch Linux" || exit_on_error # compile_translations needs this

    if [[ "${_system_zig}" != "no" ]]; then
        ln -sf /usr/bin/zig libmemscan/zig
    fi

    install_libmemscan || exit_on_error
    compile_translations || exit_on_error
}

package() {
    install -Dm755 pince.sh "${pkgdir}/usr/bin/pince"
    install -Dm644 pince.desktop "${pkgdir}/usr/share/applications/io.github.korcankaraokcu.PINCE.desktop"

    cd "${pkgname}" || exit 1

    install -d "${pkgdir}/usr/lib/pince/"
    cp -r GUI libpince media tr AUTHORS COPYING COPYING.CC-BY PINCE.py THANKS "${pkgdir}/usr/lib/pince/"
    install -d "${pkgdir}/usr/lib/pince/i18n"
    cp -r i18n/qm "${pkgdir}/usr/lib/pince/i18n"
    install -Dm644 media/logo/ozgurozbek/pince_small_transparent.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.korcankaraokcu.PINCE.png"

    # Compile Python bytecode
    python -m compileall -q -s "${pkgdir}" -p / "${pkgdir}"
}
