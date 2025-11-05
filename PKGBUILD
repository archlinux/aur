# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Thomas Kowaliczek-Schmer <thomas.kowaliczek@posteo.de>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=unknown-horizons-git
_pkgname=${pkgname%-git}
pkgver=r201.300b9c3
pkgrel=2
pkgdesc="Open source real-time strategy game with the comfy Anno1602 feeling."
arch=('x86_64')
url="https://unknown-horizons.org/"
license=('GPL' 'CCPL')
makedepends=(git godot libfontconfig.so=1 godot-export-templates-linux)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$pkgname::git+https://github.com/$_pkgname/godot-port.git"
        "$pkgname.sh"
)
sha512sums=('SKIP'
            'dbeda401b4f0ad92376b062359ef5d359d8050407425f2a8bd0c402525cb704ae74eca063a0a713871ae3781eaa6e66be663d8454460dd61b247a9bf9f55bb5c'
)

pkgver() {
    cd "$pkgname" || exit 1
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    # https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=godot-export-templates-linux
    _godot_version=$(LC_ALL=C pacman -Si extra/godot | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])').stable

    sed --in-place --expression "s@custom_template/release=\"\"@custom_template/release=\"/usr/share/godot/export_templates/${_godot_version}/linux_release.x86_64\"@g" "$pkgname/export_presets.cfg"
}

build() {
    cd "$pkgname" || exit 1

    # Ensure folder structure exists.
    mkdir -p "Builds/Desktop"

    # Builds.
    godot --path . --export-release linux "Builds/Desktop/UnknownHorizons.x86_64" --headless
}

package() {
    install \
        -D \
        --mode=755 \
        "$pkgname.sh" \
        "$pkgdir/usr/bin/$_pkgname"

    # install data package
    install \
        -D \
        --mode=644 \
        --target-directory="$pkgdir/opt/$_pkgname" \
        "$pkgname/Builds/Desktop/UnknownHorizons.pck"

    # install binary
    install \
        -D \
        --mode=755 \
        --target-directory="$pkgdir/opt/$_pkgname" \
        "$pkgname/Builds/Desktop/UnknownHorizons.x86_64"
}
