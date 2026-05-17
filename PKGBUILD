# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Jakob Kreuze <jakob@memeware.net>
# Contributor: Bader <Bad3r@unsigned.sh>
# Contributor: p0358

# shellcheck disable=SC1090
pkgname=pince
pkgver=0.5
pkgrel=3
pkgdesc="A Linux reverse engineering tool inspired by Cheat Engine."
arch=('any')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL-3.0-or-later WITH CC-BY-3.0')
depends=(gdb  polkit python-capstone python-keyboard python-keystone python-pexpect python-pygdbmi python-pyqt6)
makedepends=('cmake' 'python-pip' 'qt6-tools' 'lsb-release' 'pkgconf' 'git' 'sed')
optdepends=(
    'qt6-wayland: wayland support'
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        'pince.desktop'
        'pince.sh')
sha256sums=('9698e8a1c843f7350554a7c339d7bbe8785bccf00f6b7f08faeb3dfdd64f32c6'
            '3660ca6f5f530184de3e9261c417de78ff8e1ae1f03cad9331459bbc6a40d84f'
            '4111c85f3e5764a21d5b57c4a7ee82a70d91713c9d1e10aac7045079139446ab')

build() {
    cd "${pkgname}" || exit 1

    # Get functions from upstream "install.sh" using sed range addresses
	# https://www.gnu.org/software/sed/manual/sed.html#Range-Addresses-1
    source <(sed -n '/^exit_on_error() /,/^}/p' install.sh)
    source <(sed -n '/^set_install_vars() /,/^}/p' install.sh)
    source <(sed -n '/^compile_translations() /,/^}/p' install.sh)
    source <(sed -n '/^compile_libscanmem() /,/^}/p' install.sh)
    source <(sed -n '/^install_libscanmem() /,/^}/p' install.sh)
    source <(sed -n '/^install_libptrscan() /,/^}/p' install.sh)

    set_install_vars "Arch Linux" || exit_on_error # compile_translations needs this
    install_libscanmem || exit_on_error
    install_libptrscan || exit_on_error
    compile_translations || exit_on_error
}

package() {
    install -Dm755 pince.sh "${pkgdir}/usr/bin/pince"
    install -Dm644 pince.desktop "${pkgdir}/usr/share/applications/io.github.korcankaraokcu.PINCE.desktop"

    cd "${pkgname}" || exit 1

    install -Dm755 PINCE.py -t "${pkgdir}/usr/lib/pince/"
    cp -r GUI libpince media tr "${pkgdir}/usr/lib/pince/"
    install -d "${pkgdir}/usr/lib/pince/i18n"
    cp -r i18n/qm "${pkgdir}/usr/lib/pince/i18n"

    install -Dm644 COPYING COPYING.CC-BY -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md AUTHORS THANKS -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 media/logo/ozgurozbek/pince_small_transparent.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.korcankaraokcu.PINCE.png"

    # Compile Python bytecode
    python -m compileall "${pkgdir}"
}
