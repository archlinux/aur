# Maintainer: nothing_glows <wppopqpu@outlook.com>

# slightly modified from waylyrics-git

pkgname=waylyrics-layer-shell-git
_pkgname=waylyrics
_appname="io.github.waylyrics.Waylyrics"
pkgver=0.4.0_r7.ga0bbd044
pkgrel=1
pkgdesc="the furry way to show desktop lyrics (git version, with layer-shell feature enabled)"
url="https://github.com/waylyrics/waylyrics"
conflicts=('waylyrics' 'waylyrics-git')
provides=('waylyrics')
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('openssl' 'hicolor-icon-theme' 'gtk4-layer-shell'
    # base
    'dbus' 'gcc-libs' 'glibc'
    # gtk4
    'glib2' 'cairo' 'dconf' 'gtk4'
    # restart task
    'sh'
    # i18n
    'gettext'
)
makedepends=('rust' 'git' 'jq')
optdepends=(
    'breeze-icons: better tray-icon icons'
    'xdg-desktop-portal: file dialog to import LRC'
)

source=("git+${url}.git")

sha256sums=('SKIP')

options=('!lto')

prepare() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target ${CARCH}-unknown-linux-gnu
}

pkgver() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    semver=$( cargo metadata --no-deps --format-version=1 |
        jq -r '.packages | .[0] | .version' )
    echo "${semver}_r$(git rev-list --count v${semver}..HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # template files
    export WAYLYRICS_THEME_PRESETS_DIR="/usr/share/${_pkgname}/themes"

    cargo build --release --all-targets --features layer-shell --ignore-rust-version
}


check() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export WAYLYRICS_THEME_PRESETS_DIR="/usr/share/${_pkgname}/themes"

    cargo test --release --features layer-shell --ignore-rust-version
}

package() {
    cd "${_pkgname}"

    install -vDm644 metainfo/"${_appname}.desktop" -t "${pkgdir}/usr/share/applications/"
    sed -i 's|^Exec=|Exec=env LD_PRELOAD=/usr/lib/libgtk4-layer-shell.so |' "${pkgdir}/usr/share/applications/${_appname}.desktop"

    install -vDm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -vDm644 metainfo/"${_appname}.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"

    install -vdm755 "${pkgdir}/usr/share/${_pkgname}/themes"
    cp -arv themes/* "${pkgdir}/usr/share/${_pkgname}/themes/"
    cp -arv res/icons "${pkgdir}/usr/share/icons"

    # Locale files
    (
        cd locales
        for po in $(find . -type f -name '*.po')
        do
            mkdir -p "${pkgdir}/usr/share/locale/${po#/*}"
            msgfmt -o "${pkgdir}/usr/share/locale/${po%.po}.mo" ${po}
        done
    )

    # License
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
