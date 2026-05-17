# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Jakob Kreuze <jakob@memeware.net>
# Contributor: Bader <Bad3r@unsigned.sh>
# Contributor: p0358

# shellcheck disable=SC1090,SC2207
pkgname=pince-git
pkgver=r1696.7119718
pkgrel=1
pkgdesc="A Linux reverse engineering tool inspired by Cheat Engine."
arch=('any')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL-3.0-or-later WITH CC-BY-3.0')
provides=('pince')
conflicts=('pince')
depends=('polkit') # follow upstream, set this later
makedepends=('cmake' 'python-pip' 'qt6-tools' 'lsb-release' 'pkgconf' 'git' 'sed')
optdepends=(
    'qt6-wayland: wayland support'
)
source=("${pkgname}::git+${url}.git"
        'pince.desktop'
        'pince.sh')
sha1sums=('SKIP'
          '916ca418f86982ee96937da468e3fa2d7d04c9ae'
          '4d9901d48437cf6870650d343d94774763e4916f')

pkgver() {
    cd "${pkgname}" || exit 1
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
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
    install_libmemscan || exit_on_error
    compile_translations || exit_on_error
}

package() {
    install -Dm755 pince.sh "${pkgdir}/usr/bin/pince"
    install -Dm644 pince.desktop "${pkgdir}/usr/share/applications/io.github.korcankaraokcu.PINCE.desktop"

    cd "${pkgname}" || exit 1

    if [[ -e requirements.txt ]]; then
        # Get $PKG_NAMES_PIP from requirements.txt
        PKG_NAMES_PIP=$(
            sed 's/=.*//g' requirements.txt \
            | tr '[:upper:]' '[:lower:]'
        )
    fi

    # Add new Python depends
    for pipkg in $PKG_NAMES_PIP; do
        msg2 'Added new Python depend '"$pipkg"''
        if [ "$pipkg" == "distorm3" ]; then
            depends+=("python-distorm")
        elif [ "$pipkg" == "pygobject" ]; then
            depends+=("python-gobject")
        elif [ "$pipkg" == "keystone-engine" ]; then
            depends+=("python-keystone")
        elif [ "$pipkg" == "pyqt6-qt6" ]; then
            depends+=("python-pyqt6")
        else
            depends+=("python-$pipkg")
        fi
    done

    # Add new depends
    source <(sed -n '/^PKG_NAMES_ARCH/p' install.sh)
    for dep in $PKG_NAMES_ARCH; do
        if [[ ! ${makedepends[*]} =~ $dep ]]; then
            msg2 'Added new depend '"$dep"''
            depends+=("${dep:-base-devel}")
        fi
    done

    depends=($(printf "%s\n" "${depends[@]}" | sort -u))

    install -Dm755 PINCE.py -t "${pkgdir}/usr/lib/pince/"
    cp -r GUI libpince media tr COPYING AUTHORS THANKS "${pkgdir}/usr/lib/pince/"
    install -d "${pkgdir}/usr/lib/pince/i18n"
    cp -r i18n/qm "${pkgdir}/usr/lib/pince/i18n"

    install -Dm644 COPYING COPYING.CC-BY -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 media/logo/ozgurozbek/pince_small_transparent.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.korcankaraokcu.PINCE.png"

    # Compile Python bytecode
    python -m compileall "${pkgdir}"
}
